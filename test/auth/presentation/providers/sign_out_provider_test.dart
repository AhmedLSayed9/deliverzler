import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/auth/domain/use_cases/sign_out_uc.dart';
import 'package:deliverzler/auth/presentation/providers/auth_state_provider.dart';
import 'package:deliverzler/auth/presentation/providers/sign_out_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_out_provider_test.mocks.dart';

// Using mockito to keep track of when a provider notify its listeners
class Listener<T> extends Mock {
  void call(T? previous, T value);
}

@GenerateMocks([SignOutUC])
void main() {
  late MockSignOutUC mockSignOutUC;

  setUp(() {
    mockSignOutUC = MockSignOutUC();
  });

  ProviderContainer setUpContainer({List<Override>? overrides}) {
    final container = ProviderContainer(
      overrides: [
        if (overrides != null) ...overrides,
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  const tUser = User(
    id: '1',
    email: 'testEmail@gmail.com',
    name: 'testName',
    phone: '0123456789',
    image: 'https://www.image.com',
  );

  final tException = Exception('test_exception');
  final tStackTrace = StackTrace.current;

  group(
    'signOutStateProvider',
    () {
      const initialState = AsyncData<SignOutState>(SignOutState.initial);
      final errorState = AsyncError<SignOutState>(tException, tStackTrace);
      const successState = AsyncData<SignOutState>(SignOutState.success);

      Listener setUpListener(ProviderContainer container) {
        final listener = Listener<AsyncValue<void>>();
        container.listen(
          signOutStateProvider,
          listener,
          fireImmediately: true,
        );
        return listener;
      }

      Listener setUpAuthStateListener(ProviderContainer container) {
        final listener = Listener<AuthState>();
        container.listen(
          authStateControllerProvider,
          listener,
          fireImmediately: true,
        );
        return listener;
      }

      test(
        'should emit signOutProvider state when signOutTriggerProvider is true',
        () async {
          // GIVEN
          final container = setUpContainer(
            overrides: [
              signOutTriggerProvider.overrideWith((ref) => true),
              signOutProvider.overrideWith(
                (ref) => Error.throwWithStackTrace(tException, tStackTrace),
              ),
            ],
          );
          final listener = setUpListener(container);

          // WHEN
          final signOutStatus = container.read(signOutStateProvider);

          // THEN
          expect(signOutStatus, errorState);

          verify(listener(null, errorState));
          verifyNoMoreInteractions(listener);
        },
      );

      test(
        'should emit AsyncData(SignOutState.initial) when signOutTriggerProvider is false',
        () async {
          // GIVEN
          final container = setUpContainer(
            overrides: [
              signOutTriggerProvider.overrideWith((ref) => false),
            ],
          );
          final listener = setUpListener(container);

          // WHEN
          final signOutStatus = container.read(signOutStateProvider);

          // THEN
          expect(signOutStatus, initialState);

          verify(listener(null, initialState));
          verifyNoMoreInteractions(listener);
        },
      );

      test(
        'should unAuthenticate user when next state is SignOutState.success',
        () async {
          // GIVEN
          final container = setUpContainer(
            overrides: [
              signOutProvider.overrideWith((ref) => () {}),
            ],
          );
          final listener = setUpListener(container);
          container
              .read(authStateControllerProvider.notifier)
              .authenticateUser(tUser);
          final authListener = setUpAuthStateListener(container);

          // WHEN
          verify(listener(null, initialState));
          verifyNoMoreInteractions(listener);

          verify(authListener(null, AuthState.authenticated));
          verifyNoMoreInteractions(listener);

          container.read(signOutTriggerProvider.notifier).state = true;
          container.read(signOutStateProvider);

          // THEN
          verifyInOrder([
            authListener(AuthState.authenticated, AuthState.unauthenticated),
            listener(initialState, successState),
          ]);
          verifyNoMoreInteractions(authListener);
          verifyNoMoreInteractions(listener);
        },
      );
    },
  );

  group(
    'signOutTriggerProvider',
    () {
      test(
        'initial state should be false',
        () async {
          // GIVEN
          final container = ProviderContainer();
          addTearDown(container.dispose);

          // THEN
          expect(container.read(signOutTriggerProvider), false);
        },
      );
    },
  );

  group(
    'signOutProvider',
    () {
      const loadingState = AsyncLoading<void>();
      final errorState = AsyncError<void>(tException, tStackTrace);
      const dataState = AsyncData<void>(null);

      Listener setUpListener(ProviderContainer container) {
        final listener = Listener();
        container.listen(
          signOutProvider,
          listener,
          fireImmediately: true,
        );
        return listener;
      }

      Listener setUpAuthStateListener(ProviderContainer container) {
        final listener = Listener<AuthState>();
        container.listen(
          authStateControllerProvider,
          listener,
          fireImmediately: true,
        );
        return listener;
      }

      test(
        'should emit AsyncData(void) when use case returns normally',
        () async {
          // GIVEN
          when(mockSignOutUC()).thenAnswer((_) => Future.value());

          final container = setUpContainer(
            overrides: [
              signOutUCProvider.overrideWith((ref) => mockSignOutUC),
            ],
          );
          final listener = setUpListener(container);

          // WHEN
          verify(listener(null, loadingState));
          verifyNoMoreInteractions(listener);

          final call = container.read(signOutProvider.future);

          // THEN
          await expectLater(call, completes);

          verifyInOrder([
            mockSignOutUC(),
            listener(loadingState, dataState),
          ]);
          verifyNoMoreInteractions(mockSignOutUC);
          verifyNoMoreInteractions(listener);
        },
      );

      test(
        'should emit AsyncError when use case throws',
        () async {
          // GIVEN
          when(mockSignOutUC()).thenAnswer(
            (_) => Error.throwWithStackTrace(tException, tStackTrace),
          );

          final container = setUpContainer(
            overrides: [
              signOutUCProvider.overrideWithValue(mockSignOutUC),
            ],
          );
          final listener = setUpListener(container);
          container
              .read(authStateControllerProvider.notifier)
              .authenticateUser(tUser);
          final authListener = setUpAuthStateListener(container);

          // WHEN
          verify(listener(null, loadingState));
          verifyNoMoreInteractions(listener);

          verify(authListener(null, AuthState.authenticated));
          verifyNoMoreInteractions(listener);

          final call = container.read(signOutProvider.future);

          // THEN
          await expectLater(call, throwsA(tException));

          verifyInOrder([
            mockSignOutUC(),
            listener(loadingState, errorState),
          ]);
          verifyNoMoreInteractions(mockSignOutUC);
          verifyNoMoreInteractions(listener);
          verifyNoMoreInteractions(authListener);
        },
      );
    },
  );
}

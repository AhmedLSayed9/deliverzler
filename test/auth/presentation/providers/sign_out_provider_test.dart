// ignore_for_file: invalid_use_of_visible_for_overriding_member

import 'package:deliverzler/core/presentation/providers/provider_utils.dart';
import 'package:deliverzler/core/presentation/utils/functional.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/auth/domain/use_cases/sign_out_uc.dart';
import 'package:deliverzler/auth/presentation/providers/auth_state_provider.dart';
import 'package:deliverzler/auth/presentation/providers/sign_out_provider.dart';

class MockSignOutUC extends Mock implements SignOutUC {}

class MockSignOutEvent extends AutoDisposeNotifier<Option<Event<void>>>
    with Mock
    implements SignOutEvent {}

// Using mockito to keep track of when a provider notify its listeners
class Listener<T> extends Mock {
  void call(T? previous, T value);
}

void main() {
  late MockSignOutUC mockSignOutUC;
  late MockSignOutEvent mockSignOutEvent;

  setUp(() {
    mockSignOutUC = MockSignOutUC();
    mockSignOutEvent = MockSignOutEvent();
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

  final tEvent = Event.unique(null);
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
      const idleState = AsyncData<SignOutState>(SignOutState.idle);
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
        'should emit signOutProvider state when signOutEventProvider is some',
        () async {
          // GIVEN
          when(mockSignOutEvent.build).thenReturn(Some(tEvent));

          final container = setUpContainer(
            overrides: [
              signOutEventProvider.overrideWith(() => mockSignOutEvent),
              signOutProvider(tEvent).overrideWith(
                (ref) => Error.throwWithStackTrace(tException, tStackTrace),
              ),
            ],
          );
          final listener = setUpListener(container);

          // WHEN
          final signOutStatus = container.read(signOutStateProvider);

          // THEN
          expect(signOutStatus, errorState);

          verify(() => listener(null, errorState));
          verifyNoMoreInteractions(listener);
        },
      );

      test(
        'should emit AsyncData(SignOutState.idle) when signOutEventProvider is none',
        () async {
          // GIVEN
          when(mockSignOutEvent.build).thenReturn(const None());

          final container = setUpContainer(
            overrides: [
              signOutEventProvider.overrideWith(() => mockSignOutEvent),
            ],
          );
          final listener = setUpListener(container);

          // WHEN
          final signOutStatus = container.read(signOutStateProvider);

          // THEN
          expect(signOutStatus, idleState);

          verify(() => listener(null, idleState));
          verifyNoMoreInteractions(listener);
        },
      );

      test(
        'should unAuthenticate user when next state is SignOutState.success',
        () async {
          // GIVEN
          final container = setUpContainer(
            overrides: [
              signOutProvider(tEvent).overrideWith((ref) => tEvent),
            ],
          );
          final listener = setUpListener(container);
          container
              .read(authStateControllerProvider.notifier)
              .authenticateUser(tUser);
          final authListener = setUpAuthStateListener(container);

          // WHEN
          verify(() => listener(null, idleState));
          verifyNoMoreInteractions(listener);

          verify(() => authListener(null, AuthState.authenticated));
          verifyNoMoreInteractions(listener);

          container
              .read(signOutEventProvider.notifier)
              .update((_) => Some(tEvent));
          container.read(signOutStateProvider);

          // THEN
          verifyInOrder([
            () => authListener(
                AuthState.authenticated, AuthState.unauthenticated),
            () => listener(idleState, successState),
          ]);
          verifyNoMoreInteractions(authListener);
          verifyNoMoreInteractions(listener);
        },
      );
    },
  );

  group(
    'signOutEventProvider',
    () {
      test(
        'initial state should be none',
        () async {
          // GIVEN
          final container = ProviderContainer();
          addTearDown(container.dispose);

          // THEN
          expect(container.read(signOutEventProvider), const None());
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
          signOutProvider(tEvent),
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
          when(() => mockSignOutUC()).thenAnswer((_) => Future.value());

          final container = setUpContainer(
            overrides: [
              signOutUCProvider.overrideWith((ref) => mockSignOutUC),
            ],
          );
          final listener = setUpListener(container);

          // WHEN
          verify(() => listener(null, loadingState));
          verifyNoMoreInteractions(listener);

          final call = container.read(signOutProvider(tEvent).future);

          // THEN
          await expectLater(call, completes);

          verifyInOrder([
            () => mockSignOutUC(),
            () => listener(loadingState, dataState),
          ]);
          verifyNoMoreInteractions(mockSignOutUC);
          verifyNoMoreInteractions(listener);
        },
      );

      test(
        'should emit AsyncError when use case throws',
        () async {
          // GIVEN
          when(() => mockSignOutUC()).thenAnswer(
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
          verify(() => listener(null, loadingState));
          verifyNoMoreInteractions(listener);

          verify(() => authListener(null, AuthState.authenticated));
          verifyNoMoreInteractions(listener);

          final call = container.read(signOutProvider(tEvent).future);

          // THEN
          await expectLater(call, throwsA(tException));

          verifyInOrder([
            () => mockSignOutUC(),
            () => listener(loadingState, errorState),
          ]);
          verifyNoMoreInteractions(mockSignOutUC);
          verifyNoMoreInteractions(listener);
          verifyNoMoreInteractions(authListener);
        },
      );
    },
  );
}

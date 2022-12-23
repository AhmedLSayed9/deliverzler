import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/auth/domain/use_cases/sign_in_with_email_uc.dart';
import 'package:deliverzler/auth/presentation/providers/auth_state_provider.dart';
import 'package:deliverzler/auth/presentation/providers/sign_in_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_provider_test.mocks.dart';

// Using mockito to keep track of when a provider notify its listeners
class Listener<T> extends Mock {
  void call(T? previous, T value);
}

@GenerateMocks([SignInWithEmailUC])
void main() {
  late MockSignInWithEmailUC mockSignInWithEmailUC;

  setUp(() {
    mockSignInWithEmailUC = MockSignInWithEmailUC();
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

  const tParams = SignInWithEmailParams(email: 'tEmail', password: 'tPass');
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
    'signInStateProvider',
    () {
      const initialState = AsyncData<Option<User>>(None());
      const successState = AsyncData<Option<User>>(Some(tUser));

      Listener setUpListener(ProviderContainer container) {
        final listener = Listener<AsyncValue<void>>();
        container.listen(
          signInStateProvider,
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
        'should emit signInWithEmailProvider state when signInWithEmailParamsProvider is some',
        () async {
          // GIVEN
          final container = setUpContainer(
            overrides: [
              signInWithEmailParamsProvider
                  .overrideWith((ref) => const Some(tParams)),
              signInWithEmailProvider(tParams).overrideWith((ref) => tUser),
            ],
          );
          final listener = setUpListener(container);

          // WHEN
          final signInState = container.read(signInStateProvider);

          // THEN
          expect(signInState, successState);

          verify(listener(null, successState));
          verifyNoMoreInteractions(listener);
        },
      );

      test(
        'should emit initialState when signInWithEmailParamsProvider is none',
        () async {
          // GIVEN
          final container = setUpContainer(
            overrides: [
              signInWithEmailParamsProvider.overrideWith((ref) => const None()),
            ],
          );
          final listener = setUpListener(container);

          // WHEN
          final signInState = container.read(signInStateProvider);

          // THEN
          expect(signInState, initialState);

          verify(listener(null, initialState));
          verifyNoMoreInteractions(listener);
        },
      );

      test(
        'should authenticate user when next state is success (some)',
        () async {
          // GIVEN
          final container = setUpContainer(
            overrides: [
              signInWithEmailProvider(tParams).overrideWith((ref) => tUser),
            ],
          );
          final authListener = setUpAuthStateListener(container);
          final listener = setUpListener(container);

          // WHEN
          verify(authListener(null, AuthState.unauthenticated));
          verifyNoMoreInteractions(authListener);

          verify(listener(null, initialState));
          verifyNoMoreInteractions(listener);

          container.read(signInWithEmailParamsProvider.notifier).state =
              const Some(tParams);
          container.read(signInStateProvider);

          // THEN
          verifyInOrder([
            authListener(AuthState.unauthenticated, AuthState.authenticated),
            listener(initialState, successState),
          ]);
          verifyNoMoreInteractions(authListener);
          verifyNoMoreInteractions(listener);
        },
      );
    },
  );

  group(
    'signInWithEmailParamsProvider',
    () {
      test(
        'initial state should be none',
        () async {
          // GIVEN
          final container = ProviderContainer();
          addTearDown(container.dispose);

          // THEN
          expect(container.read(signInWithEmailParamsProvider), const None());
        },
      );
    },
  );

  group(
    'signInWithEmailProvider',
    () {
      const loadingState = AsyncLoading<User>();
      final errorState = AsyncError<User>(tException, tStackTrace);
      const dataState = AsyncData<User>(tUser);

      Listener setUpListener(
          ProviderContainer container, SignInWithEmailParams params) {
        final listener = Listener();
        container.listen(
          signInWithEmailProvider(params),
          listener,
          fireImmediately: true,
        );
        return listener;
      }

      test(
        'should emit AsyncData(user) when use case returns normally',
        () async {
          // GIVEN
          when(mockSignInWithEmailUC(tParams)).thenAnswer((_) async => tUser);

          final container = setUpContainer(
            overrides: [
              signInWithEmailUCProvider
                  .overrideWith((ref) => mockSignInWithEmailUC),
            ],
          );
          final listener = setUpListener(container, tParams);

          // WHEN
          verify(listener(null, loadingState));
          verifyNoMoreInteractions(listener);

          final call = container.read(signInWithEmailProvider(tParams).future);

          // THEN
          await expectLater(call, completion(tUser));

          verifyInOrder([
            mockSignInWithEmailUC(tParams),
            listener(loadingState, dataState),
          ]);
          verifyNoMoreInteractions(mockSignInWithEmailUC);
          verifyNoMoreInteractions(listener);
        },
      );

      test(
        'should emit AsyncError when use case throws',
        () async {
          // GIVEN
          when(mockSignInWithEmailUC(tParams)).thenAnswer(
            (_) => Error.throwWithStackTrace(tException, tStackTrace),
          );

          final container = setUpContainer(
            overrides: [
              signInWithEmailUCProvider
                  .overrideWith((ref) => mockSignInWithEmailUC),
            ],
          );
          final listener = setUpListener(container, tParams);

          // WHEN
          verify(listener(null, loadingState));
          verifyNoMoreInteractions(listener);

          final call = container.read(signInWithEmailProvider(tParams).future);

          // THEN
          await expectLater(call, throwsA(tException));

          verifyInOrder([
            mockSignInWithEmailUC(tParams),
            listener(loadingState, errorState),
          ]);
          verifyNoMoreInteractions(mockSignInWithEmailUC);
          verifyNoMoreInteractions(listener);
        },
      );
    },
  );
}

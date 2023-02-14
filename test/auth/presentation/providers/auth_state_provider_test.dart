import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/auth/presentation/providers/auth_state_provider.dart';
import 'package:deliverzler/auth/presentation/providers/user_provider.dart';
import 'package:deliverzler/core/presentation/utils/functional.dart';

// Using mockito to keep track of when a provider notify its listeners
class Listener<T> extends Mock {
  void call(T? previous, T value);
}

void main() {
  ProviderContainer setUpContainer() {
    final container = ProviderContainer();
    addTearDown(container.dispose);
    return container;
  }

  Listener setUpListener(ProviderContainer container) {
    final listener = Listener<AuthState>();
    container.listen(
      authStateControllerProvider,
      listener,
      fireImmediately: true,
    );
    return listener;
  }

  Listener setUpUserListener(ProviderContainer container) {
    final listener = Listener<Option<User>>();
    container.listen<Option<User>>(
      userControllerProvider,
      listener,
      fireImmediately: true,
    );
    return listener;
  }

  const tUser = User(
    id: '1',
    email: 'testEmail@gmail.com',
    name: 'testName',
    phone: '0123456789',
    image: 'https://www.image.com',
  );
  const noneUser = None<User>();
  final someUser = some<User>(tUser);

  const authenticatedState = AuthState.authenticated;
  const unauthenticatedState = AuthState.unauthenticated;

  group(
    'build',
    () {
      test(
        'initial state should be AuthState.unauthenticated',
        () {
          // GIVEN
          final container = setUpContainer();
          final listener = setUpListener(container);

          // THEN
          verify(() => listener(null, unauthenticatedState));
          verifyNoMoreInteractions(listener);
        },
      );
    },
  );

  group(
    'authenticateUser',
    () {
      test(
        'should call userControllerProvider.setUser'
        'then emit AuthState.authenticated',
        () async {
          // GIVEN
          final container = setUpContainer();
          final listener = setUpListener(container);
          final userListener = setUpUserListener(container);

          // WHEN
          verify(() => listener(null, unauthenticatedState));
          verifyNoMoreInteractions(listener);

          verify(() => userListener(null, noneUser));
          verifyNoMoreInteractions(userListener);

          container
              .read(authStateControllerProvider.notifier)
              .authenticateUser(tUser);

          // THEN
          verifyInOrder([
            () => userListener(noneUser, someUser),
            () => listener(unauthenticatedState, authenticatedState),
          ]);
          verifyNoMoreInteractions(listener);
          verifyNoMoreInteractions(userListener);
        },
      );
    },
  );

  group(
    'unAuthenticateUser',
    () {
      test(
        'should emit AuthState.unauthenticated'
        'then invalidate userControllerProvider with a delay of 1 second',
        () async {
          // GIVEN
          final container = setUpContainer();
          container
              .read(authStateControllerProvider.notifier)
              .authenticateUser(tUser);
          final listener = setUpListener(container);
          final userListener = setUpUserListener(container);

          // WHEN
          verify(() => listener(null, authenticatedState));
          verifyNoMoreInteractions(listener);

          verify(() => userListener(null, someUser));
          verifyNoMoreInteractions(userListener);

          container
              .read(authStateControllerProvider.notifier)
              .unAuthenticateUser();

          // THEN
          verify(() => listener(authenticatedState, unauthenticatedState));
          verifyNoMoreInteractions(listener);

          await expectLater(
            await Future.delayed(const Duration(seconds: 1), () {
              return container.read(userControllerProvider);
            }),
            noneUser,
          );
          verify(() => userListener(someUser, noneUser));
          verifyNoMoreInteractions(userListener);
        },
      );
    },
  );
}

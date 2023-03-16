import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/auth/presentation/providers/auth_state_provider.dart';
import 'package:deliverzler/core/presentation/utils/fp_framework.dart';
import 'package:deliverzler/core/presentation/utils/riverpod_framework.dart';

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

  Listener<Option<User>> setUpListener(ProviderContainer container) {
    final listener = Listener<Option<User>>();
    container.listen(
      authStateProvider,
      listener,
      fireImmediately: true,
    );
    return listener;
  }

  Listener<AsyncValue<User>> setUpUserListener(ProviderContainer container) {
    final listener = Listener<AsyncValue<User>>();
    container.listen(
      currentUserStateProvider,
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
  const loadingState = AsyncLoading<User>();
  const dataState = AsyncData<User>(tUser);

  const authenticatedState = Some<User>(tUser);
  const unauthenticatedState = None<User>();

  group(
    'build',
    () {
      test(
        'initial state should be none',
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
        'should emit some user',
        () async {
          // GIVEN
          final container = setUpContainer();
          final listener = setUpListener(container);
          final userListener = setUpUserListener(container);

          // WHEN
          verify(() => listener(null, unauthenticatedState));
          verifyNoMoreInteractions(listener);

          verify(() => userListener(null, loadingState));
          verifyNoMoreInteractions(userListener);

          container.read(authStateProvider.notifier).authenticateUser(tUser);

          // THEN
          await expectLater(
              container.read(currentUserStateProvider), dataState);

          verifyInOrder([
            () => listener(unauthenticatedState, authenticatedState),
            () => userListener(loadingState, dataState),
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
        'should emit none',
        () async {
          // GIVEN
          final container = setUpContainer();
          container.read(authStateProvider.notifier).authenticateUser(tUser);
          final listener = setUpListener(container);
          final userListener = setUpUserListener(container);

          // WHEN
          verify(() => listener(null, authenticatedState));
          verifyNoMoreInteractions(listener);

          verify(() => userListener(null, dataState));
          verifyNoMoreInteractions(userListener);

          container.read(authStateProvider.notifier).unAuthenticateUser();

          // THEN
          verify(() => listener(authenticatedState, unauthenticatedState));
          verifyNoMoreInteractions(listener);

          final loadingWithPrevData = loadingState.copyWithPrevious(
            dataState,
            isRefresh: false,
          );

          expect(container.read(currentUserStateProvider), loadingWithPrevData);

          verify(() => userListener(dataState, loadingWithPrevData));
          verifyNoMoreInteractions(userListener);
        },
      );
    },
  );
}

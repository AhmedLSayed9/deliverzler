import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/auth/domain/user.dart';
import 'package:deliverzler/auth/presentation/providers/auth_state_provider.dart';
import 'package:deliverzler/core/presentation/utils/fp_framework.dart';
import 'package:deliverzler/core/presentation/utils/riverpod_framework.dart';
import '../../../utils.dart';

void main() {
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
  const unauthenticatedState = None();

  group(
    'build',
    () {
      test(
        'initial state should be none',
        () {
          // GIVEN
          final container = setUpContainer();
          final listener = setUpListener(container, authStateProvider);

          // THEN
          verifyOnly(listener, () => listener(null, unauthenticatedState));
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
          final authListener = setUpListener(container, authStateProvider);
          final userListener = setUpListener(container, currentUserStateProvider);

          // WHEN
          verifyOnly(
            authListener,
            () => authListener(null, unauthenticatedState),
          );

          verifyOnly(userListener, () => userListener(null, loadingState));

          container.read(authStateProvider.notifier).authenticateUser(tUser);
          await container.pump();

          // THEN
          verifyInOrder([
            () => authListener(unauthenticatedState, authenticatedState),
            () => userListener(loadingState, dataState),
          ]);
          verifyNoMoreInteractions(authListener);
          verifyNoMoreInteractions(userListener);
        },
      );
    },
  );

  group(
    'unAuthenticateUser',
    () {
      setUp(() {
        registerFallbackValue(const AsyncLoading<User>());
      });

      test(
        'should emit none',
        () async {
          // GIVEN
          final container = setUpContainer();
          container.read(authStateProvider.notifier).authenticateUser(tUser);
          final authListener = setUpListener(container, authStateProvider);
          final userListener = setUpListener(container, currentUserStateProvider);

          // WHEN
          verifyOnly(
            authListener,
            () => authListener(null, authenticatedState),
          );

          verifyOnly(userListener, () => userListener(null, dataState));

          container.read(authStateProvider.notifier).unAuthenticateUser();
          await container.pump();

          // THEN
          verifyInOrder([
            () => authListener(authenticatedState, unauthenticatedState),
            () => userListener(dataState, any(that: isA<AsyncLoading<User>>())),
          ]);
          verifyNoMoreInteractions(authListener);
          verifyNoMoreInteractions(userListener);
        },
      );
    },
  );
}

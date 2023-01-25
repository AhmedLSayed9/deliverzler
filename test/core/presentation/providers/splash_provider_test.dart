import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/auth/domain/use_cases/check_auth_uc.dart';
import 'package:deliverzler/auth/presentation/providers/auth_state_provider.dart';
import 'package:deliverzler/auth/presentation/providers/user_provider.dart';
import 'package:deliverzler/core/data/network/network_info.dart';
import 'package:deliverzler/core/presentation/routing/route_paths.dart';
import 'package:deliverzler/core/presentation/providers/splash_provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:deliverzler/core/presentation/utils/functional.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

class MockINetworkInfo extends Mock implements INetworkInfo {}

class MockCheckAuthUC extends Mock implements CheckAuthUC {}

class Listener<T> extends Mock {
  void call(T? previous, T value);
}

void main() {
  late MockINetworkInfo mockINetworkInfo;
  late MockCheckAuthUC mockCheckAuthUC;

  setUp(() {
    mockINetworkInfo = MockINetworkInfo();
    mockCheckAuthUC = MockCheckAuthUC();
  });

  const tUser = User(
    id: '1',
    email: 'testEmail@gmail.com',
    name: 'testName',
    phone: '0123456789',
    image: 'https://www.image.com',
  );
  const authGuardPath = RoutePaths.authGuard;
  const noInternetPath = RoutePaths.coreNoInternet;

  const loadingState = AsyncLoading<String>();
  const authGuardState = AsyncData<String>(authGuardPath);
  const noInternetState = AsyncData<String>(noInternetPath);

  group(
    'splashProvider',
    () {
      ProviderContainer setUpContainer({List<Override>? overrides}) {
        final container = ProviderContainer(
          overrides: [
            networkInfoProvider.overrideWithValue(mockINetworkInfo),
            if (overrides != null) ...overrides,
          ],
        );
        addTearDown(container.dispose);
        return container;
      }

      Listener setUpListener(ProviderContainer container) {
        final listener = Listener<AsyncValue<String>>();
        container.listen(
          splashProvider,
          listener,
          fireImmediately: true,
        );
        return listener;
      }

      test(
        'should emit checkAuthProvider future when hasInternetConnection is true',
        () async {
          // GIVEN
          when(() => mockINetworkInfo.hasInternetConnection)
              .thenAnswer((_) async => true);

          const tCheckAuthPath = 'tPath';
          final container = setUpContainer(
            overrides: [
              checkAuthProvider.overrideWith((ref) => tCheckAuthPath),
            ],
          );
          final listener = setUpListener(container);

          // WHEN
          verify(() => listener(null, loadingState));
          verifyNoMoreInteractions(listener);

          final call = container.read(splashProvider.future);

          // THEN
          await expectLater(call, completion(tCheckAuthPath));

          verifyInOrder([
            () => mockINetworkInfo.hasInternetConnection,
            () =>
                listener(loadingState, const AsyncData<String>(tCheckAuthPath)),
          ]);
          verifyNoMoreInteractions(mockINetworkInfo);
          verifyNoMoreInteractions(listener);
        },
      );

      test(
        'should emit AsyncData(noInternetPath) when hasInternetConnection is false',
        () async {
          // GIVEN
          when(() => mockINetworkInfo.hasInternetConnection)
              .thenAnswer((_) async => false);

          final container = setUpContainer();
          final listener = setUpListener(container);

          // WHEN
          verify(() => listener(null, loadingState));
          verifyNoMoreInteractions(listener);

          final call = container.read(splashProvider.future);

          // THEN
          await expectLater(call, completion(noInternetPath));

          verifyInOrder([
            () => mockINetworkInfo.hasInternetConnection,
            () => listener(loadingState, noInternetState),
          ]);
          verifyNoMoreInteractions(mockINetworkInfo);
          verifyNoMoreInteractions(listener);
        },
      );
    },
  );

  group(
    'checkAuthProvider',
    () {
      ProviderContainer setUpContainer() {
        final container = ProviderContainer(
          overrides: [
            checkAuthUCProvider.overrideWithValue(mockCheckAuthUC),
          ],
        );
        addTearDown(container.dispose);
        return container;
      }

      Listener setUpListener(ProviderContainer container) {
        final listener = Listener<AsyncValue<String>>();
        container.listen(
          checkAuthProvider,
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
        'should authenticate user when CheckAuthUC returns normally'
        'then emit AsyncData(authGuardPath)',
        () async {
          // GIVEN
          when(() => mockCheckAuthUC()).thenAnswer((_) async => tUser);

          final container = setUpContainer();
          final listener = setUpListener(container);
          final authListener = setUpAuthStateListener(container);

          // WHEN
          verify(() => listener(null, loadingState));
          verifyNoMoreInteractions(listener);

          verify(() => authListener(null, AuthState.unauthenticated));
          verifyNoMoreInteractions(listener);

          final call = container.read(checkAuthProvider.future);

          // THEN
          await expectLater(call, completion(authGuardPath));

          verifyInOrder([
            () => mockCheckAuthUC(),
            () => authListener(
                  AuthState.unauthenticated,
                  AuthState.authenticated,
                ),
            () => listener(loadingState, authGuardState),
          ]);
          verifyNoMoreInteractions(mockCheckAuthUC);
          verifyNoMoreInteractions(listener);
          verifyNoMoreInteractions(authListener);

          expect(container.read(userControllerProvider), some<User>(tUser));
        },
      );

      test(
        'should not authenticate user when CheckAuthUC throws'
        'then emit AsyncData(authGuardPath)',
        () async {
          // GIVEN
          final tException = Exception('test_exception');
          final tStackTrace = StackTrace.current;
          when(() => mockCheckAuthUC()).thenAnswer(
            (_) => Error.throwWithStackTrace(tException, tStackTrace),
          );

          final container = setUpContainer();
          final listener = setUpListener(container);
          final authListener = setUpAuthStateListener(container);

          // WHEN
          verify(() => listener(null, loadingState));
          verifyNoMoreInteractions(listener);

          verify(() => authListener(null, AuthState.unauthenticated));
          verifyNoMoreInteractions(listener);

          final call = container.read(checkAuthProvider.future);

          // THEN
          await expectLater(call, completion(authGuardPath));

          verifyInOrder([
            () => mockCheckAuthUC(),
            () => listener(loadingState, authGuardState),
          ]);
          verifyNoMoreInteractions(mockCheckAuthUC);
          verifyNoMoreInteractions(listener);
          verifyNoMoreInteractions(authListener);
        },
      );
    },
  );
}

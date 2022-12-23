import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/auth/infrastructure/repos/auth_repo.dart';
import 'package:deliverzler/core/infrastructure/network/network_info.dart';
import 'package:deliverzler/core/presentation/providers/splash_providers.dart';
import 'package:deliverzler/core/presentation/routing/app_router.dart';
import 'package:deliverzler/core/presentation/utils/riverpod_framework.dart';
import '../../../utils.dart';

class MockNetworkInfo extends Mock implements NetworkInfo {}

class MockAuthRepo extends Mock implements AuthRepo {}

void main() {
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
  });

  final signInPath = const SignInRoute().location;
  final noInternetPath = const NoInternetRoute().location;

  const loadingState = AsyncLoading<String>();
  final noInternetState = AsyncData<String>(noInternetPath);
  group(
    'splashTargetProvider',
    () {
      test(
        'should emit signInPath when hasInternetConnection is true',
        () async {
          // GIVEN
          when(() => mockNetworkInfo.hasInternetConnection)
              .thenAnswer((_) async => true);

          final container = setUpContainer(
            overrides: [
              networkInfoProvider.overrideWith((ref) => mockNetworkInfo)
            ],
          );
          final listener = setUpListener(container, splashTargetProvider);

          // WHEN
          verifyOnly(listener, () => listener(null, loadingState));

          final call = container.read(splashTargetProvider.future);

          // THEN
          await expectLater(call, completion(signInPath));

          verifyInOrder([
            () => mockNetworkInfo.hasInternetConnection,
            () => listener(loadingState, AsyncData<String>(signInPath)),
          ]);
          verifyNoMoreInteractions(mockNetworkInfo);
          verifyNoMoreInteractions(listener);
        },
      );

      test(
        'should emit noInternetPath when hasInternetConnection is false',
        () async {
          // GIVEN
          when(() => mockNetworkInfo.hasInternetConnection)
              .thenAnswer((_) async => false);

          final container = setUpContainer(
            overrides: [
              networkInfoProvider.overrideWith((ref) => mockNetworkInfo)
            ],
          );
          final listener = setUpListener(container, splashTargetProvider);

          // WHEN
          verifyOnly(listener, () => listener(null, loadingState));

          final call = container.read(splashTargetProvider.future);

          // THEN
          await expectLater(call, completion(noInternetPath));

          verifyInOrder([
            () => mockNetworkInfo.hasInternetConnection,
            () => listener(loadingState, noInternetState),
          ]);
          verifyNoMoreInteractions(mockNetworkInfo);
          verifyNoMoreInteractions(listener);
        },
      );
    },
  );
}

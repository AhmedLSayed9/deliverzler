import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/auth/data/repos/auth_repo.dart';
import 'package:deliverzler/auth/domain/repos/i_auth_repo.dart';
import 'package:deliverzler/auth/domain/use_cases/sign_out_uc.dart';
import 'package:deliverzler/core/presentation/services/fcm_service/fcm_provider.dart';
import 'package:deliverzler/core/presentation/utils/riverpod_framework.dart';

class MockIAuthRepo extends Mock implements IAuthRepo {}

class MockFirebaseMessaging extends Mock implements FirebaseMessaging {}

void main() {
  late MockIAuthRepo mockIAuthRepo;
  late MockFirebaseMessaging mockFirebaseMessaging;

  setUp(() {
    mockIAuthRepo = MockIAuthRepo();
    mockFirebaseMessaging = MockFirebaseMessaging();
  });

  ProviderContainer setUpContainer() {
    final container = ProviderContainer(
      overrides: [
        authRepoProvider.overrideWithValue(mockIAuthRepo),
        fcmProvider.overrideWithValue(mockFirebaseMessaging),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  final tException = Exception('test_exception');

  group(
    'call',
    () {
      test(
        'should call subscribeToTopic and return proper data when Repo.signOut returns normally',
        () async {
          // GIVEN
          when(() => mockIAuthRepo.signOut())
              .thenAnswer((_) async => Future.value());
          when(() => mockFirebaseMessaging.unsubscribeFromTopic(any()))
              .thenAnswer((_) async => Future.value());

          final container = setUpContainer();

          // WHEN
          final useCase = container.read(signOutUCProvider);
          await useCase();

          // THEN
          verify(() => mockIAuthRepo.signOut()).called(1);
          verify(
            () => mockFirebaseMessaging.unsubscribeFromTopic('general'),
          ).called(1);
          verifyNoMoreInteractions(mockIAuthRepo);
        },
      );

      test(
        'should throw same Exception when Repo.signOut throws',
        () async {
          // GIVEN
          when(() => mockIAuthRepo.signOut()).thenThrow(tException);

          final container = setUpContainer();

          // WHEN
          final useCase = container.read(signOutUCProvider);
          final call = useCase();

          // THEN
          await expectLater(() => call, throwsA(tException));
          verify(() => mockIAuthRepo.signOut()).called(1);
          verifyNoMoreInteractions(mockIAuthRepo);
        },
      );
    },
  );
}

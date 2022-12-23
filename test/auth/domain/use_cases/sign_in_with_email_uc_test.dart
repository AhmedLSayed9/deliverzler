import 'package:deliverzler/auth/data/repos/auth_repo.dart';
import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/auth/domain/repos/i_auth_repo.dart';
import 'package:deliverzler/auth/domain/use_cases/get_user_data_uc.dart';
import 'package:deliverzler/auth/domain/use_cases/sign_in_with_email_uc.dart';
import 'package:deliverzler/core/presentation/services/fcm_service/fcm_provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'sign_in_with_email_uc_test.mocks.dart';

@GenerateMocks([IAuthRepo, FirebaseMessaging, GetUserDataUC])
void main() {
  late MockIAuthRepo mockIAuthRepo;
  late MockFirebaseMessaging mockFirebaseMessaging;
  late MockGetUserDataUC mockGetUserDataUC;

  setUp(() {
    mockIAuthRepo = MockIAuthRepo();
    mockFirebaseMessaging = MockFirebaseMessaging();
    mockGetUserDataUC = MockGetUserDataUC();
  });

  ProviderContainer setUpContainer() {
    final container = ProviderContainer(
      overrides: [
        authRepoProvider.overrideWithValue(mockIAuthRepo),
        fcmProvider.overrideWithValue(mockFirebaseMessaging),
        getUserDataUCProvider.overrideWithValue(mockGetUserDataUC),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  const tUserFromCredential = User(
    id: '1',
    email: 'testEmail@gmail.com',
    name: null,
    phone: null,
    image: null,
  );

  const tUser = User(
    id: '1',
    email: 'testEmail@gmail.com',
    name: 'testName',
    phone: '0123456789',
    image: 'https://www.image.com',
  );

  final tException = Exception('test_exception');

  const tParams = SignInWithEmailParams(email: 'tEmail', password: 'tPassword');
  const tTopic = 'general';

  group(
    'call',
    () {
      test(
        'should call GetUserDataUC when Repo.signInWithEmail returns normally'
        'then call subscribeToTopic and return proper data when GetUserDataUC returns normally',
        () async {
          // GIVEN
          when(mockIAuthRepo.signInWithEmail(any))
              .thenAnswer((_) async => tUserFromCredential);
          when(mockGetUserDataUC.call(tUserFromCredential.id))
              .thenAnswer((_) async => tUser);
          when(mockFirebaseMessaging.subscribeToTopic(any))
              .thenAnswer((_) async => returnsNormally);

          final container = setUpContainer();

          // WHEN
          final useCase = container.read(signInWithEmailUCProvider);
          final result = await useCase(tParams);

          // THEN
          verify(mockIAuthRepo.signInWithEmail(tParams)).called(1);

          verify(mockGetUserDataUC.call(tUserFromCredential.id)).called(1);
          verify(mockFirebaseMessaging.subscribeToTopic(tTopic)).called(1);
          expect(result, tUser);

          verifyNoMoreInteractions(mockIAuthRepo);
          verifyNoMoreInteractions(mockFirebaseMessaging);
          verifyNoMoreInteractions(mockGetUserDataUC);
        },
      );

      test(
        'should call GetUserDataUC when Repo.signInWithEmail returns normally'
        'should throw same Exception when GetUserDataUC throws',
        () async {
          // GIVEN
          when(mockIAuthRepo.signInWithEmail(any))
              .thenAnswer((_) async => tUserFromCredential);
          when(mockGetUserDataUC.call(tUserFromCredential.id))
              .thenThrow(tException);

          final container = setUpContainer();

          // WHEN
          final useCase = container.read(signInWithEmailUCProvider);
          final call = useCase(tParams);

          // THEN
          await expectLater(() => call, throwsA(tException));

          verify(mockIAuthRepo.signInWithEmail(tParams)).called(1);
          verify(mockGetUserDataUC.call(tUserFromCredential.id)).called(1);
          verifyNever(mockFirebaseMessaging.subscribeToTopic(tTopic));

          verifyNoMoreInteractions(mockIAuthRepo);
          verifyNoMoreInteractions(mockFirebaseMessaging);
          verifyNoMoreInteractions(mockGetUserDataUC);
        },
      );

      test(
        'should throw same Exception when Repo.signInWithEmail throws',
        () async {
          // GIVEN
          when(mockIAuthRepo.signInWithEmail(any)).thenThrow(tException);

          final container = setUpContainer();

          // WHEN
          final useCase = container.read(signInWithEmailUCProvider);
          final call = useCase(tParams);

          // THEN
          await expectLater(() => call, throwsA(tException));

          verify(mockIAuthRepo.signInWithEmail(tParams)).called(1);
          verifyNoMoreInteractions(mockIAuthRepo);
        },
      );
    },
  );

  group(
    'SignInWithEmailParams toMap',
    () {
      test(
        'should return a map containing the proper data',
        () async {
          // WHEN
          final result = tParams.toMap();

          // THEN
          final expectedMap = {
            'email': tParams.email,
            'password': tParams.password,
          };
          expect(result, expectedMap);
        },
      );
    },
  );
}

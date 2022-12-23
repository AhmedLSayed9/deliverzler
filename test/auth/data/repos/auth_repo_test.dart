import 'package:deliverzler/auth/data/data_sources/auth_local_data_source.dart';
import 'package:deliverzler/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:deliverzler/auth/data/models/user_model.dart';
import 'package:deliverzler/auth/data/repos/auth_repo.dart';
import 'package:deliverzler/auth/domain/use_cases/sign_in_with_email_uc.dart';
import 'package:deliverzler/core/data/network/network_info.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repo_test.mocks.dart';

@GenerateMocks([IAuthRemoteDataSource, IAuthLocalDataSource, INetworkInfo])
void main() {
  late MockIAuthRemoteDataSource mockIAuthRemoteDataSource;
  late MockIAuthLocalDataSource mockIAuthLocalDataSource;
  late MockINetworkInfo mockINetworkInfo;

  setUp(() {
    mockIAuthRemoteDataSource = MockIAuthRemoteDataSource();
    mockIAuthLocalDataSource = MockIAuthLocalDataSource();
    mockINetworkInfo = MockINetworkInfo();
  });

  ProviderContainer setUpContainer() {
    final container = ProviderContainer(
      overrides: [
        authRemoteDataSourceProvider
            .overrideWithValue(mockIAuthRemoteDataSource),
        authLocalDataSourceProvider.overrideWithValue(mockIAuthLocalDataSource),
        networkInfoProvider.overrideWithValue(mockINetworkInfo),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  void runTestsWhenConnected(Function body) {
    group('has network connection', () {
      setUp(() {
        when(mockINetworkInfo.hasInternetConnection)
            .thenAnswer((_) async => true);
      });
      body.call();
    });
  }

  void runTestsWhenDisconnected(Function body) {
    group('has no network connection', () {
      setUp(() {
        when(mockINetworkInfo.hasInternetConnection)
            .thenAnswer((_) async => false);
      });
      body.call();
    });
  }

  const tParams = SignInWithEmailParams(email: 'tEmail', password: 'tPassword');
  const tUserModel = UserModel(
    id: '1',
    email: 'testEmail@gmail.com',
    name: 'testName',
    phone: '0123456789',
    image: 'https://www.image.com',
  );

  final tException = Exception('test_exception');

  group(
    'signInWithEmail',
    () {
      test(
        'should return remote data'
        'when the call to remote data source is successful',
        () async {
          // GIVEN
          when(mockIAuthRemoteDataSource.signInWithEmail(tParams))
              .thenAnswer((_) async => tUserModel);

          final container = setUpContainer();

          // WHEN
          final authRepo = container.read(authRepoProvider);
          final result = await authRepo.signInWithEmail(tParams);

          // THEN
          verify(mockIAuthRemoteDataSource.signInWithEmail(tParams)).called(1);
          expect(result, equals(tUserModel));
          verifyNoMoreInteractions(mockIAuthRemoteDataSource);
        },
      );

      test(
        'should throw same Exception'
        'when the call to remote data source is unsuccessful',
        () async {
          // GIVEN
          when(mockIAuthRemoteDataSource.signInWithEmail(tParams))
              .thenThrow(tException);

          final container = setUpContainer();

          // WHEN
          final authRepo = container.read(authRepoProvider);
          final call = authRepo.signInWithEmail(tParams);

          // THEN
          await expectLater(() => call, throwsA(tException));
          verify(mockIAuthRemoteDataSource.signInWithEmail(tParams)).called(1);
          verifyNoMoreInteractions(mockIAuthRemoteDataSource);
        },
      );
    },
  );

  group(
    'getUserAuthUid',
    () {
      test(
        'should return remote data'
        'when the call to remote data source is successful',
        () async {
          // GIVEN
          const tAuthUid = 'uid';
          when(mockIAuthRemoteDataSource.getUserAuthUid())
              .thenAnswer((_) async => tAuthUid);

          final container = setUpContainer();

          // WHEN
          final authRepo = container.read(authRepoProvider);
          final result = await authRepo.getUserAuthUid();

          // THEN
          verify(mockIAuthRemoteDataSource.getUserAuthUid()).called(1);
          expect(result, equals(tAuthUid));
          verifyNoMoreInteractions(mockIAuthRemoteDataSource);
        },
      );

      test(
        'should throw same Exception'
        'when the call to remote data source is unsuccessful',
        () async {
          // GIVEN
          when(mockIAuthRemoteDataSource.getUserAuthUid())
              .thenThrow(tException);

          final container = setUpContainer();

          // WHEN
          final authRepo = container.read(authRepoProvider);
          final call = authRepo.getUserAuthUid();

          // THEN
          await expectLater(() => call, throwsA(tException));
          verify(mockIAuthRemoteDataSource.getUserAuthUid()).called(1);
          verifyNoMoreInteractions(mockIAuthRemoteDataSource);
        },
      );
    },
  );

  group(
    'getUserData',
    () {
      const tAuthUid = 'uid';

      test(
        'should call networkInfo.hasInternetConnection',
        () async {
          // GIVEN
          final container = setUpContainer();

          // WHEN
          final authRepo = container.read(authRepoProvider);
          try {
            await authRepo.getUserData(tAuthUid);
          } catch (_) {}

          // THEN
          verify(mockINetworkInfo.hasInternetConnection).called(1);
        },
      );

      runTestsWhenConnected(
        () {
          test(
            'should return remote data and try to cache the data locally'
            'when the call to remote data source is successful',
            () async {
              // GIVEN
              when(mockIAuthRemoteDataSource.getUserData(tAuthUid))
                  .thenAnswer((_) async => tUserModel);

              final container = setUpContainer();

              // WHEN
              final authRepo = container.read(authRepoProvider);
              final result = await authRepo.getUserData(tAuthUid);

              // THEN
              verify(mockIAuthRemoteDataSource.getUserData(tAuthUid)).called(1);
              verify(mockIAuthLocalDataSource.cacheUserData(tUserModel));
              expect(result, equals(tUserModel));
              verifyNoMoreInteractions(mockIAuthRemoteDataSource);
              verifyNoMoreInteractions(mockIAuthLocalDataSource);
            },
          );
          test(
            'should throw same Exception'
            'when the call to remote data source is unsuccessful',
            () async {
              // GIVEN
              when(mockIAuthRemoteDataSource.getUserAuthUid())
                  .thenThrow(tException);

              final container = setUpContainer();

              // WHEN
              final authRepo = container.read(authRepoProvider);
              final call = authRepo.getUserAuthUid();

              // THEN
              await expectLater(() => call, throwsA(tException));
              verify(mockIAuthRemoteDataSource.getUserAuthUid()).called(1);
              verifyNoMoreInteractions(mockIAuthRemoteDataSource);
            },
          );
        },
      );

      runTestsWhenDisconnected(
        () {
          test(
            'should return cached data'
            'when the cached data is present',
            () async {
              // GIVEN
              when(mockIAuthLocalDataSource.getUserData())
                  .thenAnswer((_) async => tUserModel);

              final container = setUpContainer();

              // WHEN
              final authRepo = container.read(authRepoProvider);
              final result = await authRepo.getUserData(tAuthUid);

              // THEN
              verify(mockIAuthLocalDataSource.getUserData());
              expect(result, tUserModel);
              verifyZeroInteractions(mockIAuthRemoteDataSource);
              verifyNoMoreInteractions(mockIAuthLocalDataSource);
            },
          );
          test(
            'should throw same Exception'
            'when there is no cached data present',
            () async {
              // GIVEN
              when(mockIAuthLocalDataSource.getUserData())
                  .thenThrow(tException);

              final container = setUpContainer();

              // WHEN
              final authRepo = container.read(authRepoProvider);
              final call = authRepo.getUserData(tAuthUid);

              // THEN
              await expectLater(() => call, throwsA(tException));
              verify(mockIAuthLocalDataSource.getUserData());
              verifyZeroInteractions(mockIAuthRemoteDataSource);
              verifyNoMoreInteractions(mockIAuthLocalDataSource);
            },
          );
        },
      );
    },
  );

  group(
    'setUserData',
    () {
      test(
        'should call RemoteDataSource.setUserData with the proper param'
        'and try to cache the data locally',
        () async {
          // GIVEN
          when(mockIAuthRemoteDataSource.setUserData(tUserModel))
              .thenAnswer((_) async => Future.value());

          final container = setUpContainer();

          // WHEN
          final authRepo = container.read(authRepoProvider);
          final call = authRepo.setUserData(tUserModel);

          // THEN
          await expectLater(() => call, returnsNormally);
          verify(mockIAuthRemoteDataSource.setUserData(tUserModel)).called(1);
          verify(mockIAuthLocalDataSource.cacheUserData(tUserModel));
          verifyNoMoreInteractions(mockIAuthRemoteDataSource);
          verifyNoMoreInteractions(mockIAuthLocalDataSource);
        },
      );
      test(
        'should throw same Exception'
        'when the call to remote data source is unsuccessful',
        () async {
          // GIVEN
          when(mockIAuthRemoteDataSource.setUserData(tUserModel))
              .thenThrow(tException);

          final container = setUpContainer();

          // WHEN
          final authRepo = container.read(authRepoProvider);
          final call = authRepo.setUserData(tUserModel);

          // THEN
          await expectLater(() => call, throwsA(tException));
          verify(mockIAuthRemoteDataSource.setUserData(tUserModel)).called(1);
          verifyNoMoreInteractions(mockIAuthRemoteDataSource);
        },
      );
    },
  );

  group(
    'signOut',
    () {
      test(
        'should call RemoteDataSource.signOut'
        'and try to clear the cached data',
        () async {
          // GIVEN
          when(mockIAuthRemoteDataSource.signOut())
              .thenAnswer((_) async => Future.value());

          final container = setUpContainer();

          // WHEN
          final authRepo = container.read(authRepoProvider);
          final call = authRepo.signOut();

          // THEN
          await expectLater(() => call, returnsNormally);
          verify(mockIAuthRemoteDataSource.signOut()).called(1);
          verify(mockIAuthLocalDataSource.clearUserData());
          verifyNoMoreInteractions(mockIAuthRemoteDataSource);
          verifyNoMoreInteractions(mockIAuthLocalDataSource);
        },
      );
      test(
        'should throw same Exception'
        'when the call to remote data source is unsuccessful',
        () async {
          // GIVEN
          when(mockIAuthRemoteDataSource.signOut()).thenThrow(tException);

          final container = setUpContainer();

          // WHEN
          final authRepo = container.read(authRepoProvider);
          final call = authRepo.signOut();

          // THEN
          await expectLater(() => call, throwsA(tException));
          verify(mockIAuthRemoteDataSource.signOut()).called(1);
          verifyNoMoreInteractions(mockIAuthRemoteDataSource);
        },
      );
    },
  );
}

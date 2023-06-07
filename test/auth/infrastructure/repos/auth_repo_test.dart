import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/auth/domain/sign_in_with_email.dart';
import 'package:deliverzler/auth/infrastructure/data_sources/auth_local_data_source.dart';
import 'package:deliverzler/auth/infrastructure/data_sources/auth_remote_data_source.dart';
import 'package:deliverzler/auth/infrastructure/dtos/user_dto.dart';
import 'package:deliverzler/auth/infrastructure/repos/auth_repo.dart';
import 'package:deliverzler/core/infrastructure/network/network_info.dart';
import 'package:deliverzler/core/presentation/utils/riverpod_framework.dart';
import '../../../utils.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late MockAuthLocalDataSource mockAuthLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    mockAuthLocalDataSource = MockAuthLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
  });

  ProviderContainer setUpRemoteContainer() {
    return setUpContainer(
      overrides: [
        authRemoteDataSourceProvider
            .overrideWithValue(mockAuthRemoteDataSource),
        authLocalDataSourceProvider.overrideWithValue(mockAuthLocalDataSource),
        networkInfoProvider.overrideWithValue(mockNetworkInfo),
      ],
    );
  }

  void runTestsWhenConnected(Function body) {
    group('has network connection', () {
      setUp(() {
        when(() => mockNetworkInfo.hasInternetConnection)
            .thenAnswer((_) async => true);
      });
      body.call();
    });
  }

  void runTestsWhenDisconnected(Function body) {
    group('has no network connection', () {
      setUp(() {
        when(() => mockNetworkInfo.hasInternetConnection)
            .thenAnswer((_) async => false);
      });
      body.call();
    });
  }

  const tParams = SignInWithEmail(email: 'tEmail', password: 'tPassword');
  const tUserDto = UserDto(
    id: '1',
    email: 'testEmail@gmail.com',
    name: 'testName',
    phone: '0123456789',
    image: 'https://www.image.com',
  );
  final tUser = tUserDto.toDomain();

  final tException = Exception('test_exception');

  group(
    'signInWithEmail',
    () {
      test(
        'should return remote data'
        'when the call to remote data source is successful',
        () async {
          // GIVEN
          when(() => mockAuthRemoteDataSource.signInWithEmail(tParams))
              .thenAnswer((_) async => tUserDto);

          final container = setUpRemoteContainer();

          // WHEN
          final authRepo = container.read(authRepoProvider);
          final result = await authRepo.signInWithEmail(tParams);

          // THEN
          verifyOnly(mockAuthRemoteDataSource,
              () => mockAuthRemoteDataSource.signInWithEmail(tParams));
          expect(result, equals(tUser));
        },
      );

      test(
        'should throw same Exception'
        'when the call to remote data source is unsuccessful',
        () async {
          // GIVEN
          when(() => mockAuthRemoteDataSource.signInWithEmail(tParams))
              .thenThrow(tException);

          final container = setUpRemoteContainer();

          // WHEN
          final authRepo = container.read(authRepoProvider);
          final call = authRepo.signInWithEmail(tParams);

          // THEN
          await expectLater(call, throwsA(tException));
          verifyOnly(mockAuthRemoteDataSource,
              () => mockAuthRemoteDataSource.signInWithEmail(tParams));
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
          when(() => mockAuthRemoteDataSource.getUserAuthUid())
              .thenAnswer((_) async => tAuthUid);

          final container = setUpRemoteContainer();

          // WHEN
          final authRepo = container.read(authRepoProvider);
          final result = await authRepo.getUserAuthUid();

          // THEN
          verifyOnly(mockAuthRemoteDataSource,
              () => mockAuthRemoteDataSource.getUserAuthUid());
          expect(result, equals(tAuthUid));
        },
      );

      test(
        'should throw same Exception'
        'when the call to remote data source is unsuccessful',
        () async {
          // GIVEN
          when(() => mockAuthRemoteDataSource.getUserAuthUid())
              .thenThrow(tException);

          final container = setUpRemoteContainer();

          // WHEN
          final authRepo = container.read(authRepoProvider);
          final call = authRepo.getUserAuthUid();

          // THEN
          await expectLater(call, throwsA(tException));
          verifyOnly(mockAuthRemoteDataSource,
              () => mockAuthRemoteDataSource.getUserAuthUid());
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
          final container = setUpRemoteContainer();

          // WHEN
          final authRepo = container.read(authRepoProvider);
          try {
            await authRepo.getUserData(tAuthUid);
          } catch (_) {}

          // THEN
          verifyOnly(
              mockNetworkInfo, () => mockNetworkInfo.hasInternetConnection);
        },
      );

      runTestsWhenConnected(
        () {
          test(
            'should return remote data and try to cache the data locally'
            'when the call to remote data source is successful',
            () async {
              // GIVEN
              when(() => mockAuthRemoteDataSource.getUserData(tAuthUid))
                  .thenAnswer((_) async => tUserDto);

              final container = setUpRemoteContainer();

              // WHEN
              final authRepo = container.read(authRepoProvider);
              final result = await authRepo.getUserData(tAuthUid);

              // THEN
              verifyOnly(mockAuthRemoteDataSource,
                  () => mockAuthRemoteDataSource.getUserData(tAuthUid));
              verifyOnly(mockAuthLocalDataSource,
                  () => mockAuthLocalDataSource.cacheUserData(tUserDto));
              expect(result, equals(tUser));
            },
          );
          test(
            'should throw same Exception'
            'when the call to remote data source is unsuccessful',
            () async {
              // GIVEN
              when(() => mockAuthRemoteDataSource.getUserAuthUid())
                  .thenThrow(tException);

              final container = setUpRemoteContainer();

              // WHEN
              final authRepo = container.read(authRepoProvider);
              final call = authRepo.getUserAuthUid();

              // THEN
              await expectLater(call, throwsA(tException));
              verifyOnly(mockAuthRemoteDataSource,
                  () => mockAuthRemoteDataSource.getUserAuthUid());
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
              when(() => mockAuthLocalDataSource.getUserData())
                  .thenAnswer((_) async => tUserDto);

              final container = setUpRemoteContainer();

              // WHEN
              final authRepo = container.read(authRepoProvider);
              final result = await authRepo.getUserData(tAuthUid);

              // THEN
              verifyOnly(mockAuthLocalDataSource,
                  () => mockAuthLocalDataSource.getUserData());
              expect(result, tUser);
              verifyZeroInteractions(mockAuthRemoteDataSource);
            },
          );
          test(
            'should throw same Exception'
            'when there is no cached data present',
            () async {
              // GIVEN
              when(() => mockAuthLocalDataSource.getUserData())
                  .thenThrow(tException);

              final container = setUpRemoteContainer();

              // WHEN
              final authRepo = container.read(authRepoProvider);
              final call = authRepo.getUserData(tAuthUid);

              // THEN
              await expectLater(call, throwsA(tException));
              verifyOnly(mockAuthLocalDataSource,
                  () => mockAuthLocalDataSource.getUserData());
              verifyZeroInteractions(mockAuthRemoteDataSource);
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
          when(() => mockAuthRemoteDataSource.setUserData(tUserDto))
              .thenAnswer((_) async {});

          final container = setUpRemoteContainer();

          // WHEN
          final authRepo = container.read(authRepoProvider);
          final call = authRepo.setUserData(tUser);

          // THEN
          await expectLater(call, completes);
          verifyOnly(mockAuthRemoteDataSource,
              () => mockAuthRemoteDataSource.setUserData(tUserDto));
          verifyOnly(mockAuthLocalDataSource,
              () => mockAuthLocalDataSource.cacheUserData(tUserDto));
        },
      );
      test(
        'should throw same Exception'
        'when the call to remote data source is unsuccessful',
        () async {
          // GIVEN
          when(() => mockAuthRemoteDataSource.setUserData(tUserDto))
              .thenThrow(tException);

          final container = setUpRemoteContainer();

          // WHEN
          final authRepo = container.read(authRepoProvider);
          final call = authRepo.setUserData(tUser);

          // THEN
          await expectLater(call, throwsA(tException));
          verifyOnly(mockAuthRemoteDataSource,
              () => mockAuthRemoteDataSource.setUserData(tUserDto));
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
          when(() => mockAuthRemoteDataSource.signOut())
              .thenAnswer((_) async {});

          final container = setUpRemoteContainer();

          // WHEN
          final authRepo = container.read(authRepoProvider);
          final call = authRepo.signOut();

          // THEN
          await expectLater(call, completes);
          verifyOnly(mockAuthRemoteDataSource,
              () => mockAuthRemoteDataSource.signOut());
          verifyOnly(mockAuthLocalDataSource,
              () => mockAuthLocalDataSource.clearUserData());
        },
      );
      test(
        'should throw same Exception'
        'when the call to remote data source is unsuccessful',
        () async {
          // GIVEN
          when(() => mockAuthRemoteDataSource.signOut()).thenThrow(tException);

          final container = setUpRemoteContainer();

          // WHEN
          final authRepo = container.read(authRepoProvider);
          final call = authRepo.signOut();

          // THEN
          await expectLater(call, throwsA(tException));
          verifyOnly(mockAuthRemoteDataSource,
              () => mockAuthRemoteDataSource.signOut());
        },
      );
    },
  );
}

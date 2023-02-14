import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/auth/data/data_sources/auth_local_data_source.dart';
import 'package:deliverzler/auth/data/models/user_model.dart';
import 'package:deliverzler/core/data/error/app_exception.dart';
import 'package:deliverzler/core/data/local/local_storage_caller/i_local_storage_caller.dart';
import 'package:deliverzler/core/data/local/local_storage_caller/shared_pref_local_storage_caller.dart';
import '../../../fixtures/fixture_reader.dart';

class MockILocalStorageCaller extends Mock implements ILocalStorageCaller {}

void main() {
  late MockILocalStorageCaller mockILocalStorageCaller;

  setUpAll(() {
    registerFallbackValue(DataType.int);
  });

  setUp(() {
    mockILocalStorageCaller = MockILocalStorageCaller();
  });

  ProviderContainer setUpContainer() {
    final container = ProviderContainer(
      overrides: [
        localStorageCallerProvider.overrideWithValue(mockILocalStorageCaller),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  final tResponseMap = json.decode(fixtureReader('auth/user.json'));
  final tUserModel = UserModel.fromJson(tResponseMap);

  group(
    'cacheUserData',
    () {
      test(
        'should call LocalStorageCaller.saveData with the proper params',
        () async {
          // GIVEN
          final container = setUpContainer();
          when(
            () => mockILocalStorageCaller.saveData(
              key: any(named: 'key'),
              dataType: any(named: 'dataType'),
              value: any(named: 'value'),
            ),
          ).thenAnswer((_) async => true);

          // WHEN
          final authLocalDataSource =
              container.read(authLocalDataSourceProvider);
          await authLocalDataSource.cacheUserData(tUserModel);

          // THEN
          final expectedJsonString = json.encode(tUserModel.toJson());
          verify(
            () => mockILocalStorageCaller.saveData(
              key: AuthLocalDataSource.userDataKey,
              dataType: DataType.string,
              value: expectedJsonString,
            ),
          );
          verifyNoMoreInteractions(mockILocalStorageCaller);
        },
      );
    },
  );

  group(
    'getUserData',
    () {
      test(
        'should return the cached data when it is present',
        () async {
          // GIVEN
          final container = setUpContainer();
          when(
            () => mockILocalStorageCaller.restoreData(
              key: any(named: 'key'),
              dataType: any(named: 'dataType'),
            ),
          ).thenAnswer((_) async => fixtureReader('auth/user.json'));

          // WHEN
          final authLocalDataSource =
              container.read(authLocalDataSourceProvider);
          final result = await authLocalDataSource.getUserData();

          // THEN
          verify(
            () => mockILocalStorageCaller.restoreData(
              key: AuthLocalDataSource.userDataKey,
              dataType: DataType.string,
            ),
          );
          expect(result, equals(tUserModel));
          verifyNoMoreInteractions(mockILocalStorageCaller);
        },
      );
      test(
        'should throw a CacheException of type CacheExceptionType.notFound when there is no cached data',
        () async {
          // GIVEN
          final container = setUpContainer();
          when(
            () => mockILocalStorageCaller.restoreData(
              key: any(named: 'key'),
              dataType: any(named: 'dataType'),
            ),
          ).thenAnswer((_) async => null);

          // WHEN
          final authLocalDataSource =
              container.read(authLocalDataSourceProvider);
          final call = authLocalDataSource.getUserData();

          // THEN
          verify(
            () => mockILocalStorageCaller.restoreData(
              key: AuthLocalDataSource.userDataKey,
              dataType: DataType.string,
            ),
          );
          await expectLater(
            () => call,
            throwsA(
              isA<CacheException>().having(
                  (e) => e.type, 'type', equals(CacheExceptionType.notFound)),
            ),
          );
          verifyNoMoreInteractions(mockILocalStorageCaller);
        },
      );
    },
  );

  group(
    'clearUserData',
    () {
      test(
        'should call LocalStorageCaller.clearKey with the proper params',
        () async {
          // GIVEN
          final container = setUpContainer();
          when(
            () => mockILocalStorageCaller.clearKey(
              key: any(named: 'key'),
            ),
          ).thenAnswer((_) async => true);

          // WHEN
          final authLocalDataSource =
              container.read(authLocalDataSourceProvider);
          await authLocalDataSource.clearUserData();

          // THEN
          verify(
            () => mockILocalStorageCaller.clearKey(
              key: AuthLocalDataSource.userDataKey,
            ),
          );
          verifyNoMoreInteractions(mockILocalStorageCaller);
        },
      );
    },
  );
}

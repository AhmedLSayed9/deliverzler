import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/auth/infrastructure/data_sources/auth_local_data_source.dart';
import 'package:deliverzler/auth/infrastructure/dtos/user_dto.dart';
import 'package:deliverzler/core/infrastructure/error/app_exception.dart';
import 'package:deliverzler/core/infrastructure/local/shared_preferences_facade.dart';
import 'package:deliverzler/core/presentation/utils/riverpod_framework.dart';
import '../../../fixtures/fixture_reader.dart';
import '../../../utils.dart';

class MockSharedPreferencesFacade extends Mock implements SharedPreferencesFacade {}

void main() {
  late MockSharedPreferencesFacade mockSharedPrefs;

  setUp(() {
    mockSharedPrefs = MockSharedPreferencesFacade();
  });

  ProviderContainer setUpSharedPrefsContainer() {
    return setUpContainer(
      overrides: [
        sharedPreferencesFacadeProvider.overrideWithValue(mockSharedPrefs),
      ],
    );
  }

  final tResponseMap = json.decode(fixtureReader('auth/user.json')) as Map<String, dynamic>;
  final tUserDto = UserDto.fromJson(tResponseMap);

  group(
    'cacheUserData',
    () {
      test(
        'should call LocalStorageCaller.saveData with the proper params',
        () async {
          // GIVEN
          when(
            () => mockSharedPrefs.saveData(
              key: any(named: 'key'),
              value: any(named: 'value'),
            ),
          ).thenAnswer((_) async => true);

          final container = setUpSharedPrefsContainer();

          // WHEN
          final authLocalDataSource = container.read(authLocalDataSourceProvider);
          await authLocalDataSource.cacheUserData(tUserDto);

          // THEN
          final expectedJsonString = json.encode(tUserDto.toJson());
          verifyOnly(
            mockSharedPrefs,
            () => mockSharedPrefs.saveData(
              key: AuthLocalDataSource.userDataKey,
              value: expectedJsonString,
            ),
          );
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
          when(
            () => mockSharedPrefs.restoreData<String>(any()),
          ).thenReturn(fixtureReader('auth/user.json'));

          final container = setUpSharedPrefsContainer();

          // WHEN
          final authLocalDataSource = container.read(authLocalDataSourceProvider);
          final result = authLocalDataSource.getUserData();

          // THEN
          verifyOnly(
            mockSharedPrefs,
            () => mockSharedPrefs.restoreData<String>(AuthLocalDataSource.userDataKey),
          );
          expect(result, equals(tUserDto));
        },
      );
      test(
        'should throw a CacheException of type CacheExceptionType.notFound when there is no cached data',
        () async {
          // GIVEN
          when(
            () => mockSharedPrefs.restoreData<String>(any()),
          ).thenReturn(null);

          final container = setUpSharedPrefsContainer();

          // WHEN
          final authLocalDataSource = container.read(authLocalDataSourceProvider);

          // THEN
          expect(
            authLocalDataSource.getUserData,
            throwsA(
              isA<CacheException>().having(
                (e) => e.type,
                'type',
                equals(CacheExceptionType.notFound),
              ),
            ),
          );
          verifyOnly(
            mockSharedPrefs,
            () => mockSharedPrefs.restoreData<String>(AuthLocalDataSource.userDataKey),
          );
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
          when(
            () => mockSharedPrefs.clearKey(
              key: any(named: 'key'),
            ),
          ).thenAnswer((_) async => true);

          final container = setUpSharedPrefsContainer();

          // WHEN
          final authLocalDataSource = container.read(authLocalDataSourceProvider);
          await authLocalDataSource.clearUserData();

          // THEN
          verifyOnly(
            mockSharedPrefs,
            () => mockSharedPrefs.clearKey(
              key: AuthLocalDataSource.userDataKey,
            ),
          );
        },
      );
    },
  );
}

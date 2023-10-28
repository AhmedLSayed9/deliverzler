// ignore_for_file: invalid_use_of_visible_for_overriding_member

import 'dart:convert';

import 'package:deliverzler/core/core_features/locale/presentation/providers/app_locale_provider.dart';
import 'package:deliverzler/core/core_features/locale/presentation/utils/app_locale.dart';
import 'package:deliverzler/core/core_features/theme/presentation/providers/app_theme_provider.dart';
import 'package:deliverzler/core/core_features/theme/presentation/utils/app_theme.dart';
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

class MockAppLocaleController extends AsyncNotifier<AppLocale>
    with Mock
    implements AppLocaleController {}

class MockAppThemeController extends AsyncNotifier<AppThemeMode>
    with Mock
    implements AppThemeController {}

void main() {
  late MockSharedPreferencesFacade mockSharedPrefs;

  setUp(() {
    mockSharedPrefs = MockSharedPreferencesFacade();
  });

  ProviderContainer setUpSharedPrefsContainer({List<Override> overrides = const []}) {
    return setUpContainer(
      overrides: [
        sharedPreferencesFacadeProvider.overrideWithValue(mockSharedPrefs),
        ...overrides,
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
      late MockAppLocaleController mockAppLocaleController;
      late MockAppThemeController mockAppThemeController;
      setUp(() {
        mockAppLocaleController = MockAppLocaleController();
        mockAppThemeController = MockAppThemeController();
      });

      test(
        'should call LocalStorageCaller.clearAll then re-cache current locale and theme',
        () async {
          // GIVEN
          const tLocale = AppLocale.english;
          const tTheme = AppThemeMode.light;

          when(mockAppLocaleController.build).thenReturn(tLocale);
          when(mockAppLocaleController.reCacheLocale).thenAnswer((_) async {});
          when(mockAppThemeController.build).thenReturn(tTheme);
          when(mockAppThemeController.reCacheTheme).thenAnswer((_) async {});

          when(
            () => mockSharedPrefs.clearAll(),
          ).thenAnswer((_) async => true);
          when(
            () => mockSharedPrefs.saveData(key: any(named: 'key'), value: any(named: 'value')),
          ).thenAnswer((_) async => true);

          final container = setUpSharedPrefsContainer(
            overrides: [
              appLocaleControllerProvider.overrideWith(() => mockAppLocaleController),
              appThemeControllerProvider.overrideWith(() => mockAppThemeController),
            ],
          );

          // WHEN
          final authLocalDataSource = container.read(authLocalDataSourceProvider);
          await authLocalDataSource.clearUserData();

          // THEN
          verifyInOrder([
            () => mockSharedPrefs.clearAll(),
            () => mockAppLocaleController.reCacheLocale(),
            () => mockAppThemeController.reCacheTheme(),
          ]);
          verifyNoMoreInteractions(mockSharedPrefs);
        },
      );
    },
  );
}

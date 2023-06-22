import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/core/core_features/theme/infrastructure/data_sources/theme_local_data_source.dart';
import 'package:deliverzler/core/infrastructure/error/app_exception.dart';
import 'package:deliverzler/core/infrastructure/local/shared_preferences_facade.dart';
import 'package:deliverzler/core/presentation/utils/riverpod_framework.dart';
import '../../../../../utils.dart';

class MockSharedPreferencesFacade extends Mock implements SharedPreferencesFacade {}

void main() {
  late MockSharedPreferencesFacade mockSharedPrefs;

  setUpAll(() {
    registerFallbackValue(DataType.int);
  });

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

  group(
    'getAppTheme',
    () {
      const tTheme = 'light';

      test(
        'should return the cached data when it is present',
        () async {
          // GIVEN
          when(
            () => mockSharedPrefs.restoreData<String>(
              key: any(named: 'key'),
              dataType: any(named: 'dataType'),
            ),
          ).thenAnswer((_) async => tTheme);
          final container = setUpSharedPrefsContainer();

          // WHEN
          final themeLocalDataSource = container.read(themeLocalDataSourceProvider);
          final result = await themeLocalDataSource.getAppTheme();

          // THEN
          verifyOnly(
            mockSharedPrefs,
            () => mockSharedPrefs.restoreData<String>(
              key: ThemeLocalDataSource.appThemeKey,
              dataType: DataType.string,
            ),
          );
          expect(result, equals(tTheme));
        },
      );
      test(
        'should throw a CacheException of type CacheExceptionType.notFound when there is no cached data',
        () async {
          // GIVEN
          when(
            () => mockSharedPrefs.restoreData<String>(
              key: any(named: 'key'),
              dataType: any(named: 'dataType'),
            ),
          ).thenAnswer((_) async => null);
          final container = setUpSharedPrefsContainer();

          // WHEN
          final themeLocalDataSource = container.read(themeLocalDataSourceProvider);
          final call = themeLocalDataSource.getAppTheme();

          // THEN
          await expectLater(
            () => call,
            throwsA(
              isA<CacheException>().having(
                (e) => e.type,
                'type',
                equals(CacheExceptionType.notFound),
              ),
            ),
          );
        },
      );
    },
  );

  group(
    'cacheAppTheme',
    () {
      const tTheme = 'light';

      test(
        'should call LocalStorageCaller.saveData with the proper params',
        () async {
          // GIVEN
          final container = setUpSharedPrefsContainer();
          when(
            () => mockSharedPrefs.saveData(
              key: any(named: 'key'),
              dataType: any(named: 'dataType'),
              value: any(named: 'value'),
            ),
          ).thenAnswer((_) async => true);

          // WHEN
          final themeLocalDataSource = container.read(themeLocalDataSourceProvider);
          await themeLocalDataSource.cacheAppTheme(tTheme);

          // THEN
          verifyOnly(
            mockSharedPrefs,
            () => mockSharedPrefs.saveData(
              key: ThemeLocalDataSource.appThemeKey,
              dataType: DataType.string,
              value: tTheme,
            ),
          );
        },
      );
    },
  );
}

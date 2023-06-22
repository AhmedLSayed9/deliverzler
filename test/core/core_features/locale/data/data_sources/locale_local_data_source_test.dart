import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/core/core_features/locale/infrastructure/data_sources/locale_local_data_source.dart';
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
    'getAppLocale',
    () {
      const tLocale = 'en';

      test(
        'should return the cached data when it is present',
        () async {
          // GIVEN
          when(
            () => mockSharedPrefs.restoreData<String>(
              key: any(named: 'key'),
              dataType: any(named: 'dataType'),
            ),
          ).thenAnswer((_) async => tLocale);
          final container = setUpSharedPrefsContainer();

          // WHEN
          final localeLocalDataSource = container.read(localeLocalDataSourceProvider);
          final result = await localeLocalDataSource.getAppLocale();

          // THEN
          verifyOnly(
            mockSharedPrefs,
            () => mockSharedPrefs.restoreData<String>(
              key: LocaleLocalDataSource.appLocaleKey,
              dataType: DataType.string,
            ),
          );
          expect(result, equals(tLocale));
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
          final localeLocalDataSource = container.read(localeLocalDataSourceProvider);
          final call = localeLocalDataSource.getAppLocale();

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
    'cacheAppLocale',
    () {
      const tLocale = 'en';

      test(
        'should call LocalStorageCaller.saveData with the proper params',
        () async {
          // GIVEN
          when(
            () => mockSharedPrefs.saveData(
              key: any(named: 'key'),
              dataType: any(named: 'dataType'),
              value: any(named: 'value'),
            ),
          ).thenAnswer((_) async => true);
          final container = setUpSharedPrefsContainer();

          // WHEN
          final localeLocalDataSource = container.read(localeLocalDataSourceProvider);
          await localeLocalDataSource.cacheAppLocale(tLocale);

          // THEN
          verifyOnly(
            mockSharedPrefs,
            () => mockSharedPrefs.saveData(
              key: LocaleLocalDataSource.appLocaleKey,
              dataType: DataType.string,
              value: tLocale,
            ),
          );
        },
      );
    },
  );
}

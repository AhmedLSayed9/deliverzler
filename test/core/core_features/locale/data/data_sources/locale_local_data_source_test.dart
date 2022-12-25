import 'package:deliverzler/core/core_features/locale/data/data_sources/locale_local_data_source.dart';
import 'package:deliverzler/core/data/error/app_exception.dart';
import 'package:deliverzler/core/data/local/local_storage_caller/i_local_storage_caller.dart';
import 'package:deliverzler/core/data/local/local_storage_caller/shared_pref_local_storage_caller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'locale_local_data_source_test.mocks.dart';

@GenerateMocks([ILocalStorageCaller])
void main() {
  late MockILocalStorageCaller mockILocalStorageCaller;

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

  group(
    'getAppLocale',
    () {
      const tLocale = 'en';

      test(
        'should return the cached data when it is present',
        () async {
          // GIVEN
          when(
            mockILocalStorageCaller.restoreData(
              key: anyNamed('key'),
              dataType: anyNamed('dataType'),
            ),
          ).thenAnswer((_) async => tLocale);
          final container = setUpContainer();

          // WHEN
          final localeLocalDataSource =
              container.read(localeLocalDataSourceProvider);
          final result = await localeLocalDataSource.getAppLocale();

          // THEN
          verify(
            mockILocalStorageCaller.restoreData(
              key: LocaleLocalDataSource.appLocaleKey,
              dataType: DataType.string,
            ),
          ).called(1);
          expect(result, equals(tLocale));
        },
      );
      test(
        'should throw a CacheException of type CacheExceptionType.notFound when there is no cached data',
        () async {
          // GIVEN
          when(
            mockILocalStorageCaller.restoreData(
              key: anyNamed('key'),
              dataType: anyNamed('dataType'),
            ),
          ).thenAnswer((_) async => null);
          final container = setUpContainer();

          // WHEN
          final localeLocalDataSource =
              container.read(localeLocalDataSourceProvider);
          final call = localeLocalDataSource.getAppLocale();

          // THEN
          await expectLater(
            () => call,
            throwsA(
              isA<CacheException>().having(
                  (e) => e.type, 'type', equals(CacheExceptionType.notFound)),
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
            mockILocalStorageCaller.saveData(
              key: anyNamed('key'),
              dataType: anyNamed('dataType'),
              value: anyNamed('value'),
            ),
          ).thenAnswer((_) async => true);
          final container = setUpContainer();

          // WHEN
          final localeLocalDataSource =
              container.read(localeLocalDataSourceProvider);
          await localeLocalDataSource.cacheAppLocale(tLocale);

          // THEN
          verify(
            mockILocalStorageCaller.saveData(
              key: LocaleLocalDataSource.appLocaleKey,
              dataType: DataType.string,
              value: tLocale,
            ),
          ).called(1);
          verifyNoMoreInteractions(mockILocalStorageCaller);
        },
      );
    },
  );
}

import 'package:deliverzler/core/core_features/theme/data/data_sources/theme_local_data_source.dart';
import 'package:deliverzler/core/data/error/app_exception.dart';
import 'package:deliverzler/core/data/local/local_storage_caller/i_local_storage_caller.dart';
import 'package:deliverzler/core/data/local/local_storage_caller/shared_pref_local_storage_caller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

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

  group(
    'getAppTheme',
    () {
      const tTheme = 'light';

      test(
        'should return the cached data when it is present',
        () async {
          // GIVEN
          when(
            () => mockILocalStorageCaller.restoreData(
              key: any(named: 'key'),
              dataType: any(named: 'dataType'),
            ),
          ).thenAnswer((_) async => tTheme);
          final container = setUpContainer();

          // WHEN
          final themeLocalDataSource =
              container.read(themeLocalDataSourceProvider);
          final result = await themeLocalDataSource.getAppTheme();

          // THEN
          verify(
            () => mockILocalStorageCaller.restoreData(
              key: ThemeLocalDataSource.appThemeKey,
              dataType: DataType.string,
            ),
          ).called(1);
          expect(result, equals(tTheme));
        },
      );
      test(
        'should throw a CacheException of type CacheExceptionType.notFound when there is no cached data',
        () async {
          // GIVEN
          when(
            () => mockILocalStorageCaller.restoreData(
              key: any(named: 'key'),
              dataType: any(named: 'dataType'),
            ),
          ).thenAnswer((_) async => null);
          final container = setUpContainer();

          // WHEN
          final themeLocalDataSource =
              container.read(themeLocalDataSourceProvider);
          final call = themeLocalDataSource.getAppTheme();

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
    'cacheAppTheme',
    () {
      const tTheme = 'light';

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
          final themeLocalDataSource =
              container.read(themeLocalDataSourceProvider);
          await themeLocalDataSource.cacheAppTheme(tTheme);

          // THEN
          verify(
            () => mockILocalStorageCaller.saveData(
              key: ThemeLocalDataSource.appThemeKey,
              dataType: DataType.string,
              value: tTheme,
            ),
          ).called(1);
          verifyNoMoreInteractions(mockILocalStorageCaller);
        },
      );
    },
  );
}

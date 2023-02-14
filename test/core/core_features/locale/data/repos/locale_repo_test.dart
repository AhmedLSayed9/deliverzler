import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/core/core_features/locale/data/data_sources/locale_local_data_source.dart';
import 'package:deliverzler/core/core_features/locale/data/repos/locale_repo.dart';

class MockILocaleLocalDataSource extends Mock
    implements ILocaleLocalDataSource {}

void main() {
  late MockILocaleLocalDataSource mockILocaleLocalDataSource;

  setUp(() {
    mockILocaleLocalDataSource = MockILocaleLocalDataSource();
  });

  ProviderContainer setUpContainer() {
    final container = ProviderContainer(
      overrides: [
        localeLocalDataSourceProvider
            .overrideWithValue(mockILocaleLocalDataSource),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  final tException = Exception('test_exception');

  group(
    'getAppLocale',
    () {
      const tLocale = 'en';

      test(
        'should return cached data'
        'when the cached data is present',
        () async {
          // GIVEN
          when(() => mockILocaleLocalDataSource.getAppLocale())
              .thenAnswer((_) async => tLocale);
          final container = setUpContainer();

          // WHEN
          final localeRepo = container.read(localeRepoProvider);
          final result = await localeRepo.getAppLocale();

          // THEN
          verify(() => mockILocaleLocalDataSource.getAppLocale());
          expect(result, equals(tLocale));
          verifyNoMoreInteractions(mockILocaleLocalDataSource);
        },
      );

      test(
        'should throw same Exception'
        'when there is no cached data present',
        () async {
          // GIVEN
          when(() => mockILocaleLocalDataSource.getAppLocale())
              .thenThrow(tException);
          final container = setUpContainer();

          // WHEN
          final localeRepo = container.read(localeRepoProvider);
          final call = localeRepo.getAppLocale();

          // THEN
          await expectLater(() => call, throwsA(tException));
          verify(() => mockILocaleLocalDataSource.getAppLocale());
          verifyNoMoreInteractions(mockILocaleLocalDataSource);
        },
      );
    },
  );

  group(
    'cacheAppLocale',
    () {
      const tLocale = 'en';

      test(
        'should call LocalDataSource.cacheAppLocale with the proper param',
        () async {
          // GIVEN
          when(() => mockILocaleLocalDataSource.cacheAppLocale(tLocale))
              .thenAnswer((_) async => Future.value());
          final container = setUpContainer();

          // WHEN
          final localeRepo = container.read(localeRepoProvider);
          await localeRepo.cacheAppLocale(tLocale);

          // THEN
          verify(() => mockILocaleLocalDataSource.cacheAppLocale(tLocale));
          verifyNoMoreInteractions(mockILocaleLocalDataSource);
        },
      );

      test(
        'should throw same Exception'
        'when the call to local data source is unsuccessful',
        () async {
          // GIVEN
          when(() => mockILocaleLocalDataSource.cacheAppLocale(tLocale))
              .thenThrow(tException);
          final container = setUpContainer();

          // WHEN
          final localeRepo = container.read(localeRepoProvider);
          final call = localeRepo.cacheAppLocale(tLocale);

          // THEN
          await expectLater(() => call, throwsA(tException));
          verify(() => mockILocaleLocalDataSource.cacheAppLocale(tLocale));
          verifyNoMoreInteractions(mockILocaleLocalDataSource);
        },
      );
    },
  );
}

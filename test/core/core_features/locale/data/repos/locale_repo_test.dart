import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/core/core_features/locale/infrastructure/data_sources/locale_local_data_source.dart';
import 'package:deliverzler/core/core_features/locale/infrastructure/repos/locale_repo.dart';
import 'package:deliverzler/core/presentation/utils/riverpod_framework.dart';
import '../../../../../utils.dart';

class MockLocaleLocalDataSource extends Mock implements LocaleLocalDataSource {}

void main() {
  late MockLocaleLocalDataSource mockLocaleLocalDataSource;

  setUp(() {
    mockLocaleLocalDataSource = MockLocaleLocalDataSource();
  });

  ProviderContainer setUpRemoteContainer() {
    return setUpContainer(
      overrides: [
        localeLocalDataSourceProvider
            .overrideWithValue(mockLocaleLocalDataSource),
      ],
    );
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
          when(() => mockLocaleLocalDataSource.getAppLocale())
              .thenAnswer((_) async => tLocale);

          final container = setUpRemoteContainer();

          // WHEN
          final localeRepo = container.read(localeRepoProvider);
          final result = await localeRepo.getAppLocale();

          // THEN
          verifyOnly(mockLocaleLocalDataSource,
              () => mockLocaleLocalDataSource.getAppLocale());
          expect(result, equals(tLocale));
        },
      );

      test(
        'should throw same Exception'
        'when there is no cached data present',
        () async {
          // GIVEN
          when(() => mockLocaleLocalDataSource.getAppLocale())
              .thenThrow(tException);
          final container = setUpRemoteContainer();

          // WHEN
          final localeRepo = container.read(localeRepoProvider);
          final call = localeRepo.getAppLocale();

          // THEN
          await expectLater(() => call, throwsA(tException));
          verifyOnly(mockLocaleLocalDataSource,
              () => mockLocaleLocalDataSource.getAppLocale());
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
          when(() => mockLocaleLocalDataSource.cacheAppLocale(tLocale))
              .thenAnswer((_) async => Future.value());

          final container = setUpRemoteContainer();

          // WHEN
          final localeRepo = container.read(localeRepoProvider);
          await localeRepo.cacheAppLocale(tLocale);

          // THEN
          verifyOnly(mockLocaleLocalDataSource,
              () => mockLocaleLocalDataSource.cacheAppLocale(tLocale));
        },
      );

      test(
        'should throw same Exception'
        'when the call to local data source is unsuccessful',
        () async {
          // GIVEN
          when(() => mockLocaleLocalDataSource.cacheAppLocale(tLocale))
              .thenThrow(tException);

          final container = setUpRemoteContainer();

          // WHEN
          final localeRepo = container.read(localeRepoProvider);
          final call = localeRepo.cacheAppLocale(tLocale);

          // THEN
          await expectLater(() => call, throwsA(tException));
          verifyOnly(mockLocaleLocalDataSource,
              () => mockLocaleLocalDataSource.cacheAppLocale(tLocale));
        },
      );
    },
  );
}

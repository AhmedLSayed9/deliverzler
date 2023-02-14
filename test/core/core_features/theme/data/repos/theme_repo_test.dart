import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/core/core_features/theme/data/data_sources/theme_local_data_source.dart';
import 'package:deliverzler/core/core_features/theme/data/repos/theme_repo.dart';

class MockIThemeLocalDataSource extends Mock implements IThemeLocalDataSource {}

void main() {
  late MockIThemeLocalDataSource mockIThemeLocalDataSource;

  setUp(() {
    mockIThemeLocalDataSource = MockIThemeLocalDataSource();
  });

  ProviderContainer setUpContainer() {
    final container = ProviderContainer(
      overrides: [
        themeLocalDataSourceProvider
            .overrideWithValue(mockIThemeLocalDataSource),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  final tException = Exception('test_exception');

  group(
    'getAppTheme',
    () {
      const tTheme = 'light';

      test(
        'should return cached data'
        'when the cached data is present',
        () async {
          // GIVEN
          when(() => mockIThemeLocalDataSource.getAppTheme())
              .thenAnswer((_) async => tTheme);
          final container = setUpContainer();

          // WHEN
          final themeRepo = container.read(themeRepoProvider);
          final result = await themeRepo.getAppTheme();

          // THEN
          verify(() => mockIThemeLocalDataSource.getAppTheme());
          expect(result, equals(tTheme));
          verifyNoMoreInteractions(mockIThemeLocalDataSource);
        },
      );

      test(
        'should throw same Exception'
        'when there is no cached data present',
        () async {
          // GIVEN
          when(() => mockIThemeLocalDataSource.getAppTheme())
              .thenThrow(tException);
          final container = setUpContainer();

          // WHEN
          final themeRepo = container.read(themeRepoProvider);
          final call = themeRepo.getAppTheme();

          // THEN
          await expectLater(() => call, throwsA(tException));
          verify(() => mockIThemeLocalDataSource.getAppTheme());
          verifyNoMoreInteractions(mockIThemeLocalDataSource);
        },
      );
    },
  );

  group(
    'cacheAppTheme',
    () {
      const tTheme = 'light';

      test(
        'should call LocalDataSource.cacheAppTheme with the proper param',
        () async {
          // GIVEN
          when(() => mockIThemeLocalDataSource.cacheAppTheme(tTheme))
              .thenAnswer((_) async => Future.value());
          final container = setUpContainer();

          // WHEN
          final themeRepo = container.read(themeRepoProvider);
          await themeRepo.cacheAppTheme(tTheme);

          // THEN
          verify(() => mockIThemeLocalDataSource.cacheAppTheme(tTheme));
          verifyNoMoreInteractions(mockIThemeLocalDataSource);
        },
      );

      test(
        'should throw same Exception'
        'when the call to local data source is unsuccessful',
        () async {
          // GIVEN
          when(() => mockIThemeLocalDataSource.cacheAppTheme(tTheme))
              .thenThrow(tException);
          final container = setUpContainer();

          // WHEN
          final themeRepo = container.read(themeRepoProvider);
          final call = themeRepo.cacheAppTheme(tTheme);

          // THEN
          await expectLater(() => call, throwsA(tException));
          verify(() => mockIThemeLocalDataSource.cacheAppTheme(tTheme));
          verifyNoMoreInteractions(mockIThemeLocalDataSource);
        },
      );
    },
  );
}

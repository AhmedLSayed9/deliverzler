import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/core/core_features/theme/infrastructure/data_sources/theme_local_data_source.dart';
import 'package:deliverzler/core/core_features/theme/infrastructure/repos/theme_repo.dart';
import 'package:deliverzler/core/presentation/utils/riverpod_framework.dart';
import '../../../../../utils.dart';

class MockThemeLocalDataSource extends Mock implements ThemeLocalDataSource {}

void main() {
  late MockThemeLocalDataSource mockThemeLocalDataSource;

  setUp(() {
    mockThemeLocalDataSource = MockThemeLocalDataSource();
  });

  ProviderContainer setUpRemoteContainer() {
    return setUpContainer(
      overrides: [
        themeLocalDataSourceProvider.overrideWithValue(mockThemeLocalDataSource),
      ],
    );
  }

  final tException = Exception('test_exception');

  group(
    'getAppTheme',
    () {
      const tTheme = 'light';

      test(
        'should return cached data '
        'when the cached data is present',
        () async {
          // GIVEN
          when(() => mockThemeLocalDataSource.getAppTheme()).thenReturn(tTheme);

          final container = setUpRemoteContainer();

          // WHEN
          final themeRepo = container.read(themeRepoProvider);
          final result = themeRepo.getAppTheme();

          // THEN
          verifyOnly(
            mockThemeLocalDataSource,
            () => mockThemeLocalDataSource.getAppTheme(),
          );
          expect(result, equals(tTheme));
        },
      );

      test(
        'should throw same Exception '
        'when there is no cached data present',
        () async {
          // GIVEN
          when(() => mockThemeLocalDataSource.getAppTheme()).thenThrow(tException);

          final container = setUpRemoteContainer();

          // WHEN
          final themeRepo = container.read(themeRepoProvider);

          // THEN
          expect(themeRepo.getAppTheme, throwsA(tException));
          verifyOnly(
            mockThemeLocalDataSource,
            () => mockThemeLocalDataSource.getAppTheme(),
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
        'should call LocalDataSource.cacheAppTheme with the proper param',
        () async {
          // GIVEN
          when(() => mockThemeLocalDataSource.cacheAppTheme(tTheme)).thenAnswer((_) async {});

          final container = setUpRemoteContainer();

          // WHEN
          final themeRepo = container.read(themeRepoProvider);
          await themeRepo.cacheAppTheme(tTheme);

          // THEN
          verifyOnly(
            mockThemeLocalDataSource,
            () => mockThemeLocalDataSource.cacheAppTheme(tTheme),
          );
        },
      );

      test(
        'should throw same Exception '
        'when the call to local data source is unsuccessful',
        () async {
          // GIVEN
          when(() => mockThemeLocalDataSource.cacheAppTheme(tTheme)).thenThrow(tException);

          final container = setUpRemoteContainer();

          // WHEN
          final themeRepo = container.read(themeRepoProvider);

          // THEN
          expect(() => themeRepo.cacheAppTheme(tTheme), throwsA(tException));
          verifyOnly(
            mockThemeLocalDataSource,
            () => mockThemeLocalDataSource.cacheAppTheme(tTheme),
          );
        },
      );
    },
  );
}

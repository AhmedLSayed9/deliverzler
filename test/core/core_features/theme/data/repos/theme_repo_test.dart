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
    'getAppThemeMode',
    () {
      const tTheme = 'light';

      test(
        'should return cached data '
        'when the cached data is present',
        () async {
          // GIVEN
          when(() => mockThemeLocalDataSource.getAppThemeMode()).thenReturn(tTheme);

          final container = setUpRemoteContainer();

          // WHEN
          final themeRepo = container.read(themeRepoProvider);
          final result = themeRepo.getAppThemeMode();

          // THEN
          verifyOnly(
            mockThemeLocalDataSource,
            () => mockThemeLocalDataSource.getAppThemeMode(),
          );
          expect(result, equals(tTheme));
        },
      );

      test(
        'should throw same Exception '
        'when there is no cached data present',
        () async {
          // GIVEN
          when(() => mockThemeLocalDataSource.getAppThemeMode()).thenThrow(tException);

          final container = setUpRemoteContainer();

          // WHEN
          final themeRepo = container.read(themeRepoProvider);

          // THEN
          expect(themeRepo.getAppThemeMode, throwsA(tException));
          verifyOnly(
            mockThemeLocalDataSource,
            () => mockThemeLocalDataSource.getAppThemeMode(),
          );
        },
      );
    },
  );

  group(
    'cacheAppThemeMode',
    () {
      const tTheme = 'light';

      test(
        'should call LocalDataSource.cacheAppThemeMode with the proper param',
        () async {
          // GIVEN
          when(() => mockThemeLocalDataSource.cacheAppThemeMode(tTheme)).thenAnswer((_) async {});

          final container = setUpRemoteContainer();

          // WHEN
          final themeRepo = container.read(themeRepoProvider);
          await themeRepo.cacheAppThemeMode(tTheme);

          // THEN
          verifyOnly(
            mockThemeLocalDataSource,
            () => mockThemeLocalDataSource.cacheAppThemeMode(tTheme),
          );
        },
      );

      test(
        'should throw same Exception '
        'when the call to local data source is unsuccessful',
        () async {
          // GIVEN
          when(() => mockThemeLocalDataSource.cacheAppThemeMode(tTheme)).thenThrow(tException);

          final container = setUpRemoteContainer();

          // WHEN
          final themeRepo = container.read(themeRepoProvider);

          // THEN
          expect(() => themeRepo.cacheAppThemeMode(tTheme), throwsA(tException));
          verifyOnly(
            mockThemeLocalDataSource,
            () => mockThemeLocalDataSource.cacheAppThemeMode(tTheme),
          );
        },
      );
    },
  );
}

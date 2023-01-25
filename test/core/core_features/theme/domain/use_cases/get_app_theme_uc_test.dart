import 'package:deliverzler/core/core_features/theme/data/repos/theme_repo.dart';
import 'package:deliverzler/core/core_features/theme/domain/repos/i_theme_repo.dart';
import 'package:deliverzler/core/core_features/theme/domain/use_cases/get_app_theme_uc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';

class MockIThemeRepo extends Mock implements IThemeRepo {}

void main() {
  late MockIThemeRepo mockIThemeRepo;

  setUp(() {
    mockIThemeRepo = MockIThemeRepo();
  });

  ProviderContainer setUpContainer() {
    final container = ProviderContainer(
      overrides: [
        themeRepoProvider.overrideWithValue(mockIThemeRepo),
      ],
    );
    addTearDown(container.dispose);
    return container;
  }

  const tTheme = 'light';

  final tException = Exception('test_exception');

  group(
    'call',
    () {
      test(
        'should return proper data when Repo.getAppTheme returns normally',
        () async {
          // GIVEN
          when(() => mockIThemeRepo.getAppTheme())
              .thenAnswer((_) async => tTheme);
          final container = setUpContainer();

          // WHEN
          final getAppThemeUC = container.read(getAppThemeUCProvider);
          final result = await getAppThemeUC();

          // THEN
          verify(() => mockIThemeRepo.getAppTheme());
          expect(result, tTheme);
          verifyNoMoreInteractions(mockIThemeRepo);
        },
      );

      test(
        'should throw same Exception when Repo.getAppTheme throws',
        () async {
          // GIVEN
          when(() => mockIThemeRepo.getAppTheme()).thenThrow(tException);
          final container = setUpContainer();

          // WHEN
          final getAppThemeUC = container.read(getAppThemeUCProvider);
          final call = getAppThemeUC();

          // THEN
          await expectLater(() => call, throwsA(tException));
          verify(() => mockIThemeRepo.getAppTheme()).called(1);
          verifyNoMoreInteractions(mockIThemeRepo);
        },
      );
    },
  );
}

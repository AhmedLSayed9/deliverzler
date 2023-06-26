import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:deliverzler/core/core_features/theme/infrastructure/repos/theme_repo.dart';
import 'package:deliverzler/core/core_features/theme/presentation/providers/app_theme_provider.dart';
import 'package:deliverzler/core/core_features/theme/presentation/utils/app_theme.dart';
import 'package:deliverzler/core/presentation/utils/riverpod_framework.dart';
import '../../../../../utils.dart';

class MockThemeRepo extends Mock implements ThemeRepo {}

void main() {
  SharedPreferences.setMockInitialValues({'test': 'none'});
  TestWidgetsFlutterBinding.ensureInitialized();

  late MockThemeRepo mockThemeRepo;

  setUp(() {
    mockThemeRepo = MockThemeRepo();
  });

  ProviderContainer setUpRepoContainer() {
    return setUpContainer(
      overrides: [
        themeRepoProvider.overrideWithValue(mockThemeRepo),
      ],
    );
  }

  const tTheme = AppTheme.light;
  final tException = Exception('test_exception');
  final tStackTrace = StackTrace.current;

  const loadingState = AsyncLoading<AppTheme>();
  const tThemeState = AsyncData<AppTheme>(tTheme);
  final errorState = AsyncError<AppTheme>(tException, tStackTrace);

  group(
    'build (getUserStoredTheme)',
    () {
      test(
        'should emit AsyncData(tTheme) when ThemeRepo.getAppTheme returns normally',
        () async {
          // GIVEN
          when(() => mockThemeRepo.getAppTheme()).thenReturn(tTheme.name);

          final container = setUpRepoContainer();
          final listener = setUpListener(container, appThemeControllerProvider);

          // WHEN
          verifyOnly(listener, () => listener(null, loadingState));

          final call = container.read(appThemeControllerProvider.future);

          // THEN
          await expectLater(call, completion(tTheme));

          verifyInOrder([
            () => mockThemeRepo.getAppTheme(),
            () => listener(loadingState, tThemeState),
          ]);
          verifyNoMoreInteractions(mockThemeRepo);
          verifyNoMoreInteractions(listener);
        },
      );
      test(
        'should emit AsyncError when ThemeRepo.getAppTheme throws',
        () async {
          // GIVEN
          when(() => mockThemeRepo.getAppTheme()).thenAnswer(
            (_) => Error.throwWithStackTrace(tException, tStackTrace),
          );

          final container = setUpRepoContainer();
          final listener = setUpListener(container, appThemeControllerProvider);

          // WHEN
          verifyOnly(listener, () => listener(null, loadingState));

          final call = container.read(appThemeControllerProvider.future);

          // THEN
          await expectLater(call, throwsA(tException));

          verifyInOrder([
            () => mockThemeRepo.getAppTheme(),
            () => listener(loadingState, errorState),
          ]);
          verifyNoMoreInteractions(mockThemeRepo);
          verifyNoMoreInteractions(listener);
        },
      );
    },
  );

  group(
    'changeTheme',
    () {
      const tChangeTheme = AppTheme.dark;
      const tChangeThemeState = AsyncData<AppTheme>(tChangeTheme);

      test(
        'should emit AsyncData(tChangeTheme) then call ThemeRepo.cacheAppTheme',
        () async {
          // GIVEN
          when(() => mockThemeRepo.getAppTheme()).thenReturn(tTheme.name);
          when(() => mockThemeRepo.cacheAppTheme(any())).thenAnswer((_) async {});

          final container = setUpRepoContainer();
          await container.read(appThemeControllerProvider.future);
          final listener = setUpListener(container, appThemeControllerProvider);

          // WHEN
          verifyOnly(listener, () => listener(null, tThemeState));
          verifyOnly(mockThemeRepo, () => mockThemeRepo.getAppTheme());

          final call =
              container.read(appThemeControllerProvider.notifier).changeTheme(tChangeTheme);

          // THEN
          await expectLater(call, completion(null));

          verifyInOrder([
            () => listener(tThemeState, tChangeThemeState),
            () => mockThemeRepo.cacheAppTheme(tChangeTheme.name),
          ]);
          verifyNoMoreInteractions(mockThemeRepo);
          verifyNoMoreInteractions(listener);
        },
      );
    },
  );
}

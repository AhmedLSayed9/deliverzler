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

  const tTheme = AppThemeMode.light;
  final tException = Exception('test_exception');
  final tStackTrace = StackTrace.current;

  const tThemeState = AsyncData<AppThemeMode>(tTheme);
  final errorState = AsyncError<AppThemeMode>(tException, tStackTrace);

  group(
    'build (getUserStoredTheme)',
    () {
      test(
        'should emit AsyncData(tTheme) when ThemeRepo.getAppThemeMode returns normally',
        () async {
          // GIVEN
          when(() => mockThemeRepo.getAppThemeMode()).thenReturn(tTheme.name);

          final container = setUpRepoContainer();
          final listener = setUpListener(container, appThemeControllerProvider);

          // WHEN
          final call = container.read(appThemeControllerProvider.future);

          // THEN
          await expectLater(call, completion(tTheme));

          verifyInOrder([
            () => mockThemeRepo.getAppThemeMode(),
            () => listener(null, tThemeState),
          ]);
          verifyNoMoreInteractions(mockThemeRepo);
          verifyNoMoreInteractions(listener);
        },
      );
      test(
        'should emit AsyncError when ThemeRepo.getAppThemeMode throws',
        () async {
          // GIVEN
          when(() => mockThemeRepo.getAppThemeMode()).thenAnswer(
            (_) => Error.throwWithStackTrace(tException, tStackTrace),
          );

          final container = setUpRepoContainer();
          final listener = setUpListener(container, appThemeControllerProvider);

          // WHEN
          final call = container.read(appThemeControllerProvider.future);

          // THEN
          await expectLater(call, throwsA(tException));

          verifyInOrder([
            () => mockThemeRepo.getAppThemeMode(),
            () => listener(null, errorState),
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
      const tChangeTheme = AppThemeMode.dark;
      const tChangeThemeState = AsyncData<AppThemeMode>(tChangeTheme);

      test(
        'should emit AsyncData(tChangeTheme) then call ThemeRepo.cacheAppThemeMode',
        () async {
          // GIVEN
          when(() => mockThemeRepo.getAppThemeMode()).thenReturn(tTheme.name);
          when(() => mockThemeRepo.cacheAppThemeMode(any())).thenAnswer((_) async {});

          final container = setUpRepoContainer();
          await container.read(appThemeControllerProvider.future);
          final listener = setUpListener(container, appThemeControllerProvider);

          // WHEN
          verifyOnly(listener, () => listener(null, tThemeState));
          verifyOnly(mockThemeRepo, () => mockThemeRepo.getAppThemeMode());

          final call =
              container.read(appThemeControllerProvider.notifier).changeTheme(tChangeTheme);

          // THEN
          await expectLater(call, completion(null));

          verifyInOrder([
            () => listener(tThemeState, tChangeThemeState),
            () => mockThemeRepo.cacheAppThemeMode(tChangeTheme.name),
          ]);
          verifyNoMoreInteractions(mockThemeRepo);
          verifyNoMoreInteractions(listener);
        },
      );
    },
  );
}

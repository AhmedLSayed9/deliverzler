import '../../../../presentation/utils/riverpod_framework.dart';
import '../../infrastructure/repos/theme_repo.dart';
import '../utils/app_theme.dart';

part 'app_theme_provider.g.dart';

@Riverpod(keepAlive: true)
class AppThemeController extends _$AppThemeController {
  @override
  FutureOr<AppThemeMode> build() {
    return _getUserStoredTheme();
  }

  AppThemeMode _getUserStoredTheme() {
    final storedTheme = ref.watch(themeRepoProvider).getAppThemeMode();
    return AppThemeMode.values.byName(storedTheme);
  }

  Future<void> changeTheme(AppThemeMode appTheme) async {
    state = AsyncData(appTheme);
    await ref.watch(themeRepoProvider).cacheAppThemeMode(appTheme.name);
  }
}

import '../../../../infrastructure/local/shared_preferences_facade.dart';
import '../../../../presentation/utils/riverpod_framework.dart';
import '../../infrastructure/repos/theme_repo.dart';
import '../utils/app_theme.dart';

part 'app_theme_provider.g.dart';

@Riverpod(keepAlive: true)
class AppThemeController extends _$AppThemeController {
  @override
  Future<AppTheme> build() async {
    await ref.watch(sharedPrefsAsyncProvider.future);
    return _getUserStoredTheme();
  }

  Future<AppTheme> _getUserStoredTheme() async {
    final storedTheme = await ref.watch(themeRepoProvider).getAppTheme();
    return AppTheme.values.byName(storedTheme);
  }

  Future<void> changeTheme(AppTheme appTheme) async {
    state = AsyncData(appTheme);
    await ref.watch(themeRepoProvider).cacheAppTheme(appTheme.name);
  }
}

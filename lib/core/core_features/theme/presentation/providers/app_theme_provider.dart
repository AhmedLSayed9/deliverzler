import 'package:deliverzler/core/core_features/theme/domain/use_cases/get_app_theme_uc.dart';
import 'package:deliverzler/core/core_features/theme/domain/use_cases/set_app_theme_uc.dart';
import 'package:deliverzler/core/core_features/theme/presentation/utils/app_theme.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appThemeProvider =
    AsyncNotifierProvider<AppThemeNotifier, AppTheme>(AppThemeNotifier.new);

class AppThemeNotifier extends AsyncNotifier<AppTheme> {
  @override
  Future<AppTheme> build() {
    _getAppThemeUC = ref.watch(getAppThemeUCProvider);
    _setAppThemeUC = ref.watch(setAppThemeUCProvider);
    return _getUserStoredTheme();
  }

  late final GetAppThemeUC _getAppThemeUC;
  late final SetAppThemeUC _setAppThemeUC;

  Future<AppTheme> _getUserStoredTheme() async {
    final storedTheme = await _getAppThemeUC();
    return AppTheme.values.byName(storedTheme);
  }

  Future<void> changeTheme(AppTheme appTheme) async {
    state = AsyncData(appTheme);
    await _setAppThemeUC(appTheme.name);
  }
}

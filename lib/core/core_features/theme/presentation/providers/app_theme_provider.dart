import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../data/local/local_storage_caller/shared_pref_local_storage_caller.dart';
import '../../domain/use_cases/get_app_theme_uc.dart';
import '../../domain/use_cases/set_app_theme_uc.dart';
import '../utils/app_theme.dart';

part 'app_theme_provider.g.dart';

@Riverpod(keepAlive: true)
class AppThemeController extends _$AppThemeController {
  @override
  Future<AppTheme> build() async {
    await ref.watch(sharedPrefsFutureProvider.future);
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

import '../../../../infrastructure/error/app_exception.dart';
import '../../../../infrastructure/local/shared_preferences_facade.dart';
import '../../../../presentation/utils/riverpod_framework.dart';

part 'theme_local_data_source.g.dart';

@Riverpod(keepAlive: true)
ThemeLocalDataSource themeLocalDataSource(ThemeLocalDataSourceRef ref) {
  return ThemeLocalDataSource(
    sharedPreferences: ref.watch(sharedPreferencesFacadeProvider),
  );
}

class ThemeLocalDataSource {
  ThemeLocalDataSource({required this.sharedPreferences});

  final SharedPreferencesFacade sharedPreferences;

  static const String appThemeKey = 'app_theme';

  String getAppThemeMode() {
    final theme = sharedPreferences.restoreData<String>(appThemeKey);
    if (theme != null) {
      return theme;
    } else {
      throw const CacheException(
        type: CacheExceptionType.notFound,
        message: 'Cache Not Found',
      );
    }
  }

  Future<void> cacheAppThemeMode(String themeString) async {
    await sharedPreferences.saveData(
      value: themeString,
      key: appThemeKey,
    );
  }
}

abstract class IThemeRepo {
  Future<String> getAppTheme();

  Future<void> cacheAppTheme(String themeString);
}

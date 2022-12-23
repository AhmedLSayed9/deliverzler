abstract class ILocaleRepo {
  Future<String> getAppLocale();

  Future<void> cacheAppLocale(String languageCode);
}

import '../../../../infrastructure/error/app_exception.dart';
import '../../../../infrastructure/local/shared_preferences_facade.dart';
import '../../../../presentation/utils/riverpod_framework.dart';

part 'locale_local_data_source.g.dart';

@Riverpod(keepAlive: true)
LocaleLocalDataSource localeLocalDataSource(LocaleLocalDataSourceRef ref) {
  return LocaleLocalDataSource(
    sharedPreferences: ref.watch(sharedPreferencesFacadeProvider),
  );
}

class LocaleLocalDataSource {
  LocaleLocalDataSource({required this.sharedPreferences});

  final SharedPreferencesFacade sharedPreferences;

  static const String appLocaleKey = 'app_locale';

  String getAppLocale() {
    final locale = sharedPreferences.restoreData<String>(appLocaleKey);
    if (locale != null) {
      return locale;
    } else {
      throw const CacheException(
        type: CacheExceptionType.notFound,
        message: 'Cache Not Found',
      );
    }
  }

  Future<void> cacheAppLocale(String languageCode) async {
    await sharedPreferences.saveData(
      value: languageCode,
      key: appLocaleKey,
    );
  }
}

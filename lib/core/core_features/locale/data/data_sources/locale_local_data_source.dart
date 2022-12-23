import 'package:deliverzler/core/data/error/app_exception.dart';
import 'package:deliverzler/core/data/error/cache_exception_type.dart';
import 'package:deliverzler/core/data/local/local_storage_caller/i_local_storage_caller.dart';
import 'package:deliverzler/core/data/local/local_storage_caller/shared_pref_local_storage_caller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class ILocaleLocalDataSource {
  Future<String> getAppLocale();

  Future<void> cacheAppLocale(String languageCode);
}

final localeLocalDataSourceProvider = Provider<ILocaleLocalDataSource>(
  (ref) => LocaleLocalDataSource(
    localStorageService: ref.watch(localStorageCallerProvider),
  ),
);

class LocaleLocalDataSource implements ILocaleLocalDataSource {
  LocaleLocalDataSource({required this.localStorageService});

  final ILocalStorageCaller localStorageService;

  static const String appLocaleKey = 'app_locale';

  @override
  Future<String> getAppLocale() async {
    final locale = await localStorageService.restoreData(
      key: appLocaleKey,
      dataType: DataType.string,
    );
    if (locale != null) {
      return locale;
    } else {
      throw const CacheException(
        type: CacheExceptionType.notFound,
        message: 'Cache Not Found',
      );
    }
  }

  @override
  Future<void> cacheAppLocale(String languageCode) async {
    await localStorageService.saveData(
      value: languageCode,
      key: appLocaleKey,
      dataType: DataType.string,
    );
  }
}

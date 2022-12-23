import 'package:deliverzler/core/data/error/app_exception.dart';
import 'package:deliverzler/core/data/error/cache_exception_type.dart';
import 'package:deliverzler/core/data/local/local_storage_caller/i_local_storage_caller.dart';
import 'package:deliverzler/core/data/local/local_storage_caller/shared_pref_local_storage_caller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class IThemeLocalDataSource {
  Future<String> getAppTheme();

  Future<void> cacheAppTheme(String themeString);
}

final themeLocalDataSourceProvider = Provider<IThemeLocalDataSource>(
  (ref) => ThemeLocalDataSource(
    localStorageService: ref.watch(localStorageCallerProvider),
  ),
);

class ThemeLocalDataSource implements IThemeLocalDataSource {
  ThemeLocalDataSource({required this.localStorageService});

  final ILocalStorageCaller localStorageService;

  static const String appThemeKey = 'app_theme';

  @override
  Future<String> getAppTheme() async {
    final theme = await localStorageService.restoreData(
      key: appThemeKey,
      dataType: DataType.string,
    );
    if (theme != null) {
      return theme;
    } else {
      throw const CacheException(
        type: CacheExceptionType.notFound,
        message: 'Cache Not Found',
      );
    }
  }

  @override
  Future<void> cacheAppTheme(String themeString) async {
    await localStorageService.saveData(
      value: themeString,
      key: appThemeKey,
      dataType: DataType.string,
    );
  }
}

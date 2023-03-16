

import '../../../../data/error/app_exception.dart';
import '../../../../data/local/local_storage_caller/i_local_storage_caller.dart';
import '../../../../data/local/local_storage_caller/shared_pref_local_storage_caller.dart';
import '../../../../presentation/utils/riverpod_framework.dart';

part 'theme_local_data_source.g.dart';

abstract class IThemeLocalDataSource {
  Future<String> getAppTheme();

  Future<void> cacheAppTheme(String themeString);
}

@Riverpod(keepAlive: true)
IThemeLocalDataSource themeLocalDataSource(ThemeLocalDataSourceRef ref) {
  return ThemeLocalDataSource(
    localStorageService: ref.watch(localStorageCallerProvider),
  );
}

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

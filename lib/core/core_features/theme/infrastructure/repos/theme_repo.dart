import '../../../../presentation/utils/riverpod_framework.dart';
import '../data_sources/theme_local_data_source.dart';

part 'theme_repo.g.dart';

@Riverpod(keepAlive: true)
ThemeRepo themeRepo(ThemeRepoRef ref) {
  return ThemeRepo(
    localDataSource: ref.watch(themeLocalDataSourceProvider),
  );
}

class ThemeRepo {
  ThemeRepo({required this.localDataSource});

  final ThemeLocalDataSource localDataSource;

  String getAppTheme() => localDataSource.getAppTheme();

  Future<void> cacheAppTheme(String themeString) => localDataSource.cacheAppTheme(themeString);
}

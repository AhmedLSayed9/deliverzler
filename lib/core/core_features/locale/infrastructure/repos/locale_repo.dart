import '../../../../presentation/utils/riverpod_framework.dart';
import '../data_sources/locale_local_data_source.dart';

part 'locale_repo.g.dart';

@Riverpod(keepAlive: true)
LocaleRepo localeRepo(LocaleRepoRef ref) {
  return LocaleRepo(
    localDataSource: ref.watch(localeLocalDataSourceProvider),
  );
}

class LocaleRepo {
  LocaleRepo({required this.localDataSource});

  final LocaleLocalDataSource localDataSource;

  String getAppLocale() => localDataSource.getAppLocale();

  Future<void> cacheAppLocale(String languageCode) => localDataSource.cacheAppLocale(languageCode);
}

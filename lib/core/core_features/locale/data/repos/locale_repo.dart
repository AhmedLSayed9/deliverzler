import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../domain/repos/i_locale_repo.dart';
import '../data_sources/locale_local_data_source.dart';

part 'locale_repo.g.dart';

@Riverpod(keepAlive: true)
ILocaleRepo localeRepo(LocaleRepoRef ref) {
  return LocaleRepo(
    localDataSource: ref.watch(localeLocalDataSourceProvider),
  );
}

class LocaleRepo implements ILocaleRepo {
  LocaleRepo({required this.localDataSource});

  final ILocaleLocalDataSource localDataSource;

  @override
  Future<String> getAppLocale() async {
    final locale = await localDataSource.getAppLocale();
    return locale;
  }

  @override
  Future<void> cacheAppLocale(String languageCode) async {
    await localDataSource.cacheAppLocale(languageCode);
  }
}

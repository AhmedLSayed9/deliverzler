import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../domain/use_cases/use_case_base.dart';
import '../../data/repos/locale_repo.dart';
import '../repos/i_locale_repo.dart';

part 'set_app_locale_uc.g.dart';

@Riverpod(keepAlive: true)
SetAppLocaleUC setAppLocaleUC(SetAppLocaleUCRef ref) {
  return SetAppLocaleUC(
    localeRepo: ref.watch(localeRepoProvider),
  );
}

class SetAppLocaleUC implements UseCaseBase<void, String> {
  SetAppLocaleUC({required this.localeRepo});

  final ILocaleRepo localeRepo;

  @override
  Future<void> call(String languageCode) async {
    return await localeRepo.cacheAppLocale(languageCode);
  }
}

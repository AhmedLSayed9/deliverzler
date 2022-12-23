import 'package:deliverzler/core/core_features/locale/data/repos/locale_repo.dart';
import 'package:deliverzler/core/core_features/locale/domain/repos/i_locale_repo.dart';
import 'package:deliverzler/core/domain/use_cases/use_case_base.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final setAppLocaleUCProvider = Provider(
  (ref) => SetAppLocaleUC(
    localeRepo: ref.watch(localeRepoProvider),
  ),
);

class SetAppLocaleUC implements UseCaseBase<void, String> {
  SetAppLocaleUC({required this.localeRepo});

  final ILocaleRepo localeRepo;

  @override
  Future<void> call(String languageCode) async {
    return await localeRepo.cacheAppLocale(languageCode);
  }
}

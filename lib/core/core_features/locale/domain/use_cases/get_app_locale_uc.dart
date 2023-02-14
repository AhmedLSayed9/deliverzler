import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../domain/use_cases/use_case_base.dart';
import '../../data/repos/locale_repo.dart';
import '../repos/i_locale_repo.dart';

part 'get_app_locale_uc.g.dart';

@Riverpod(keepAlive: true)
GetAppLocaleUC getAppLocaleUC(GetAppLocaleUCRef ref) {
  return GetAppLocaleUC(
    localeRepo: ref.watch(localeRepoProvider),
  );
}

class GetAppLocaleUC implements UseCaseNoParamsBase<String> {
  GetAppLocaleUC({required this.localeRepo});

  final ILocaleRepo localeRepo;

  @override
  Future<String> call() async {
    return await localeRepo.getAppLocale();
  }
}

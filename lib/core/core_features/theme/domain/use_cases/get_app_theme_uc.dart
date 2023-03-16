

import '../../../../domain/use_cases/use_case_base.dart';
import '../../../../presentation/utils/riverpod_framework.dart';
import '../../data/repos/theme_repo.dart';
import '../repos/i_theme_repo.dart';

part 'get_app_theme_uc.g.dart';

@Riverpod(keepAlive: true)
GetAppThemeUC getAppThemeUC(GetAppThemeUCRef ref) {
  return GetAppThemeUC(
    themeRepo: ref.watch(themeRepoProvider),
  );
}

class GetAppThemeUC implements UseCaseNoParamsBase<String> {
  GetAppThemeUC({required this.themeRepo});

  final IThemeRepo themeRepo;

  @override
  Future<String> call() async {
    return await themeRepo.getAppTheme();
  }
}

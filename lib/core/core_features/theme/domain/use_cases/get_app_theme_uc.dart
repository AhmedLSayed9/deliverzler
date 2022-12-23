import 'package:deliverzler/core/core_features/theme/data/repos/theme_repo.dart';
import 'package:deliverzler/core/core_features/theme/domain/repos/i_theme_repo.dart';
import 'package:deliverzler/core/domain/use_cases/use_case_base.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

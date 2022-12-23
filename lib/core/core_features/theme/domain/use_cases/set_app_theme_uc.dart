import 'package:deliverzler/core/core_features/theme/data/repos/theme_repo.dart';
import 'package:deliverzler/core/core_features/theme/domain/repos/i_theme_repo.dart';
import 'package:deliverzler/core/domain/use_cases/use_case_base.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final setAppThemeUCProvider = Provider(
  (ref) => SetAppThemeUC(
    themeRepo: ref.watch(themeRepoProvider),
  ),
);

class SetAppThemeUC implements UseCaseBase<void, String> {
  SetAppThemeUC({required this.themeRepo});

  final IThemeRepo themeRepo;

  @override
  Future<void> call(String themeString) async {
    return await themeRepo.cacheAppTheme(themeString);
  }
}

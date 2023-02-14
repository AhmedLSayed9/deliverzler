import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../domain/use_cases/use_case_base.dart';
import '../../data/repos/theme_repo.dart';
import '../repos/i_theme_repo.dart';

part 'set_app_theme_uc.g.dart';

@Riverpod(keepAlive: true)
SetAppThemeUC setAppThemeUC(SetAppThemeUCRef ref) {
  return SetAppThemeUC(
    themeRepo: ref.watch(themeRepoProvider),
  );
}

class SetAppThemeUC implements UseCaseBase<void, String> {
  SetAppThemeUC({required this.themeRepo});

  final IThemeRepo themeRepo;

  @override
  Future<void> call(String themeString) async {
    return await themeRepo.cacheAppTheme(themeString);
  }
}

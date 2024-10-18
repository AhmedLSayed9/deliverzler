import 'package:flutter/material.dart';

import '../../../../../core/core_features/locale/presentation/providers/current_app_locale_provider.dart';
import '../../../../../core/core_features/theme/presentation/providers/app_theme_provider.dart';
import '../../../../../core/core_features/theme/presentation/providers/current_app_theme_provider.dart';
import '../../../../../core/core_features/theme/presentation/utils/app_theme.dart';
import '../../../../../core/core_features/theme/presentation/utils/app_static_colors.dart';
import '../../../../../core/core_features/theme/presentation/utils/custom_colors.dart';
import '../../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../../core/presentation/routing/app_router.dart';
import '../../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../../core/presentation/widgets/custom_tile_component.dart';
import 'settings_section_component.dart';

class AppSettingsSectionComponent extends ConsumerWidget {
  const AppSettingsSectionComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentLocale = ref.watch(currentAppLocaleProvider);
    final currentTheme = ref.watch(currentAppThemeModeProvider);

    return SettingsSectionComponent(
      headerIcon: Icons.settings,
      headerTitle: tr(context).appSettings,
      tileList: [
        CustomTileComponent(
          title: tr(context).theme,
          leadingIcon: currentTheme.settingsIcon,
          customTrailing: Container(
            constraints: const BoxConstraints(maxWidth: 40),
            child: Switch.adaptive(
              value: currentTheme == AppThemeMode.light,
              onChanged: (value) {
                final changeTheme = value ? AppThemeMode.light : AppThemeMode.dark;
                ref.read(appThemeControllerProvider.notifier).changeTheme(changeTheme);
              },
              thumbColor: WidgetStatePropertyAll(customColors(context).whiteColor),
              activeColor: AppStaticColors.lightOrange,
              activeTrackColor: AppStaticColors.lightOrange,
            ),
          ),
        ),
        CustomTileComponent(
          title: tr(context).language,
          leadingIcon: Icons.translate,
          trailingText: currentLocale.getLanguageName(context),
          onTap: () => const LanguageRoute().go(context),
        ),
      ],
    );
  }
}

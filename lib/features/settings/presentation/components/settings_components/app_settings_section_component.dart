import 'package:flutter/material.dart';

import '../../../../../core/core_features/locale/presentation/providers/current_app_locale_provider.dart';
import '../../../../../core/core_features/locale/presentation/utils/app_locale.dart';
import '../../../../../core/core_features/theme/presentation/providers/app_theme_provider.dart';
import '../../../../../core/core_features/theme/presentation/providers/current_app_theme_provider.dart';
import '../../../../../core/core_features/theme/presentation/utils/app_theme.dart';
import '../../../../../core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import '../../../../../core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import '../../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../../core/presentation/routing/app_router.dart';
import '../../../../../core/presentation/styles/sizes.dart';
import '../../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../../core/presentation/widgets/custom_tile_component.dart';
import '../../../../../core/presentation/widgets/platform_widgets/platform_switch.dart';
import 'settings_section_component.dart';

class AppSettingsSectionComponent extends ConsumerWidget {
  const AppSettingsSectionComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final currentLocale = ref.watch(currentAppLocaleProvider);
    final currentTheme = ref.watch(currentAppThemeProvider);

    return SettingsSectionComponent(
      headerIcon: Icons.settings,
      headerTitle: tr(context).appSettings,
      tileList: [
        CustomTileComponent(
          title: tr(context).theme,
          leadingIcon: currentTheme.getThemeIcon(),
          customTrailing: Container(
            constraints: const BoxConstraints(
              maxWidth: Sizes.buttonWidth40,
            ),
            child: PlatformSwitch(
              value: currentTheme == AppTheme.light,
              onChanged: (value) {
                final changeTheme = value ? AppTheme.light : AppTheme.dark;
                ref
                    .read(appThemeControllerProvider.notifier)
                    .changeTheme(changeTheme);
              },
              thumbColor: customColors(context).whiteColor,
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

import 'package:deliverzler/core/core_features/locale/presentation/utils/app_locale.dart';
import 'package:deliverzler/core/core_features/locale/presentation/providers/current_app_locale_provider.dart';
import 'package:deliverzler/core/core_features/theme/presentation/utils/app_theme.dart';
import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import 'package:deliverzler/core/core_features/theme/presentation/providers/app_theme_provider.dart';
import 'package:deliverzler/core/core_features/theme/presentation/providers/current_app_theme_provider.dart';
import 'package:deliverzler/core/presentation/routing/navigation_service.dart';
import 'package:deliverzler/core/presentation/routing/route_paths.dart';
import 'package:deliverzler/core/presentation/widgets/custom_tile_component.dart';
import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_switch.dart';
import 'package:deliverzler/features/settings/presentation/components/settings_components/settings_section_component.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';

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
            constraints: BoxConstraints(
              maxWidth: Sizes.buttonWidth44(context),
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
          onTap: () {
            NavigationService.push(
              context,
              isNamed: true,
              page: RoutePaths.language,
            );
          },
        ),
      ],
    );
  }
}

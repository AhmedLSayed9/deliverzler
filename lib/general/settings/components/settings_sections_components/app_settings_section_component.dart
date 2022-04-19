import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/routing/route_paths.dart';
import 'package:deliverzler/core/viewmodels/app_locale_provider.dart';
import 'package:deliverzler/core/viewmodels/app_theme_provider.dart';
import 'package:deliverzler/core/widgets/custom_tile_component.dart';
import 'package:deliverzler/general/settings/models/language_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/general/settings/components/settings_section_component.dart';

class AppSettingsSectionComponent extends ConsumerWidget {
  const AppSettingsSectionComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _selectedLanguage = ref.watch(appLocaleProvider);
    final _isDarkThemeMode = ref.watch(appThemeProvider) == ThemeMode.dark;

    return SettingsSectionComponent(
      headerIcon: Icons.settings,
      headerTitle: tr(context).appSettings,
      tileList: [
        CustomTileComponent(
          title: tr(context).theme,
          leadingIcon: !_isDarkThemeMode ? Icons.wb_sunny : Icons.nights_stay,
          customTrailing: Container(
            constraints: BoxConstraints(
              maxWidth: Sizes.switchThemeButtonWidth(context),
            ),
            child: PlatformSwitch(
              value: !_isDarkThemeMode,
              onChanged: (value) {
                ref
                    .watch(appThemeProvider.notifier)
                    .changeTheme(isLight: value);
              },
              material: (_, __) {
                return MaterialSwitchData(
                  activeColor: AppColors.white,
                  activeTrackColor: AppColors.lightOrange,
                );
              },
              cupertino: (_, __) {
                return CupertinoSwitchData(
                  activeColor: AppColors.lightOrange,
                );
              },
            ),
          ),
        ),
        CustomTileComponent(
          title: tr(context).language,
          leadingIcon: Icons.translate,
          trailingText: getCurrentLanguageName(
            context,
            _selectedLanguage?.languageCode,
          ),
          onTap: () {
            NavigationService.push(
              context,
              isNamed: true,
              page: RoutePaths.settingsLanguage,
            );
          },
        ),
      ],
    );
  }
}

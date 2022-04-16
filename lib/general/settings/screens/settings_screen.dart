import 'package:deliverzler/core/services/platform_service.dart';
import 'package:deliverzler/general/settings/components/logout_component.dart';
import 'package:deliverzler/general/settings/components/user_info_component.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/components/appbar_with_icon_component.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/screens/popup_page.dart';
import 'package:deliverzler/core/styles/app_images.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/general/settings/components/settings_sections_components/app_settings_section_component.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopUpPage(
      hasAppBar: true,
      appBarWithBack: PlatformService.instance.isMaterialApp() ? true : false,
      customTitle: AppBarWithIconComponent(
        icon: AppImages.settingsScreenIcon,
        title: tr(context).settings,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Sizes.screenVPaddingDefault(context),
            horizontal: Sizes.screenHPaddingDefault(context),
          ),
          child: Column(
            children: <Widget>[
              const UserInfoComponent(),
              SizedBox(
                height: Sizes.vMarginSmall(context),
              ),
              const AppSettingsSectionComponent(),
              SizedBox(
                height: Sizes.vMarginMedium(context),
              ),
              const LogoutComponent(),
            ],
          ),
        ),
      ),
    );
  }
}

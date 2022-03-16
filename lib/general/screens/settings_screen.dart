import 'package:deliverzler/general/components/settings_components/logout_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/components/appbar_with_icon_component.dart';
import 'package:deliverzler/core/services/init_services/localization_service.dart';
import 'package:deliverzler/core/screens/popup_page.dart';
import 'package:deliverzler/core/styles/app_images.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/viewmodels/main_core_provider.dart';
import 'package:deliverzler/general/components/settings_components/app_settings_section_component.dart';
import 'package:deliverzler/general/components/settings_components/settings_details_component.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _userModel = ref.watch(mainCoreProvider).getCurrentUser();

    return PopUpPage(
      appBarWithBack: true,
      appbarItems: [
        AppBarWithIconComponent(
          icon: AppImages.settingsScreenIcon,
          title: tr(context).settings,
        ),
      ],
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Sizes.screenVPaddingDefault(context),
            horizontal: Sizes.screenHPaddingDefault(context),
          ),
          child: Column(
            children: <Widget>[
              SettingsDetailsComponent(
                userModel: _userModel!,
              ),
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

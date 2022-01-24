import 'package:deliverzler/general/components/settings_components/logout_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/components/appbar_with_icon_component.dart';
import 'package:deliverzler/core/localization/app_localization.dart';
import 'package:deliverzler/core/screens/popup_page.dart';
import 'package:deliverzler/core/styles/app_images.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/viewmodels/main_core_viewmodel.dart';
import 'package:deliverzler/general/components/settings_components/app_settings_section_component.dart';
import 'package:deliverzler/general/components/settings_components/settings_details_component.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _userModel = ref.watch(mainCoreViewModel.notifier).getCurrentUser();

    return PopUpPage(
      appBarWithBack: true,
      appbarItems: [
        AppBarWithIconComponent(
          icon: AppImages.settingsScreenIcon,
          title: tr('settings'),
        ),
      ],
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Sizes.screenVPaddingDefault,
            horizontal: Sizes.screenHPaddingDefault,
          ),
          child: Column(
            children: <Widget>[
              SettingsDetailsComponent(
                userModel: _userModel!,
              ),
              SizedBox(
                height: Sizes.vMarginSmall,
              ),
              const AppSettingsSectionComponent(),
              SizedBox(
                height: Sizes.vMarginMedium,
              ),
              const LogoutComponent(),
            ],
          ),
        ),
      ),
    );
  }
}

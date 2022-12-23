import 'package:deliverzler/core/presentation/screens/nested_screen_wrapper.dart';
import 'package:deliverzler/core/presentation/utils/scroll_behaviors.dart';
import 'package:deliverzler/features/settings/presentation/components/settings_components/app_settings_section_component.dart';
import 'package:deliverzler/features/settings/presentation/components/settings_components/logout_component.dart';
import 'package:deliverzler/features/settings/presentation/components/settings_components/user_details_component.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedScreenWrapper(
      body: ScrollConfiguration(
        behavior: MainScrollBehavior(),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: Sizes.screenPaddingV20(context),
              horizontal: Sizes.screenPaddingH40(context),
            ),
            child: Column(
              children: <Widget>[
                const UserDetailsComponent(),
                SizedBox(
                  height: Sizes.marginV16(context),
                ),
                const AppSettingsSectionComponent(),
                SizedBox(
                  height: Sizes.marginV22(context),
                ),
                const LogoutComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

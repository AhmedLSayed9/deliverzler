import 'package:flutter/material.dart';

import '../../../../../core/presentation/screens/nested_screen_scaffold.dart';
import '../../../../../core/presentation/styles/sizes.dart';
import '../../components/settings_components/app_settings_section_component.dart';
import '../../components/settings_components/logout_component.dart';
import '../../components/settings_components/user_details_component.dart';

class SettingsScreenCompact extends StatelessWidget {
  const SettingsScreenCompact({super.key});

  @override
  Widget build(BuildContext context) {
    return const NestedScreenScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: Sizes.screenMarginV20,
            horizontal: Sizes.screenMarginH36,
          ),
          child: Column(
            children: [
              UserDetailsComponent(),
              SizedBox(
                height: Sizes.marginV12,
              ),
              AppSettingsSectionComponent(),
              SizedBox(
                height: Sizes.marginV20,
              ),
              LogoutComponent(),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:deliverzler/core/presentation/screens/nested_screen_wrapper.dart';
import 'package:deliverzler/core/presentation/utils/scroll_behaviors.dart';
import 'package:deliverzler/features/profile/presentation/components/profile_form_component.dart';
import 'package:deliverzler/features/profile/presentation/components/user_details_component.dart';
import 'package:deliverzler/features/profile/presentation/components/user_image_component.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

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
                const UserImageComponent(),
                SizedBox(
                  height: Sizes.marginV8(context),
                ),
                const UserDetailsComponent(),
                SizedBox(
                  height: Sizes.marginV30(context),
                ),
                const ProfileFormComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

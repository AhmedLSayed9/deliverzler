import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/components/appbar_with_icon_component.dart';
import 'package:deliverzler/core/localization/app_localization.dart';
import 'package:deliverzler/core/screens/popup_page.dart';
import 'package:deliverzler/core/styles/app_images.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/loading_indicators.dart';
import 'package:deliverzler/modules/profile/components/profile_form_component.dart';
import 'package:deliverzler/modules/profile/components/user_details_component.dart';
import 'package:deliverzler/modules/profile/components/user_image_component.dart';
import 'package:deliverzler/modules/profile/viewmodels/profile_viewmodel.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final profileIsLoading =
        ref.watch(profileViewModel.select((profileVM) => profileVM.isLoading));

    return PopUpPage(
      appBarWithBack: true,
      appbarItems: [
        AppBarWithIconComponent(
          icon: AppImages.profileScreenIcon,
          title: tr('myProfile'),
        ),
      ],
      child: profileIsLoading
          ? LoadingIndicators.instance.smallLoadingAnimation(context)
          : SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                vertical: Sizes.screenVPaddingDefault,
                horizontal: Sizes.screenHPaddingDefault,
              ),
              child: Column(
                children: [
                  const UserImageComponent(),
                  SizedBox(
                    height: Sizes.vMarginComment,
                  ),
                  const UserDetailsComponent(),
                  SizedBox(
                    height: Sizes.vMarginHigh,
                  ),
                  const ProfileFormComponent(),
                ],
              ),
            ),
    );
  }
}

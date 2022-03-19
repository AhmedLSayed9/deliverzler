import 'package:deliverzler/modules/profile/viewmodels/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/components/appbar_with_icon_component.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/screens/popup_page.dart';
import 'package:deliverzler/core/styles/app_images.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/loading_indicators.dart';
import 'package:deliverzler/modules/profile/components/profile_form_component.dart';
import 'package:deliverzler/modules/profile/components/user_details_component.dart';
import 'package:deliverzler/modules/profile/components/user_image_component.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopUpPage(
      appBarWithBack: true,
      appbarItems: [
        AppBarWithIconComponent(
          icon: AppImages.profileScreenIcon,
          title: tr(context).myProfile,
        ),
      ],
      child: Consumer(builder: (context, ref, child) {
        final profileIsLoading = ref.watch(
          profileProvider.select((state) =>
              state.maybeWhen(loading: () => true, orElse: () => false)),
        );
        return profileIsLoading
            ? LoadingIndicators.instance.smallLoadingAnimation(context)
            : SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  vertical: Sizes.screenVPaddingDefault(context),
                  horizontal: Sizes.screenHPaddingDefault(context),
                ),
                child: Column(
                  children: [
                    const UserImageComponent(),
                    SizedBox(
                      height: Sizes.vMarginComment(context),
                    ),
                    const UserDetailsComponent(),
                    SizedBox(
                      height: Sizes.vMarginHigh(context),
                    ),
                    const ProfileFormComponent(),
                  ],
                ),
              );
      }),
    );
  }
}

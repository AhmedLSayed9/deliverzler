import 'package:deliverzler/modules/profile/viewmodels/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserDetailsComponent extends ConsumerWidget {
  const UserDetailsComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final userModel =
        ref.watch(profileViewModel.select((profileVM) => profileVM.userModel));

    return Column(
      children: [
        CustomText.h3(
          context,
          userModel.name!.isEmpty
              ? 'User${userModel.uId.substring(0, 6)}'
              : userModel.name!,
          weight: FontStyles.fontWeightBold,
          alignment: Alignment.center,
        ),
        SizedBox(
          height: Sizes.vMarginDot,
        ),
        CustomText.h5(
          context,
          userModel.email,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}

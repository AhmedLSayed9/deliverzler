import 'package:deliverzler/auth/repos/user_repo.dart';
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
    final _userModel = ref.watch(userRepoProvider).userModel!;

    return Column(
      children: [
        CustomText.h3(
          context,
          _userModel.name!.isEmpty
              ? 'User${_userModel.uId.substring(0, 6)}'
              : _userModel.name!,
          weight: FontStyles.fontWeightBold,
          alignment: Alignment.center,
        ),
        SizedBox(
          height: Sizes.vMarginDot(context),
        ),
        CustomText.h5(
          context,
          _userModel.email,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}

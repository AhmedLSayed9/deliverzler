import 'package:deliverzler/authentication/repos/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/cached_network_image_circular.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';

class MainDrawerUserInfoComponent extends ConsumerWidget {
  const MainDrawerUserInfoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _userModel = ref.watch(userRepoProvider).userModel;

    return Column(
      children: [
        CachedNetworkImageCircular(
          imageUrl: _userModel!.image,
          radius: Sizes.userImageMediumRadius(context),
        ),
        SizedBox(
          height: Sizes.vMarginComment(context),
        ),
        CustomText.h3(
          context,
          _userModel.name!.isEmpty
              ? 'User${_userModel.uId.substring(0, 6)}'
              : _userModel.name!,
          weight: FontStyles.fontWeightMedium,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          alignment: Alignment.center,
        ),
        SizedBox(
          height: Sizes.vMarginDot(context),
        ),
        CustomText.h5(
          context,
          _userModel.email,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}

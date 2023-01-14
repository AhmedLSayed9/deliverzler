import 'package:deliverzler/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/cached_network_image_circular.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';

class MainDrawerUserInfoComponent extends ConsumerWidget {
  const MainDrawerUserInfoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    //final _userModel = ref.watch(userRepoProvider).userModel;
    final UserModel userModel = UserModel.fromJson(const {});

    return Column(
      children: [
        CachedNetworkImageCircular(
          imageUrl: userModel.image,
          radius: Sizes.imageR56,
        ),
        const SizedBox(
          height: Sizes.marginV6,
        ),
        CustomText.f18(
          context,
          userModel.name!.isEmpty
              ? 'User${userModel.id.substring(0, 6)}'
              : userModel.name!,
          weight: FontStyles.fontWeightMedium,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          //alignment: Alignment.center,
        ),
        const SizedBox(
          height: Sizes.marginV2,
        ),
        CustomText.f14(
          context,
          userModel.email,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          //alignment: Alignment.center,
        ),
      ],
    );
  }
}

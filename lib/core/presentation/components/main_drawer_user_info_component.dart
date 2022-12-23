import 'package:flutter/material.dart';

import '../../../auth/infrastructure/dtos/user_dto.dart';
import '../styles/font_styles.dart';
import '../styles/sizes.dart';
import '../utils/riverpod_framework.dart';
import '../widgets/cached_network_image_circular.dart';
import '../widgets/custom_text.dart';

class MainDrawerUserInfoComponent extends ConsumerWidget {
  const MainDrawerUserInfoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    //final _userModel = ref.watch(userRepoProvider).userModel;
    //ignore this
    final UserDto userModel = UserDto.fromJson(const {});

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

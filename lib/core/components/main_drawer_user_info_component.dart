import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/viewmodels/main_core_viewmodel.dart';
import 'package:deliverzler/core/widgets/cached_network_image_circular.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';

class MainDrawerUserInfoComponent extends ConsumerWidget {
  const MainDrawerUserInfoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _userModel = ref.watch(mainCoreViewModel.notifier).getCurrentUser();

    return Column(
      children: [
        CachedNetworkImageCircular(
          imageUrl: _userModel!.image,
          radius: Sizes.userImageMediumRadius,
        ),
        SizedBox(
          height: Sizes.vMarginComment,
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
          height: Sizes.vMarginDot,
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

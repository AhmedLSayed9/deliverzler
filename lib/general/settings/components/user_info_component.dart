import 'package:deliverzler/auth/repos/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/cached_network_image_circular.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserInfoComponent extends ConsumerWidget {
  const UserInfoComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _userModel = ref.watch(userRepoProvider).userModel;

    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomText.h2(
                context,
                _userModel!.name!.isEmpty
                    ? 'User${_userModel.uId.substring(0, 6)}'
                    : _userModel.name!,
                weight: FontStyles.fontWeightBold,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              CustomText.h4(
                context,
                _userModel.email,
                color: Theme.of(context).textTheme.headline5!.color,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SizedBox(
          width: Sizes.hMarginDot(context),
        ),
        CachedNetworkImageCircular(
          imageUrl: _userModel.image,
          radius: Sizes.userImageSmallRadius(context),
        ),
      ],
    );
  }
}

import 'package:deliverzler/auth/repos/user_repo.dart';
import 'package:deliverzler/modules/profile/viewmodels/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/components/image_pick_component.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/cached_network_image_circular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserImageComponent extends ConsumerWidget {
  const UserImageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _userModel = ref.watch(userRepoProvider).userModel!;
    final _profileVM = ref.watch(profileProvider.notifier);

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CachedNetworkImageCircular(
          imageUrl: _userModel.image,
          radius: Sizes.userImageHighRadius(context),
        ),
        Padding(
          padding: EdgeInsets.only(right: Sizes.hPaddingTiny(context)),
          child: ImagePickComponent(
            pickFromCameraFunction: () {
              _profileVM.updateProfileImage(context, fromCamera: true);
            },
            pickFromGalleryFunction: () {
              _profileVM.updateProfileImage(context, fromCamera: false);
            },
          ),
        ),
      ],
    );
  }
}

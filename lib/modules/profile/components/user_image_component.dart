import 'package:deliverzler/modules/profile/viewmodels/profile_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/components/image_pick_component.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/cached_network_image_circular.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserImageComponent extends ConsumerWidget {
  const UserImageComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final profileVM = ref.watch(profileViewModel);

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        CachedNetworkImageCircular(
          imageUrl: profileVM.userModel.image,
          radius: Sizes.userImageHighRadius,
        ),
        Padding(
          padding: EdgeInsets.only(right: Sizes.hPaddingTiny),
          child: ImagePickComponent(
            pickFromCameraFunction: () {
              profileVM.updateProfileImage(fromCamera: true);
            },
            pickFromGalleryFunction: () {
              profileVM.updateProfileImage(fromCamera: false);
            },
          ),
        ),
      ],
    );
  }
}

import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/features/profile/presentation/components/user_details_component.dart';
import 'package:deliverzler/features/profile/presentation/components/user_image_component.dart';
import 'package:flutter/material.dart';

class ProfileHeaderComponent extends StatelessWidget {
  const ProfileHeaderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        UserImageComponent(),
        SizedBox(
          height: Sizes.marginV12,
        ),
        UserDetailsComponent(),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/presentation/styles/sizes.dart';
import 'user_details_component.dart';
import 'user_image_component.dart';

class ProfileHeaderComponent extends StatelessWidget {
  const ProfileHeaderComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UserImageComponent(),
        SizedBox(
          height: Sizes.marginV12,
        ),
        UserDetailsComponent(),
      ],
    );
  }
}

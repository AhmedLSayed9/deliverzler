import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../auth/presentation/providers/auth_state_provider.dart';
import '../../../../../core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import '../../../../../core/presentation/styles/font_styles.dart';
import '../../../../../core/presentation/styles/sizes.dart';
import '../../../../../core/presentation/widgets/cached_network_image_circular.dart';
import '../../../../../core/presentation/widgets/custom_text.dart';

class UserDetailsComponent extends ConsumerWidget {
  const UserDetailsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(currentUserProvider);

    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomText.f18(
                context,
                user.name ?? 'User${user.id.substring(0, 6)}',
                weight: FontStyles.fontWeightBold,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              CustomText.f16(
                context,
                user.email,
                color: customColors(context).font14Color,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: Sizes.marginV2,
        ),
        CachedNetworkImageCircular(
          imageUrl: user.image,
          radius: Sizes.imageR28,
        ),
      ],
    );
  }
}

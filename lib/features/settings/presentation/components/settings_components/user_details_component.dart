import 'package:deliverzler/auth/presentation/providers/user_provider.dart';
import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/cached_network_image_circular.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserDetailsComponent extends ConsumerWidget {
  const UserDetailsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(currentuserControllerProvider);

    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomText.f24(
                context,
                user.name ?? 'User${user.id.substring(0, 6)}',
                weight: FontStyles.fontWeightBold,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              CustomText.f18(
                context,
                user.email,
                color: customColors(context).font14Color,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        SizedBox(
          width: Sizes.marginH4(context),
        ),
        CachedNetworkImageCircular(
          imageUrl: user.image,
          radius: Sizes.imageRadius30(context),
        ),
      ],
    );
  }
}

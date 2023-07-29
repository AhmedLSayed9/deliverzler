import 'package:flutter/material.dart';

import '../../../../../auth/presentation/providers/auth_state_provider.dart';
import '../../../../../core/presentation/styles/styles.dart';
import '../../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../../core/presentation/widgets/cached_network_image_circular.dart';

class UserDetailsComponent extends ConsumerWidget {
  const UserDetailsComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                user.name ?? 'User${user.id.substring(0, 6)}',
                style: TextStyles.f18(context).copyWith(fontWeight: FontStyles.fontWeightBold),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                user.email,
                style: TextStyles.f16(context),
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

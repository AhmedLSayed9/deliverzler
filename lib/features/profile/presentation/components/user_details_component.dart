import 'package:flutter/material.dart';

import '../../../../auth/presentation/providers/auth_state_provider.dart';
import '../../../../core/presentation/styles/font_styles.dart';
import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/widgets/custom_text.dart';

class UserDetailsComponent extends ConsumerWidget {
  const UserDetailsComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Column(
      children: [
        CustomText.f18(
          context,
          user.name ?? 'User${user.id.substring(0, 6)}',
          weight: FontStyles.fontWeightBold,
        ),
        const SizedBox(
          height: Sizes.marginV2,
        ),
        CustomText.f16(
          context,
          user.email,
        ),
      ],
    );
  }
}

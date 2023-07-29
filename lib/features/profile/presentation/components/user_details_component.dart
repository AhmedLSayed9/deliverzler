import 'package:flutter/material.dart';

import '../../../../auth/presentation/providers/auth_state_provider.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';

class UserDetailsComponent extends ConsumerWidget {
  const UserDetailsComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(currentUserProvider);

    return Column(
      children: [
        Text(
          user.name ?? 'User${user.id.substring(0, 6)}',
          style: TextStyles.f18(context).copyWith(fontWeight: FontStyles.fontWeightBold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: Sizes.marginV2,
        ),
        Text(
          user.email,
          style: TextStyles.f16(context),
        ),
      ],
    );
  }
}

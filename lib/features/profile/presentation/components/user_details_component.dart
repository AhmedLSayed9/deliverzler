import 'package:deliverzler/auth/presentation/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserDetailsComponent extends ConsumerWidget {
  const UserDetailsComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final user = ref.watch(currentuserControllerProvider);

    return Column(
      children: [
        CustomText.f20(
          context,
          user.name ?? 'User${user.id.substring(0, 6)}',
          weight: FontStyles.fontWeightBold,
          alignment: Alignment.center,
        ),
        SizedBox(
          height: Sizes.marginV4(context),
        ),
        CustomText.f16(
          context,
          user.email,
          alignment: Alignment.center,
        ),
      ],
    );
  }
}

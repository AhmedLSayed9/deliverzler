import 'package:flutter/material.dart';

import '../helpers/localization_helper.dart';
import '../styles/app_images.dart';
import '../styles/font_styles.dart';
import '../styles/sizes.dart';
import '../utils/riverpod_framework.dart';
import '../widgets/custom_icon.dart';
import '../widgets/custom_text.dart';

class MainDrawerBottomComponent extends ConsumerWidget {
  const MainDrawerBottomComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
        start: Sizes.drawerPaddingH28,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CustomText.f18(
            context,
            tr(context).appName,
            weight: FontStyles.fontWeightExtraBold,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(
            width: Sizes.marginH6,
          ),
          CustomIcon.i32(
            AppImages.appLogoIcon,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}

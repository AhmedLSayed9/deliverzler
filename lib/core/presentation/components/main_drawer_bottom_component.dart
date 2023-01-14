import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/styles/app_images.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_icon.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';

class MainDrawerBottomComponent extends ConsumerWidget {
  const MainDrawerBottomComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
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
            context,
            AppImages.appLogoIcon,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}

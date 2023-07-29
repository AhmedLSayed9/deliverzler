import 'package:flutter/material.dart';

import '../../../gen/my_assets.dart';
import '../helpers/localization_helper.dart';
import '../styles/styles.dart';
import '../utils/riverpod_framework.dart';

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
          Text(
            tr(context).appName,
            style: TextStyles.f18(context).copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontStyles.fontWeightExtraBold,
            ),
          ),
          const SizedBox(
            width: Sizes.marginH6,
          ),
          Image.asset(
            MyAssets.ASSETS_IMAGES_CORE_APP_LOGO_PNG,
            height: 32,
            width: 32,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../gen/my_assets.dart';
import '../helpers/localization_helper.dart';
import '../styles/font_styles.dart';
import '../styles/sizes.dart';
import '../utils/riverpod_framework.dart';
import '../widgets/custom_text.dart';
import 'main_drawer_bottom_component.dart';
import 'main_drawer_user_info_component.dart';

class MainDrawer extends ConsumerWidget {
  const MainDrawer({
    required this.scaffoldKey,
    super.key,
  });
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final _indexNotifier = 0;
    /*ref.watch(HomeBaseNavProviders.currentIndex.notifier);*/

    return SizedBox(
      width: Sizes.drawerWidth240,
      child: Drawer(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.drawerPaddingV88,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MainDrawerUserInfoComponent(),
                const SizedBox(
                  height: Sizes.marginV28,
                ),
                DrawerItem(
                  title: tr(context).myProfile,
                  icon: MyAssets.ASSETS_ICONS_SCREENS_ICONS_PROFILE_PNG,
                  onTap: () {
                    scaffoldKey.currentState!.openEndDrawer();
                    //_indexNotifier.state = 0;
                  },
                ),
                DrawerItem(
                  title: tr(context).settings,
                  icon: MyAssets.ASSETS_ICONS_SCREENS_ICONS_SETTINGS_PNG,
                  onTap: () {
                    scaffoldKey.currentState!.openEndDrawer();
                    //_indexNotifier.state = 2;
                  },
                ),
                const SizedBox(
                  height: Sizes.marginV20,
                ),
                const MainDrawerBottomComponent(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    required this.title,
    required this.icon,
    required this.onTap,
    super.key,
  });
  final String title;
  final String icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ImageIcon(
        AssetImage(icon),
      ),
      title: CustomText.f18(
        context,
        title,
        weight: FontStyles.fontWeightMedium,
      ),
      onTap: onTap,
      horizontalTitleGap: 0,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: Sizes.drawerPaddingH28,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../helpers/localization_helper.dart';
import '../styles/app_images.dart';
import '../styles/font_styles.dart';
import '../styles/sizes.dart';
import '../widgets/custom_text.dart';
import 'main_drawer_bottom_component.dart';
import 'main_drawer_user_info_component.dart';

class MainDrawer extends ConsumerWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MainDrawer({
    required this.scaffoldKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
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
                  icon: AppImages.profileScreenIcon,
                  onTap: () {
                    scaffoldKey.currentState!.openEndDrawer();
                    //_indexNotifier.state = 0;
                  },
                ),
                DrawerItem(
                  title: tr(context).settings,
                  icon: AppImages.settingsScreenIcon,
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
  final String title;
  final String icon;
  final VoidCallback onTap;

  const DrawerItem({
    required this.title,
    required this.icon,
    required this.onTap,
    Key? key,
  }) : super(key: key);

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

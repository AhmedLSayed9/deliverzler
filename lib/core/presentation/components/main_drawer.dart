import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/components/main_drawer_bottom_component.dart';
import 'package:deliverzler/core/presentation/components/main_drawer_user_info_component.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/styles/app_images.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
      width: Sizes.drawerWidth(context),
      child: Drawer(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: Sizes.drawerPaddingV(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MainDrawerUserInfoComponent(),
                SizedBox(
                  height: Sizes.marginV30(context),
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
                SizedBox(
                  height: Sizes.marginV22(context),
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
      contentPadding: EdgeInsets.symmetric(
        horizontal: Sizes.drawerPaddingH(context),
      ),
    );
  }
}

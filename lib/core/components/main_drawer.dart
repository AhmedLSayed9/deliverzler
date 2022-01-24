import 'package:flutter/material.dart';
import 'package:deliverzler/core/components/main_drawer_bottom_component.dart';
import 'package:deliverzler/core/components/main_drawer_user_info_component.dart';
import 'package:deliverzler/core/localization/app_localization.dart';
import 'package:deliverzler/core/services/navigation_service.dart';
import 'package:deliverzler/core/styles/app_images.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/utils/routes.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';

class MainDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MainDrawer({
    required this.scaffoldKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.mainDrawerWidth,
      child: Drawer(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: Sizes.mainDrawerVPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MainDrawerUserInfoComponent(),
                SizedBox(
                  height: Sizes.vMarginHigh,
                ),
                DrawerItem(
                  title: tr('myProfile'),
                  icon: AppImages.profileScreenIcon,
                  onTap: () {
                    scaffoldKey.currentState!.openEndDrawer();
                    NavigationService.navigateTo(
                      navigationMethod: NavigationMethod.push,
                      isNamed: true,
                      page: RoutePaths.profile,
                    );
                  },
                ),
                DrawerItem(
                  title: tr('settings'),
                  icon: AppImages.settingsScreenIcon,
                  onTap: () {
                    scaffoldKey.currentState!.openEndDrawer();
                    NavigationService.navigateTo(
                      navigationMethod: NavigationMethod.push,
                      isNamed: true,
                      page: RoutePaths.settings,
                    );
                  },
                ),
                SizedBox(
                  height: Sizes.vMarginMedium,
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
      title: CustomText.h4(
        context,
        title,
        weight: FontStyles.fontWeightMedium,
      ),
      onTap: onTap,
      horizontalTitleGap: 0,
      contentPadding: EdgeInsets.symmetric(
        horizontal: Sizes.mainDrawerHPadding,
      ),
    );
  }
}

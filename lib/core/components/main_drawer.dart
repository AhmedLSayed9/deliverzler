import 'package:deliverzler/modules/home/viewmodels/home_state_providers.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/components/main_drawer_bottom_component.dart';
import 'package:deliverzler/core/components/main_drawer_user_info_component.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/styles/app_images.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainDrawer extends ConsumerWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const MainDrawer({
    required this.scaffoldKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return SizedBox(
      width: Sizes.mainDrawerWidth(context),
      child: Drawer(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: Sizes.mainDrawerVPadding(context),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const MainDrawerUserInfoComponent(),
                SizedBox(
                  height: Sizes.vMarginHigh(context),
                ),
                DrawerItem(
                  title: tr(context).myProfile,
                  icon: AppImages.profileScreenIcon,
                  onTap: () {
                    scaffoldKey.currentState!.openEndDrawer();
                    ref.watch(homeNavIndexProvider.notifier).state = 0;
                  },
                ),
                DrawerItem(
                  title: tr(context).settings,
                  icon: AppImages.settingsScreenIcon,
                  onTap: () {
                    scaffoldKey.currentState!.openEndDrawer();
                    ref.watch(homeNavIndexProvider.notifier).state = 2;
                  },
                ),
                SizedBox(
                  height: Sizes.vMarginMedium(context),
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
        horizontal: Sizes.mainDrawerHPadding(context),
      ),
    );
  }
}

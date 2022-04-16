import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/services/platform_service.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

PlatformNavBar? bottomNavBarComponent(
    BuildContext context, {
      required int currentIndex,
      required Function(int) itemChanged,
    }) {
  if(PlatformService.instance.isMaterialApp()) return null;
  return PlatformNavBar(
    currentIndex: currentIndex,
    itemChanged: itemChanged,
    items: [
      BottomNavigationBarItem(
        icon: Icon(PlatformIcons(context).accountCircleSolid),
        label: tr(context).myProfile,
      ),
      BottomNavigationBarItem(
        icon: Icon(PlatformIcons(context).home),
        label: tr(context).home,
      ),
      BottomNavigationBarItem(
        icon: Icon(PlatformIcons(context).settingsSolid),
        label: tr(context).settings,
      ),
    ],
    backgroundColor:
    Theme.of(context).bottomNavigationBarTheme.backgroundColor ??
        Theme.of(context).bottomAppBarColor,
    material: (_, __) {
      return MaterialNavBarData(
        elevation: 26,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: Sizes.navBarIconRadius(context),
        selectedItemColor: Theme.of(context).colorScheme.primary,
      );
    },
    cupertino: (_, __) {
      return CupertinoTabBarData(
        height: Sizes.cupertinoNavBarHeight(context),
        iconSize: Sizes.navBarIconRadius(context),
        activeColor: Theme.of(context).colorScheme.primary,
      );
    },
  );
}
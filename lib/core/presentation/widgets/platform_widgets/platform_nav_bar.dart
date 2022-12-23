import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_base_widget.dart';

class PlatformNavBar
    extends PlatformBaseWidget<NavigationBar, CupertinoTabBar> {
  const PlatformNavBar({
    super.key,
    this.widgetKey,
    this.currentIndex = 0,
    this.onTap,
    this.backgroundColor,
    this.height,
    required this.materialData,
    required this.cupertinoData,
  });

  final Key? widgetKey;
  final int currentIndex;
  final ValueChanged<int>? onTap;
  final Color? backgroundColor;
  final double? height;
  final MaterialBottomNavBarData materialData;
  final CupertinoTabBarData cupertinoData;

  @override
  NavigationBar createMaterialWidget(BuildContext context) {
    return NavigationBar(
      key: widgetKey,
      destinations: materialData.destinations,
      selectedIndex: currentIndex,
      onDestinationSelected: onTap,
      backgroundColor: backgroundColor,
      height: height ?? 80,
      elevation: materialData.elevation,
      surfaceTintColor: materialData.surfaceTintColor,
      animationDuration: materialData.animationDuration,
      labelBehavior: materialData.labelBehavior,
    );
  }

  @override
  CupertinoTabBar createCupertinoWidget(BuildContext context) {
    return CupertinoTabBar(
      key: widgetKey,
      items: cupertinoData.items,
      currentIndex: currentIndex,
      onTap: onTap,
      backgroundColor: backgroundColor,
      height: height ?? 50,
      activeColor: cupertinoData.activeColor,
    );
  }
}

class MaterialBottomNavBarData {
  MaterialBottomNavBarData({
    required this.destinations,
    this.animationDuration,
    this.surfaceTintColor,
    this.elevation,
    this.labelBehavior,
  });

  final List<Widget> destinations;
  final Duration? animationDuration;
  final Color? surfaceTintColor;
  final double? elevation;
  final NavigationDestinationLabelBehavior? labelBehavior;
}

class CupertinoTabBarData {
  const CupertinoTabBarData({
    required this.items,
    this.activeColor,
  });

  final List<BottomNavigationBarItem> items;
  final Color? activeColor;
}

import 'package:flutter/material.dart';

import '../../../../core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import '../../../../core/presentation/styles/font_styles.dart';
import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/widgets/platform_widgets/platform_nav_bar.dart';
import '../utils/tab_item.dart';

class BottomNavBarComponent extends PlatformNavBar {
  BottomNavBarComponent(
    BuildContext context, {
    required TabItem currentTab, required ValueChanged<TabItem> onSelectTab, super.key,
  }) : super(
          currentIndex: currentTab.index,
          onTap: (index) {
            onSelectTab(TabItem.values[index]);
          },
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor ??
                  Theme.of(context).bottomAppBarTheme.color,
          height: Sizes.bottomNavBarHeight60,
          materialData: MaterialBottomNavBarData(
            destinations: TabItem.values
                .map((tabItem) => Theme(
                      data: Theme.of(context).copyWith(
                        navigationBarTheme: NavigationBarThemeData(
                          labelTextStyle:
                              MaterialStateProperty.resolveWith((states) {
                            return TextStyle(
                              color: customColors(context).font28Color,
                              fontSize: Sizes.font12,
                              fontFamily: FontStyles.fontFamily(context),
                            );
                          }),
                        ),
                      ),
                      child: NavigationDestination(
                        icon: tabItem.getTabItemIcon(context),
                        selectedIcon: tabItem.getTabItemSelectedIcon(context),
                        label: tabItem.getTabItemLabel(context),
                      ),
                    ),)
                .toList(),
            elevation: 2,
          ),
          cupertinoData: CupertinoTabBarData(
            items: TabItem.values
                .map((tabItem) => BottomNavigationBarItem(
                      icon: tabItem.getTabItemIcon(context),
                      activeIcon: tabItem.getTabItemSelectedIcon(context),
                      label: tabItem.getTabItemLabel(context),
                    ),)
                .toList(),
            activeColor: Theme.of(context).colorScheme.primary,
          ),
        );
}

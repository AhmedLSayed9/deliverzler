import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_nav_bar.dart';
import 'package:deliverzler/features/home_base/presentation/utils/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';

class BottomNavBarComponent extends PlatformNavBar {
  BottomNavBarComponent(
    BuildContext context, {
    Key? key,
    required TabItem currentTab,
    required ValueChanged<TabItem> onSelectTab,
  }) : super(
          key: key,
          currentIndex: currentTab.index,
          onTap: (index) {
            onSelectTab(TabItem.values[index]);
          },
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor ??
                  Theme.of(context).bottomAppBarColor,
          height: Sizes.bottomNavBarHeight(context),
          materialData: MaterialBottomNavBarData(
            destinations: TabItem.values
                .map((tabItem) => Theme(
                      data: Theme.of(context).copyWith(
                        navigationBarTheme: NavigationBarThemeData(
                          labelTextStyle:
                              MaterialStateProperty.resolveWith((states) {
                            return TextStyle(
                              color: customColors(context).font32Color,
                              fontSize: Sizes.font12(context),
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
                    ))
                .toList(),
            elevation: 2,
          ),
          cupertinoData: CupertinoTabBarData(
            items: TabItem.values
                .map((tabItem) => BottomNavigationBarItem(
                      icon: tabItem.getTabItemIcon(context),
                      activeIcon: tabItem.getTabItemSelectedIcon(context),
                      label: tabItem.getTabItemLabel(context),
                    ))
                .toList(),
            activeColor: Theme.of(context).colorScheme.primary,
          ),
        );
}

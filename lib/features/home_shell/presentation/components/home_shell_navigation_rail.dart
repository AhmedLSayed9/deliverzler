import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

import '../../../../core/presentation/widgets/custom_text.dart';
import '../utils/tab_item.dart';

class HomeShellNavigationRail extends StatelessWidget {
  const HomeShellNavigationRail({
    required this.currentTab,
    required this.onSelectTab,
    this.extended = false,
    super.key,
  });

  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectTab;
  final bool extended;

  @override
  Widget build(BuildContext context) {
    return AdaptiveScaffold.standardNavigationRail(
      padding: EdgeInsets.only(
        right: Theme.of(context).navigationRailTheme.elevation!,
      ),
      selectedIndex: currentTab.index,
      onDestinationSelected: (index) {
        onSelectTab(TabItem.values[index]);
      },
      extended: extended,
      destinations: TabItem.values
          .map(
            (tabItem) => NavigationRailDestination(
              icon: tabItem.getTabItemIcon(context),
              selectedIcon: tabItem.getTabItemSelectedIcon(context),
              label: CustomText.f12(
                context,
                tabItem.getTabItemLabel(context),
                color: currentTab.index == tabItem.index
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
            ),
          )
          .toList(),
    );
  }
}

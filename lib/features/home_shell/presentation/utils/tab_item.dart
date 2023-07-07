import 'package:flutter/material.dart';

import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/widgets/platform_widgets/platform_icons.dart';

enum TabItem {
  home,
  profile,
  settings;
}

extension TabItemExtension on TabItem {
  Widget getTabItemIcon(BuildContext context) {
    switch (this) {
      case TabItem.home:
        return _getTabIcon(context, PlatformIcons.home);
      case TabItem.profile:
        return _getTabIcon(context, PlatformIcons.accountCircleSolid);
      case TabItem.settings:
        return _getTabIcon(context, PlatformIcons.settingsSolid);
    }
  }

  Widget getTabItemSelectedIcon(BuildContext context) {
    switch (this) {
      case TabItem.home:
        return _getTabIcon(context, PlatformIcons.home, isSelected: true);
      case TabItem.profile:
        return _getTabIcon(context, PlatformIcons.accountCircleSolid, isSelected: true);
      case TabItem.settings:
        return _getTabIcon(context, PlatformIcons.settingsSolid, isSelected: true);
    }
  }

  Widget _getTabIcon(
    BuildContext context,
    IconData? icon, {
    bool isSelected = false,
  }) {
    return Icon(
      icon,
      size: Sizes.bottomNavBarIconR22,
      color: isSelected ? Theme.of(context).colorScheme.primary : null,
    );
  }

  String getTabItemLabel(BuildContext context) {
    switch (this) {
      case TabItem.home:
        return tr(context).home;
      case TabItem.profile:
        return tr(context).myProfile;
      case TabItem.settings:
        return tr(context).settings;
    }
  }
}

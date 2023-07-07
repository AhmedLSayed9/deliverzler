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
    return switch (this) {
      TabItem.home => _getTabIcon(context, PlatformIcons.home),
      TabItem.profile => _getTabIcon(context, PlatformIcons.accountCircleSolid),
      TabItem.settings => _getTabIcon(context, PlatformIcons.settingsSolid),
    };
  }

  Widget getTabItemSelectedIcon(BuildContext context) {
    return switch (this) {
      TabItem.home => _getTabIcon(context, PlatformIcons.home, isSelected: true),
      TabItem.profile => _getTabIcon(context, PlatformIcons.accountCircleSolid, isSelected: true),
      TabItem.settings => _getTabIcon(context, PlatformIcons.settingsSolid, isSelected: true),
    };
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
    return switch (this) {
      TabItem.home => tr(context).home,
      TabItem.profile => tr(context).myProfile,
      TabItem.settings => tr(context).settings,
    };
  }
}

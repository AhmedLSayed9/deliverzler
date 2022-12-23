import 'package:flutter/material.dart';

import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/widgets/platform_widgets/platform_icons.dart';

enum TabItem {
  profile,
  home,
  settings;
}

extension TabItemExtension on TabItem {
  Widget getTabItemIcon(BuildContext context) {
    switch (this) {
      case TabItem.profile:
        return Icon(
          PlatformIcons.accountCircleSolid,
          size: Sizes.bottomNavBarIconR22,
        );
      case TabItem.home:
        return Icon(
          PlatformIcons.home,
          size: Sizes.bottomNavBarIconR22,
        );
      case TabItem.settings:
        return Icon(
          PlatformIcons.settingsSolid,
          size: Sizes.bottomNavBarIconR22,
        );
    }
  }

  Widget getTabItemSelectedIcon(BuildContext context) {
    switch (this) {
      case TabItem.profile:
        return Icon(
          PlatformIcons.accountCircleSolid,
          size: Sizes.bottomNavBarIconR22,
          color: Theme.of(context).colorScheme.primary,
        );
      case TabItem.home:
        return Icon(
          PlatformIcons.home,
          size: Sizes.bottomNavBarIconR22,
          color: Theme.of(context).colorScheme.primary,
        );
      case TabItem.settings:
        return Icon(
          PlatformIcons.settingsSolid,
          size: Sizes.bottomNavBarIconR22,
          color: Theme.of(context).colorScheme.primary,
        );
    }
  }

  String getTabItemLabel(BuildContext context) {
    switch (this) {
      case TabItem.profile:
        return tr(context).myProfile;
      case TabItem.home:
        return tr(context).home;
      case TabItem.settings:
        return tr(context).settings;
    }
  }
}

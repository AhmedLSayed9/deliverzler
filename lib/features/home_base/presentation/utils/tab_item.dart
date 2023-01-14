import 'package:deliverzler/core/presentation/routing/app_router.dart';
import 'package:deliverzler/core/presentation/routing/route_paths.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_icons.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/material.dart';

enum TabItem {
  profile(
    initialRoute: RoutePaths.profile,
    onGenerateRoute: AppRouter.generateProfileNestedRoute,
  ),
  home(
    initialRoute: RoutePaths.home,
    onGenerateRoute: AppRouter.generateHomeNestedRoute,
    noAppBarRoutes: IListConst([RoutePaths.map]),
  ),
  settings(
    initialRoute: RoutePaths.settings,
    onGenerateRoute: AppRouter.generateSettingsNestedRoute,
  );

  const TabItem({
    required this.initialRoute,
    required this.onGenerateRoute,
    this.noAppBarRoutes = const IListConst([]),
  });

  final String initialRoute;
  final RouteFactory onGenerateRoute;
  final IList<String> noAppBarRoutes;
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

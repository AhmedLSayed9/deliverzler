import 'package:deliverzler/core/routing/app_router.dart';
import 'package:deliverzler/core/routing/route_paths.dart';
import 'package:deliverzler/modules/home/screens/nested_navigator_screen.dart';
import 'package:flutter/material.dart';

abstract class HomeNavScreensUtils {
  static final homeNavScreensKeys = [
    GlobalKey<NavigatorState>(debugLabel: 'page1'),
    GlobalKey<NavigatorState>(debugLabel: 'page2'),
    GlobalKey<NavigatorState>(debugLabel: 'page3'),
  ];

  static const homeNavScreens = [
    //Nested Navigator for persistent bottom navigation bar
    NestedNavigatorScreen(
      index: 0,
      screenPath: RoutePaths.profile,
      onGenerateRoute: AppRouter.generateProfileNestedRoute,
    ),
    NestedNavigatorScreen(
      index: 1,
      screenPath: RoutePaths.home,
      onGenerateRoute: AppRouter.generateHomeNestedRoute,
    ),
    NestedNavigatorScreen(
      index: 2,
      screenPath: RoutePaths.settings,
      onGenerateRoute: AppRouter.generateSettingsNestedRoute,
    ),
  ];
}

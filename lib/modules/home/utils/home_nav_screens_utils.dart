import 'package:deliverzler/core/routing/app_router.dart';
import 'package:deliverzler/core/routing/navigator_route_observer.dart';
import 'package:deliverzler/core/routing/route_paths.dart';
import 'package:deliverzler/modules/home/screens/nested_navigator_screen.dart';
import 'package:deliverzler/modules/home/viewmodels/home_state_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class HomeNavScreensUtils {
  static final homeNavScreensKeys = [
    GlobalKey<NavigatorState>(debugLabel: 'page1'),
    GlobalKey<NavigatorState>(debugLabel: 'page2'),
    GlobalKey<NavigatorState>(debugLabel: 'page3'),
  ];

  static homeNavScreens(WidgetRef ref) => [
        //Nested Navigator for persistent bottom navigation bar
        NestedNavigatorScreen(
          navigatorKey: homeNavScreensKeys[0],
          screenPath: RoutePaths.profile,
          onGenerateRoute: AppRouter.generateProfileNestedRoute,
          routeObserver: _homeNavScreensRouteObserver(0, ref),
        ),
        NestedNavigatorScreen(
          navigatorKey: homeNavScreensKeys[1],
          screenPath: RoutePaths.homeMain,
          onGenerateRoute: AppRouter.generateHomeMainNestedRoute,
          routeObserver: _homeNavScreensRouteObserver(1, ref),
        ),
        NestedNavigatorScreen(
          navigatorKey: homeNavScreensKeys[2],
          screenPath: RoutePaths.settings,
          onGenerateRoute: AppRouter.generateSettingsNestedRoute,
          routeObserver: _homeNavScreensRouteObserver(2, ref),
        ),
      ];

  static _homeNavScreensRouteObserver(int index, WidgetRef ref) =>
      NavigatorRouteObserver(
        onPush: (Route? route, Route? previousRoute) {
          final _navNotifier = ref.read(homeNavRoutesProviders[index].notifier);
          _navNotifier.state = route!.settings.name!;
        },
        onReplace: (Route? route, Route? previousRoute) {
          final _navNotifier = ref.read(homeNavRoutesProviders[index].notifier);
          _navNotifier.state = route!.settings.name!;
        },
        onPop: (Route? route, Route? previousRoute) {
          final _navNotifier = ref.read(homeNavRoutesProviders[index].notifier);
          _navNotifier.state = previousRoute!.settings.name!;
        },
      );
}

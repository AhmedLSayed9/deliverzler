import 'package:deliverzler/core/routing/navigator_route_observer.dart';
import 'package:deliverzler/core/routing/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeBaseNavProviders {
  static final currentIndex = StateProvider.autoDispose<int>((ref) => 1);

  static final routes = [
    StateProvider.autoDispose<String>((ref) => RoutePaths.profile),
    StateProvider.autoDispose<String>((ref) => RoutePaths.home),
    StateProvider.autoDispose<String>((ref) => RoutePaths.settings),
  ];

  static final routeObservers = [
    Provider.autoDispose<NavigatorRouteObserver>(
      (ref) => NavigatorRouteObserver(
        routesStackCallBack: (List<Route> _routes) {
          ref.watch(routes[0].notifier).state = _routes.last.settings.name!;
        },
      ),
    ),
    Provider.autoDispose<NavigatorRouteObserver>(
      (ref) => NavigatorRouteObserver(
        routesStackCallBack: (List<Route> _routes) {
          ref.watch(routes[1].notifier).state = _routes.last.settings.name!;
        },
      ),
    ),
    Provider.autoDispose<NavigatorRouteObserver>(
      (ref) => NavigatorRouteObserver(
        routesStackCallBack: (List<Route> _routes) {
          ref.watch(routes[2].notifier).state = _routes.last.settings.name!;
        },
      ),
    ),
  ];
}

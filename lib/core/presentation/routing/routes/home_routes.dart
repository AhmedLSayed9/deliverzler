part of '../app_router.dart';

class HomeRoute extends GoRouteData {
  const HomeRoute();

  static const routes = [
    TypedGoRoute<HomeRoute>(
      path: '/home',
      routes: [
        TypedGoRoute<MapRoute>(path: 'map'),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

class MapRoute extends GoRouteData {
  const MapRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage(key: state.pageKey, child: const MapScreen());
}

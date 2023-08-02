part of '../app_router.dart';

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SplashScreen();
}

@TypedGoRoute<NoInternetRoute>(path: '/no_internet')
class NoInternetRoute extends GoRouteData {
  const NoInternetRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const NoInternetScreen();
}

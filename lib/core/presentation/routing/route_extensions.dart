part of 'app_router.dart';

extension GoRouterStateX on GoRouterState {
  // TODO(AHMED): Use routeLocation when https://github.com/flutter/flutter/issues/125752 is fixed?
  String get routeLocation => uri.toString();

  List<RouteAuthority> get routeAuthority {
    const defaultAuthority = [RouteAuthority.user, RouteAuthority.admin];

    final publicRoutes = [const SplashRoute().location, const NoInternetRoute().location];
    if (publicRoutes.any(routeLocation.startsWith)) {
      return RouteAuthority.values;
    }

    if (routeLocation.startsWith(const SignInRoute().location)) {
      return const [RouteAuthority.unauthenticated];
    }

    final homeRoutes = [
      const HomeRoute().location,
      const ProfileRoute().location,
      const SettingsRoute().location,
    ];
    if (homeRoutes.any(routeLocation.startsWith)) {
      return defaultAuthority;
    }

    throw UnimplementedError('Route $uri has not set routeAuthority.');
  }
}

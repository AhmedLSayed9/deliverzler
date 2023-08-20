part of 'app_router.dart';

enum RouteAuthority {
  unauthenticated,
  guest,
  user,
  admin;

  // This is helpful when handling different authentication roles (guest, user, admin, etc..).
  static RouteAuthority fromAuthState(Option<User> authState) {
    if (authState.isSome()) {
      return RouteAuthority.user;
    }
    return RouteAuthority.unauthenticated;
  }
}

extension GoRouterStateX on GoRouterState {
  List<RouteAuthority> get routeAuthority {
    const defaultAuthority = [RouteAuthority.user, RouteAuthority.admin];

    final publicRoutes = [const SplashRoute().location, const NoInternetRoute().location];
    if (publicRoutes.any(matchedLocation.startsWith)) {
      return RouteAuthority.values;
    }

    if (matchedLocation.startsWith(const SignInRoute().location)) {
      return const [RouteAuthority.unauthenticated];
    }

    final homeRoutes = [
      const HomeRoute().location,
      const ProfileRoute().location,
      const SettingsRoute().location,
    ];
    if (homeRoutes.any(matchedLocation.startsWith)) {
      return defaultAuthority;
    }

    throw UnimplementedError('Route $uri has not set routeAuthority.');
  }
}

// TODO(Ahmed): use MyGoRouteData instead of GoRouterStateX when $extra issues is fixed.
/* 
typedef MyGoRouteExtra = ({List<RouteAuthority> routeAuthority, Object? value});

abstract class MyGoRouteData extends GoRouteData {
  const MyGoRouteData({
    this.routeAuthority = const [RouteAuthority.user, RouteAuthority.admin],
    this.value,
  });

  final List<RouteAuthority> routeAuthority;

  final Object? value;

  MyGoRouteExtra get $extra => (routeAuthority: routeAuthority, value: value);
}
 */

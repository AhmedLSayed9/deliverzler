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

// TODO(Ahmed): use MyGoRouteData instead of GoRouterStateX.routeAuthority when $extra issues is fixed.
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

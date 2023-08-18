part of '../app_router.dart';

class ProfileRoute extends GoRouteData {
  const ProfileRoute();

  static const routes = [
    TypedGoRoute<ProfileRoute>(path: '/profile'),
  ];

  @override
  Widget build(BuildContext context, GoRouterState state) => const ProfileScreen();
}

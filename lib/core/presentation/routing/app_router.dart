import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../auth/domain/user.dart';
import '../../../auth/presentation/providers/auth_state_provider.dart';
import '../../../auth/presentation/screens/sign_in_screen/sign_in_screen.dart';
import '../../../features/home/presentation/screens/home_screen/home_screen.dart';
import '../../../features/home_shell/presentation/screens/home_shell_screen.dart';
import '../../../features/map/presentation/screens/map_screen/map_screen.dart';
import '../../../features/profile/presentation/screens/profile_screen/profile_screen.dart';
import '../../../features/settings/presentation/screens/language_screen/language_screen.dart';
import '../../../features/settings/presentation/screens/settings_screen/settings_screen.dart';
import '../screens/no_internet_screen/no_internet_screen.dart';
import '../screens/route_error_screen/route_error_screen.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../utils/event.dart';
import '../utils/fp_framework.dart';
import '../utils/riverpod_framework.dart';
import 'navigation_transitions.dart';

part 'app_router.g.dart';
part 'routes_authority.dart';

// This or other ShellRoutes keys can be used to display a child route on a different Navigator.
// i.e: use the rootNavigatorKey for a child route inside a ShellRoute
// which need to take the full screen and ignore that Shell.
// https://pub.dev/documentation/go_router/latest/go_router/ShellRoute-class.html
final _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final listenable = ValueNotifier<Event<Unit>>(Event.unique(unit));

  ref.listen(
    authStateProvider.select((user) => user.isSome()),
    (_, __) => listenable.value = Event.unique(unit),
  );

  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: const SplashRoute().location,
    routes: [
      // Temporary using generated routes separately to be able to use
      // StatefulShellRoute until it's supported by app_route_builder.
      // TODO(Ahmed): migrate StatefulShellRoute to code gen and use $appRoutes:
      // https://github.com/flutter/flutter/issues/127371
      $splashRoute,
      $noInternetRoute,
      $signInRoute,
      // Like ShellRoute but can maintain the state of the Navigators for each branch.
      StatefulShellRoute.indexedStack(
        pageBuilder: (_, state, navigationShell) {
          return FadeTransitionPage(
            state.pageKey,
            // Return the widget that implements the custom shell.
            // The StatefulNavigationShell is passed to be able access the state
            // of the shell and to navigate to other branches in a stateful way.
            HomeShellScreen(
              navigationShell: navigationShell,
              // This key fixes ShellRoute bug with CupertinoTabScaffold:
              // https://github.com/flutter/flutter/issues/113757
              key: GlobalKey(debugLabel: 'HomeShellScreen'),
            ),
          );
        },
        // Each separate stateful navigation tree (a Navigator) is represented by
        // a StatefulShellBranch, which defines the routes that will be placed on that
        // Navigator. StatefulShellBranch also makes it possible to configure things like:
        // - an (optional) Navigator key. It isn't necessary to provide a navigatorKey
        //   if it isn't needed elsewhere. If not provided, a default key will be used.
        // - a default location (i.e. the location the branch will be navigated
        //   to when loading it for the first time) etc.
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            routes: [$profileRoute],
          ),
          StatefulShellBranch(
            routes: [$homeRoute],
          ),
          StatefulShellBranch(
            routes: [$settingsRoute],
          ),
        ],
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      final authState = ref.read(authStateProvider);
      final routeAuthority = state.routeAuthority;
      final isLegitRoute = <RouteAuthority>[
        RouteAuthority.fromAuthState(authState),
        RouteAuthority.public
      ].any(routeAuthority.contains);

      if (!isLegitRoute) {
        switch (authState) {
          // If the user is authenticated but still on the login page or similar, send to home.
          case Some():
            return const HomeRoute().location;
          case None():
            return const SignInRoute().location;
        }
      }

      // Return null (no redirecting) if the user is at or heading to a legit route.
      return null;
    },
    refreshListenable: listenable,
    errorBuilder: (_, state) => RouteErrorScreen(state.error),
  );
  ref.onDispose(router.dispose);
  return router;
}

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

@TypedGoRoute<SignInRoute>(path: '/login')
class SignInRoute extends GoRouteData {
  const SignInRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      FadeTransitionPage(state.pageKey, const SignInScreen());
}

@TypedGoRoute<HomeRoute>(
  path: '/home',
  routes: [
    TypedGoRoute<MapRoute>(path: 'map'),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

class MapRoute extends GoRouteData {
  const MapRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage(key: state.pageKey, child: const MapScreen());
}

@TypedGoRoute<ProfileRoute>(path: '/profile')
class ProfileRoute extends GoRouteData {
  const ProfileRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const ProfileScreen();
}

@TypedGoRoute<SettingsRoute>(
  path: '/settings',
  routes: [
    TypedGoRoute<LanguageRoute>(path: 'language'),
  ],
)
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const SettingsScreen();
}

class LanguageRoute extends GoRouteData {
  const LanguageRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LanguageScreen();
}

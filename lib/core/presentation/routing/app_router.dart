import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../auth/presentation/providers/auth_state_provider.dart';
import '../../../auth/presentation/screens/sign_in_screen/sign_in_screen.dart';
import '../../../features/home/presentation/screens/home_screen/home_screen.dart';
import '../../../features/home_shell/presentation/screens/home_shell_screen.dart';
import '../../../features/map/presentation/screens/map_screen/map_screen.dart';
import '../../../features/profile/presentation/screens/profile_screen/profile_screen.dart';
import '../../../features/settings/presentation/screens/language_screen/language_screen.dart';
import '../../../features/settings/presentation/screens/settings_screen/settings_screen.dart';
import '../screens/no_internet_screen/no_internet_screen.dart';
import '../screens/splash_screen/splash_screen.dart';
import '../utils/riverpod_framework.dart';
import 'app_router_refresh_listenable.dart';
import 'navigation_transitions.dart';

part 'app_router.g.dart';

// This or other ShellRoutes keys can be used to display a child route on a different Navigator.
// i.e: use the rootNavigatorKey for a child route inside a ShellRoute
// which need to take the full screen and ignore that Shell.
// https://pub.dev/documentation/go_router/latest/go_router/ShellRoute-class.html
final _rootNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
Raw<GoRouter> goRouter(GoRouterRef ref) {
  final router = GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: SplashRoute.path,
    routes: [
      // Temporary using generated routes separately to be able to use
      // StatefulShellRoute until it's supported by app_route_builder.
      // TODO: migrate StatefulShellRoute to code gen and use $appRoutes:
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
              key: GlobalKey(debugLabel: "HomeShellScreen"),
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
            routes: [
              $profileRoute,
            ],
          ),
          StatefulShellBranch(
            routes: [
              $homeRoute,
            ],
          ),
          StatefulShellBranch(
            routes: [
              $settingsRoute,
            ],
          ),
        ],
      ),
    ],
    redirect: (BuildContext context, GoRouterState state) {
      final bool isAuthenticated = ref.read(authStateProvider).isSome();
      const allowedRoutes = [
        SplashRoute.path,
        NoInternetRoute.path,
        SignInRoute.path,
      ];

      // If the user is authenticated but still on the login page, send to home.
      if (isAuthenticated && state.location.startsWith(SignInRoute.path)) {
        return const HomeRoute().location;
      }

      if (!isAuthenticated) {
        // Return null (no redirecting) if the route is allowed for
        // unAuthenticated users or else redirect to login page.
        if (allowedRoutes.any(state.location.startsWith)) return null;
        return const SignInRoute().location;
      }

      // Return null (no redirecting) if the user is authenticated.
      return null;
    },
    refreshListenable: ref.watch(appRouterRefreshListenableProvider.notifier),
  );
  ref.onDispose(router.dispose);
  return router;
}

@TypedGoRoute<SplashRoute>(path: SplashRoute.path)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  static const path = '/splash';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SplashScreen();
}

@TypedGoRoute<NoInternetRoute>(path: NoInternetRoute.path)
class NoInternetRoute extends GoRouteData {
  const NoInternetRoute();

  static const path = '/no_internet';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const NoInternetScreen();
}

@TypedGoRoute<SignInRoute>(path: SignInRoute.path)
class SignInRoute extends GoRouteData {
  const SignInRoute();

  static const path = '/login';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      FadeTransitionPage(state.pageKey, const SignInScreen());
}

@TypedGoRoute<HomeRoute>(
  path: HomeRoute.path,
  routes: [
    TypedGoRoute<MapRoute>(path: MapRoute.path),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  static const path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomeScreen();
}

class MapRoute extends GoRouteData {
  const MapRoute();

  static const path = 'map';

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) =>
      NoTransitionPage(key: state.pageKey, child: const MapScreen());
}

@TypedGoRoute<ProfileRoute>(path: ProfileRoute.path)
class ProfileRoute extends GoRouteData {
  const ProfileRoute();

  static const path = '/profile';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const ProfileScreen();
}

@TypedGoRoute<SettingsRoute>(
  path: SettingsRoute.path,
  routes: [
    TypedGoRoute<LanguageRoute>(path: LanguageRoute.path),
  ],
)
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  static const path = '/settings';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsScreen();
}

class LanguageRoute extends GoRouteData {
  const LanguageRoute();

  static const path = 'language';

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const LanguageScreen();
}

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
part 'routes/core_routes.dart';
part 'routes/auth_routes.dart';
part 'routes/home_shell_route.dart';
part 'routes/home_branch_routes.dart';
part 'routes/profile_branch_routes.dart';
part 'routes/settings_branch_routes.dart';

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
    debugLogDiagnostics: true,
    restorationScopeId: 'router',
    navigatorKey: _rootNavigatorKey,
    initialLocation: const SplashRoute().location,
    routes: $appRoutes,
    redirect: (BuildContext context, GoRouterState state) {
      final authState = ref.read(authStateProvider);
      final routeAuthority = state.routeAuthority;
      final isLegitRoute = routeAuthority.contains(RouteAuthority.fromAuthState(authState));

      if (!isLegitRoute) {
        return switch (authState) {
          // If the user is authenticated but still on the login page or similar, send to home.
          Some() => const HomeRoute().location,
          None() => const SignInRoute().location,
        };
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

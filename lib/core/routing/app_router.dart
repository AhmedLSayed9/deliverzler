import 'package:deliverzler/core/routing/navigation_transitions.dart';
import 'package:deliverzler/core/routing/route_paths.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/authentication/screens/login_screen.dart';
import 'package:deliverzler/core/screens/no_internet_connection_screen.dart';
import 'package:deliverzler/core/screens/splash_screen.dart';
import 'package:deliverzler/general/settings/screens/language_screen.dart';
import 'package:deliverzler/general/settings/screens/settings_screen.dart';
import 'package:deliverzler/modules/home/screens/orders_screen.dart';
import 'package:deliverzler/modules/map/screens/map_screen.dart';
import 'package:deliverzler/modules/profile/screens/profile_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //Core
      case RoutePaths.coreSplash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );

      case RoutePaths.coreNoInternet:
        final args = settings.arguments as Map?;
        return MaterialPageRoute(
          builder: (_) => NoInternetConnection(
            offAll: args?['offAll'],
          ),
          settings: settings,
        );

      //Auth
      case RoutePaths.authLogin:
        return NavigationFadeTransition(
          const LoginScreen(),
          settings: settings,
        );

      //Settings
      case RoutePaths.settings:
        return MaterialPageRoute(
          builder: (_) => const SettingsScreen(),
          settings: settings,
        );

      case RoutePaths.settingsLanguage:
        return MaterialPageRoute(
          builder: (_) => const LanguageScreen(),
          settings: settings,
        );

      //Home
      case RoutePaths.home:
        final args = settings.arguments as Map?;
        return NavigationFadeTransition(
          OrdersScreen(
            notificationOrderId: args?['orderId'],
          ),
          settings: settings,
        );

      //Profile
      case RoutePaths.profile:
        return MaterialPageRoute(
          builder: (_) => const ProfileScreen(),
          settings: settings,
        );

      //Map
      case RoutePaths.map:
        return MaterialPageRoute(
          builder: (_) => const MapScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
          settings: settings,
        );
    }
  }
}

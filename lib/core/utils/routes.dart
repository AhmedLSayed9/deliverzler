import 'package:flutter/material.dart';
import 'package:deliverzler/authentication/screens/login_screen.dart';
import 'package:deliverzler/core/screens/no_internet_connection_screen.dart';
import 'package:deliverzler/core/screens/splash_screen.dart';
import 'package:deliverzler/general/screens/language_screen.dart';
import 'package:deliverzler/general/screens/settings_screen.dart';
import 'package:deliverzler/modules/home/screens/orders_screen.dart';
import 'package:deliverzler/modules/map/screens/map_screen.dart';
import 'package:deliverzler/modules/profile/screens/profile_screen.dart';

class RoutePaths {
  static const coreSplash = '/';
  static const coreNoInternet = '/no_internet';
  static const authLogin = '/auth/login';
  static const home = '/home';
  static const profile = '/profile';
  static const settings = '/settings';
  static const settingsLanguage = '/settings/language';
  static const map = '/map';
}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      //Core
      case RoutePaths.coreSplash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case RoutePaths.coreNoInternet:
        final args = settings.arguments as Map?;
        return MaterialPageRoute(
          builder: (_) => NoInternetConnection(
            fromSplash: args != null ? args['fromSplash'] : false,
          ),
        );

      //Auth
      case RoutePaths.authLogin:
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => const LoginScreen(),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
          transitionDuration: const Duration(seconds: 1),
        );

      //Settings
      case RoutePaths.settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case RoutePaths.settingsLanguage:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());

      //Home
      case RoutePaths.home:
        final args = settings.arguments as Map?;
        return PageRouteBuilder(
          pageBuilder: (_, __, ___) => OrdersScreen(
            notificationOrderId: args != null ? args['orderId'] : null,
          ),
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
          transitionDuration: const Duration(seconds: 1),
        );

      //Profile
      case RoutePaths.profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());

      //Map
      case RoutePaths.map:
        return MaterialPageRoute(builder: (_) => const MapScreen());

      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}

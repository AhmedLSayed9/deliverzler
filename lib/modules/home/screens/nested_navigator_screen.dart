import 'package:flutter/material.dart';

class NestedNavigatorScreen extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String screenPath;
  final Route<dynamic>? Function(RouteSettings)? onGenerateRoute;
  final RouteObserver<PageRoute> routeObserver;

  const NestedNavigatorScreen({
    required this.navigatorKey,
    required this.screenPath,
    required this.onGenerateRoute,
    required this.routeObserver,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: screenPath,
      onGenerateRoute: onGenerateRoute,
      observers: [routeObserver],
    );
  }
}

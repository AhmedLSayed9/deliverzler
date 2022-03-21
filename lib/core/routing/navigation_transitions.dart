import 'package:flutter/material.dart';

class NavigationFadeTransition extends PageRouteBuilder {
  final Widget page;

  NavigationFadeTransition(
    this.page, {
    RouteSettings? settings,
    Duration? transitionDuration,
    Duration? reverseTransitionDuration,
  }) : super(
          settings: settings,
          pageBuilder: (_, __, ___) {
            return page;
          },
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
          transitionDuration:
              transitionDuration ?? const Duration(milliseconds: 400),
          reverseTransitionDuration:
              reverseTransitionDuration ?? const Duration(milliseconds: 300),
        );
}

class NavigationSlideFromSide extends PageRouteBuilder {
  final Widget page;

  NavigationSlideFromSide(this.page, {RouteSettings? settings})
      : super(
          settings: settings,
          pageBuilder: (_, __, ___) {
            return page;
          },
          transitionsBuilder: (_, a, __, c) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1.0, 0.0),
              end: const Offset(0.0, 0.0),
            ).animate(a),
            child: c,
          ),
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
        );
}

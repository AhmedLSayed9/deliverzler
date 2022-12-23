import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class FadeTransitionPage extends CustomTransitionPage {
  FadeTransitionPage(
    LocalKey pageKey,
    Widget child, {
    Duration transitionDuration = const Duration(milliseconds: 400),
  }) : super(
          key: pageKey,
          child: child,
          transitionsBuilder: (_, a, __, c) =>
              FadeTransition(opacity: a, child: c),
          transitionDuration: transitionDuration,
          reverseTransitionDuration: const Duration(milliseconds: 300),
        );
}

class SlideFromSideTransitionPage extends CustomTransitionPage {
  SlideFromSideTransitionPage(LocalKey pageKey, Widget child)
      : super(
          key: pageKey,
          child: child,
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

import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

class FadeTransitionPage<T> extends CustomTransitionPage<T> {
  FadeTransitionPage(
    LocalKey pageKey,
    Widget child, {
    super.transitionDuration = const Duration(milliseconds: 400),
  }) : super(
          key: pageKey,
          child: child,
          transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
          reverseTransitionDuration: const Duration(milliseconds: 300),
        );
}

class SlideFromSideTransitionPage<T> extends CustomTransitionPage<T> {
  SlideFromSideTransitionPage(LocalKey pageKey, Widget child)
      : super(
          key: pageKey,
          child: child,
          transitionsBuilder: (_, a, __, c) => SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(a),
            child: c,
          ),
          transitionDuration: const Duration(milliseconds: 300),
          reverseTransitionDuration: const Duration(milliseconds: 300),
        );
}

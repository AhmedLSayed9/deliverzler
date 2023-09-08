import 'package:flutter/material.dart';

import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import '../utils/riverpod_framework.dart';

FloatingSearchBarController useFloatingSearchBarController() {
  return use(const _FloatingSearchBarController());
}

class _FloatingSearchBarController extends Hook<FloatingSearchBarController> {
  const _FloatingSearchBarController();

  @override
  _FloatingSearchBarControllerState createState() => _FloatingSearchBarControllerState();
}

class _FloatingSearchBarControllerState
    extends HookState<FloatingSearchBarController, _FloatingSearchBarController> {
  final _controller = FloatingSearchBarController();

  @override
  FloatingSearchBarController build(BuildContext context) => _controller;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

import 'package:flutter/material.dart';

import 'package:flutter_fadein/flutter_fadein.dart';

import '../utils/riverpod_framework.dart';

FadeInController useFadeInController() {
  return use(const _FadeInController());
}

class _FadeInController extends Hook<FadeInController> {
  const _FadeInController();

  @override
  _TimeAliveState createState() => _TimeAliveState();
}

class _TimeAliveState extends HookState<FadeInController, _FadeInController> {
  final _fadeController = FadeInController();

  @override
  void initHook() {
    super.initHook();
    _fadeController.fadeIn();
  }

  @override
  FadeInController build(BuildContext context) => _fadeController;

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }
}

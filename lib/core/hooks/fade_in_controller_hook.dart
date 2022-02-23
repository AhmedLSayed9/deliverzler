import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

useFadeInController(BuildContext context) {
  return use(const _FadeInController());
}

class _FadeInController extends Hook<void> {
  const _FadeInController();

  @override
  _TimeAliveState createState() => _TimeAliveState();
}

class _TimeAliveState extends HookState<void, _FadeInController> {
  final _logoFadeController = FadeInController();

  @override
  void initHook() {
    super.initHook();
    _logoFadeController.fadeIn();
  }

  @override
  void build(BuildContext context) {}

  @override
  void dispose() {
    _logoFadeController.dispose();
    super.dispose();
  }
}

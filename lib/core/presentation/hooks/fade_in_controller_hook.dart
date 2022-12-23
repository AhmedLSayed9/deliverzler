import 'package:flutter/material.dart';
import 'package:flutter_fadein/flutter_fadein.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

useFadeInController() {
  return use(const _FadeInController());
}

class _FadeInController extends Hook<void> {
  const _FadeInController();

  @override
  _TimeAliveState createState() => _TimeAliveState();
}

class _TimeAliveState extends HookState<void, _FadeInController> {
  final _fadeController = FadeInController();

  @override
  void initHook() {
    super.initHook();
    _fadeController.fadeIn();
  }

  @override
  void build(BuildContext context) {}

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }
}

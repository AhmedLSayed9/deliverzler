import 'package:deliverzler/core/presentation/helpers/platform_helper.dart';
import 'package:flutter/material.dart';

class DisableGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class MainScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return PlatformHelper.isMaterialApp()
        ? const ClampingScrollPhysics()
        : const BouncingScrollPhysics();
  }
}

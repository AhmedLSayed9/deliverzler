import 'package:flutter/material.dart';

import '../helpers/platform_helper.dart';

class DisableGlowScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class MainScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return PlatformHelper.isMaterialApp()
        ? const ClampingScrollPhysics()
        : const BouncingScrollPhysics();
  }
}

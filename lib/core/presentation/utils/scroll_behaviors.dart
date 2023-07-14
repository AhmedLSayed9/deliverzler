import 'package:flutter/material.dart';

class MainScrollBehavior extends ScrollBehavior {
  // This removes the glow effect.
  // TODO(Ahmed): remove this when migrating to Material3 and the new StretchOverscrollIndicator:
  // https://github.com/flutter/flutter/issues/82906
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }

  /*
  // You can override the default ScrollPhysics for some platforms if needed.
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return PlatformHelper.isMaterialApp()
        ? const ClampingScrollPhysics()
        : super.getScrollPhysics(context);
  }
  */
}

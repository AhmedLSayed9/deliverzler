import 'package:flutter/material.dart';

import '../../helpers/platform_helper.dart';

// TODO(AHMED): Migrate to BreakPoint from flutter_adaptive_scaffold??
// Abiding to Material 3 Design guidelines:
// https://m3.material.io/foundations/adaptive-design/large-screens/overview
enum WindowSizeClass {
  compact(0),
  medium(600),
  expanded(840);

  const WindowSizeClass(this.breakpoint);

  final double breakpoint;

  static WindowSizeClass determineWindowClass(Size size) {
    // Use width rather than shortestSide when on Web/Desktop.
    // Because when window's height is adjusted but the width is still wide,
    // it should still be considered expanded instead of medium/compact.
    final deviceWidth = PlatformHelper.isDesktopDeviceOrWeb ? size.width : size.shortestSide;

    if (deviceWidth >= WindowSizeClass.expanded.breakpoint) {
      return WindowSizeClass.expanded;
    }
    if (deviceWidth >= WindowSizeClass.medium.breakpoint) {
      return WindowSizeClass.medium;
    }
    return WindowSizeClass.compact;
  }
}

class WindowClassLayout extends StatelessWidget {
  const WindowClassLayout({
    required this.compact,
    super.key,
    this.medium,
    this.expanded,
  });

  final WidgetBuilder compact;
  final WidgetBuilder? medium;
  final WidgetBuilder? expanded;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);
        final windowClass = WindowSizeClass.determineWindowClass(size);

        if (windowClass == WindowSizeClass.expanded) {
          if (expanded != null) return expanded!(context);
          //If no expanded layout, return medium layout instead (if supplied).
          if (medium != null) return medium!(context);
        }

        if (windowClass == WindowSizeClass.medium) {
          if (medium != null) return medium!(context);
        }

        //Return the default compact if none of the layouts above are supplied.
        return compact(context);
      },
    );
  }
}

class OrientationLayout extends StatelessWidget {
  const OrientationLayout({
    required this.portrait,
    super.key,
    this.landscape,
  });

  final WidgetBuilder portrait;
  final WidgetBuilder? landscape;

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        if (orientation == Orientation.landscape && landscape != null) {
          return landscape!(context);
        }

        return portrait(context);
      },
    );
  }
}

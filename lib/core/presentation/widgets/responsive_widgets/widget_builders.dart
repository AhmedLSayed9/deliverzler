import 'package:flutter/material.dart';

import '../../utils/window_size_class.dart';

class WindowClassLayout extends StatelessWidget {
  const WindowClassLayout({
    super.key,
    required this.compact,
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
        final windowClass = getWindowClass(size);

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
    super.key,
    required this.portrait,
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

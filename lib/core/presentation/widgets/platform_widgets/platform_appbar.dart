import 'package:flutter/cupertino.dart';

import '../../styles/sizes.dart';

class PreferredAppBarSize extends Size {
  PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(toolbarHeight + bottomHeight);

  final double toolbarHeight;
  final double bottomHeight;
}

class PlatformAppBar extends StatelessWidget
    implements PreferredSizeWidget, ObstructingPreferredSizeWidget {
  PlatformAppBar({
    required this.appbar,
    this.toolbarHeight = Sizes.appBarHeight56,
    this.bottom,
    this.backgroundColor,
    super.key,
  }) : preferredSize = PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height ?? 0.0);

  final Widget appbar;

  // ToolbarHeight for Android/iOS and BackgroundColor for iOS must be pre-initialized, and we are
  // implementing PreferredSizeWidget, ObstructingPreferredSizeWidget to be able to only rebuild the appbar.
  final double toolbarHeight;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return appbar;
  }

  @override
  final Size preferredSize;

  @override
  bool shouldFullyObstruct(BuildContext context) {
    final backgroundColor = CupertinoDynamicColor.maybeResolve(this.backgroundColor, context) ??
        CupertinoTheme.of(context).barBackgroundColor;
    return backgroundColor.alpha == 0xFF;
  }
}

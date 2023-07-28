import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A widget that occupies the space of the status bar and customizes its appearance
/// without providing an actual app bar.
class StatusBarSpacer extends StatelessWidget
    implements PreferredSizeWidget, ObstructingPreferredSizeWidget {
  /// Creates a StatusBarSpacer.
  /// It's a widget that occupies the space of the status bar and customizes its appearance
  /// without providing an actual app bar.
  const StatusBarSpacer({
    this.statusBarColor,
    this.systemOverlayStyle,
    this.elevation,
    super.key,
  });

  final Color? statusBarColor;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: statusBarColor,
      systemOverlayStyle: systemOverlayStyle ??
          Theme.of(context)
              .appBarTheme
              .systemOverlayStyle
              ?.copyWith(statusBarColor: statusBarColor),
      elevation: elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);

  @override
  bool shouldFullyObstruct(BuildContext context) => true;
}

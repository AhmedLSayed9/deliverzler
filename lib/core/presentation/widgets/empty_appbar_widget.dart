import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

//This show StatusBar without an AppBar
class EmptyAppBar extends StatelessWidget
    implements PreferredSizeWidget, ObstructingPreferredSizeWidget {
  const EmptyAppBar({
    this.systemOverlayStyle,
    this.statusBarColor,
    this.elevation,
    Key? key,
  }) : super(key: key);

  final SystemUiOverlayStyle? systemOverlayStyle;
  final Color? statusBarColor;
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
      elevation: elevation ?? Theme.of(context).appBarTheme.elevation,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(0);

  @override
  bool shouldFullyObstruct(BuildContext context) {
    return true;
  }
}

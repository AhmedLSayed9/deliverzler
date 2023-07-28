import 'package:flutter/material.dart';

//This is necessary with nested navigation to prevent transparent background of nested screens when navigating
class NestedScreenScaffold extends StatelessWidget {
  const NestedScreenScaffold({
    required this.body,
    this.backgroundColor,
    super.key,
  });

  final Widget body;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: body,
    );
  }
}

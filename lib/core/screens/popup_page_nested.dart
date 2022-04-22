import 'package:flutter/material.dart';

class PopUpPageNested extends StatelessWidget {
  final Color? backgroundColor;
  final Widget body;

  const PopUpPageNested({
    Key? key,
    this.backgroundColor,
    this.body = const SizedBox(),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: body,
    );
  }
}

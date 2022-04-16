import 'package:deliverzler/core/widgets/platform_widgets/platform_base_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformCircularProgressIndicator extends PlatformBaseWidget<
    CupertinoActivityIndicator, CircularProgressIndicator> {
  final double? value;
  final Color? backgroundColor;
  final Color? color;
  final Animation<Color?>? valueColor;
  final double strokeWidth;
  final String? semanticsLabel;
  final String? semanticsValue;
  final bool animating;
  final double radius;

  const PlatformCircularProgressIndicator({
    Key? key,
    this.value,
    this.backgroundColor,
    this.color,
    this.valueColor,
    this.strokeWidth = 4.0,
    this.semanticsLabel,
    this.semanticsValue,
    this.animating = true,
    this.radius = 10.0,
  }) : super(key: key);

  @override
  CupertinoActivityIndicator createCupertinoWidget(BuildContext context) {
    return CupertinoActivityIndicator(
      key: key,
      color: color,
      animating: animating,
      radius: radius,
    );
  }

  @override
  CircularProgressIndicator createMaterialWidget(BuildContext context) {
    return CircularProgressIndicator(
      key: key,
      value: value,
      backgroundColor: backgroundColor,
      color: color,
      valueColor: valueColor,
      strokeWidth: strokeWidth,
      semanticsLabel: semanticsLabel,
      semanticsValue: semanticsValue,
    );
  }
}

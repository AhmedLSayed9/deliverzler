import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_base_widget.dart';

class PlatformCircularProgressIndicator extends PlatformBaseWidget<
    CircularProgressIndicator, CupertinoActivityIndicator> {
  const PlatformCircularProgressIndicator({
    super.key,
    this.widgetKey,
    this.color,
    this.materialData,
    this.cupertinoData,
  });

  final Key? widgetKey;
  final Color? color;
  final MaterialProgressIndicatorData? materialData;
  final CupertinoActivityIndicatorData? cupertinoData;

  @override
  CircularProgressIndicator createMaterialWidget(BuildContext context) {
    return CircularProgressIndicator(
      key: widgetKey,
      value: materialData?.value,
      backgroundColor: materialData?.backgroundColor,
      color: color,
      valueColor: materialData?.valueColor,
      strokeWidth: materialData?.strokeWidth ?? 4.0,
      semanticsLabel: materialData?.semanticsLabel,
      semanticsValue: materialData?.semanticsValue,
    );
  }

  @override
  CupertinoActivityIndicator createCupertinoWidget(BuildContext context) {
    return CupertinoActivityIndicator(
      key: widgetKey,
      color: color,
      animating: cupertinoData?.animating ?? true,
      radius: cupertinoData?.radius ?? 10.0,
    );
  }
}

class MaterialProgressIndicatorData {
  const MaterialProgressIndicatorData({
    this.value,
    this.backgroundColor,
    this.valueColor,
    this.strokeWidth,
    this.semanticsLabel,
    this.semanticsValue,
  });

  final double? value;
  final Color? backgroundColor;
  final Animation<Color?>? valueColor;
  final double? strokeWidth;
  final String? semanticsLabel;
  final String? semanticsValue;
}

class CupertinoActivityIndicatorData {
  const CupertinoActivityIndicatorData({
    this.animating,
    this.radius,
  });

  final bool? animating;
  final double? radius;
}

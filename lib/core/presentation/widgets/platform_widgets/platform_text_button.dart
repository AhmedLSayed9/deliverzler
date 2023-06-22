import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_base_widget.dart';

class PlatformTextButton
    extends PlatformBaseWidget<TextButton, CupertinoButton> {
  const PlatformTextButton({
    required this.child, required this.onPressed, super.key,
    this.widgetKey,
    this.materialData,
    this.cupertinoData,
  });

  final Key? widgetKey;
  final Widget child;
  final VoidCallback? onPressed;
  final MaterialTextButtonData? materialData;
  final CupertinoTextButtonData? cupertinoData;

  @override
  TextButton createMaterialWidget(BuildContext context) {
    return TextButton(
      key: widgetKey,
      onPressed: onPressed,
      onLongPress: materialData?.onLongPress,
      style: materialData?.style,
      child: child,
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context) {
    return CupertinoButton(
      key: widgetKey,
      onPressed: onPressed,
      color: cupertinoData?.color,
      padding: cupertinoData?.padding,
      borderRadius: cupertinoData?.borderRadius,
      minSize: cupertinoData?.minSize,
      child: child,
    );
  }
}

class MaterialTextButtonData {
  const MaterialTextButtonData({
    this.onLongPress,
    this.style,
  });

  final VoidCallback? onLongPress;
  final ButtonStyle? style;
}

class CupertinoTextButtonData {
  const CupertinoTextButtonData({
    this.color,
    this.padding,
    this.borderRadius,
    this.minSize,
  });

  final Color? color;
  final EdgeInsetsGeometry? padding;
  final BorderRadius? borderRadius;
  final double? minSize;
}

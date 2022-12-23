import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_base_widget.dart';

class PlatformIconButton
    extends PlatformBaseWidget<IconButton, CupertinoButton> {
  const PlatformIconButton({
    super.key,
    this.widgetKey,
    required this.icon,
    required this.onPressed,
    this.padding,
    this.materialData,
    this.cupertinoData,
  });

  final Key? widgetKey;
  final Widget icon;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final MaterialIconButtonData? materialData;
  final CupertinoButtonData? cupertinoData;

  @override
  IconButton createMaterialWidget(BuildContext context) {
    return IconButton(
      key: widgetKey,
      icon: icon,
      onPressed: onPressed,
      padding: padding ?? const EdgeInsets.all(8),
      constraints: materialData?.constraints,
      splashColor: materialData?.splashColor,
      highlightColor: materialData?.highlightColor,
    );
  }

  @override
  CupertinoButton createCupertinoWidget(BuildContext context) {
    return CupertinoButton(
      key: widgetKey,
      onPressed: onPressed,
      padding: padding,
      minSize: cupertinoData?.minSize,
      alignment: cupertinoData?.alignment ?? Alignment.center,
      child: icon,
    );
  }
}

class MaterialIconButtonData {
  const MaterialIconButtonData({
    this.constraints,
    this.splashColor,
    this.highlightColor,
  });

  final BoxConstraints? constraints;
  final Color? splashColor;
  final Color? highlightColor;
}

class CupertinoButtonData {
  const CupertinoButtonData({
    this.minSize,
    this.alignment,
  });

  final double? minSize;
  final AlignmentGeometry? alignment;
}

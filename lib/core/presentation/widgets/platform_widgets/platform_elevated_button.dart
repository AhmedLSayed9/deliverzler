import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_base_widget.dart';

class PlatformElevatedButton
    extends PlatformBaseWidget<ElevatedButton, CupertinoTheme> {
  const PlatformElevatedButton({
    super.key,
    this.widgetKey,
    required this.child,
    required this.onPressed,
    this.materialData,
    this.cupertinoData,
  });

  final Key? widgetKey;
  final Widget child;
  final VoidCallback? onPressed;
  final MaterialElevatedButtonData? materialData;
  final CupertinoElevatedButtonData? cupertinoData;

  @override
  ElevatedButton createMaterialWidget(BuildContext context) {
    return ElevatedButton(
      key: widgetKey,
      onPressed: onPressed,
      onLongPress: materialData?.onLongPress,
      style: materialData?.style,
      child: child,
    );
  }

  @override
  CupertinoTheme createCupertinoWidget(BuildContext context) {
    return CupertinoTheme(
      data: CupertinoTheme.of(context).copyWith(
        primaryColor: cupertinoData?.color,
      ),
      child: CupertinoButton.filled(
        key: widgetKey,
        onPressed: onPressed,
        padding: cupertinoData?.padding,
        borderRadius: cupertinoData?.borderRadius,
        minSize: cupertinoData?.minSize,
        child: child,
      ),
    );
  }
}

class MaterialElevatedButtonData {
  const MaterialElevatedButtonData({
    this.onLongPress,
    this.style,
  });

  final VoidCallback? onLongPress;
  final ButtonStyle? style;
}

class CupertinoElevatedButtonData {
  const CupertinoElevatedButtonData({
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

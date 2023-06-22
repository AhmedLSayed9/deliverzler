import 'package:flutter/material.dart';

import '../styles/sizes.dart';
import 'custom_text.dart';
import 'platform_widgets/platform_text_button.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.onPressed,
    this.minHeight = 0,
    this.minWidth = 0,
    this.child,
    this.text,
    this.shape,
    this.elevation,
    this.buttonColor,
    this.splashColor,
    this.shadowColor,
    this.padding,
    this.onLongPress,
    this.tapTargetSize,
    super.key,
  }) : assert(text != null || child != null, "Either text or child shouldn't be null");
  final double minHeight;
  final double minWidth;
  final Widget? child;
  final String? text;
  final VoidCallback? onPressed;
  final OutlinedBorder? shape;
  final double? elevation;
  final Color? buttonColor;
  final Color? splashColor;
  final Color? shadowColor;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onLongPress;
  final MaterialTapTargetSize? tapTargetSize;

  @override
  Widget build(BuildContext context) {
    return PlatformTextButton(
      onPressed: onPressed,
      materialData: MaterialTextButtonData(
        onLongPress: onLongPress,
        style: TextButton.styleFrom(
          padding: padding ??
              const EdgeInsets.symmetric(
                vertical: Sizes.paddingV4,
                horizontal: Sizes.paddingH8,
              ),
          shape: shape,
          elevation: elevation ?? 0,
          backgroundColor: buttonColor,
          foregroundColor: splashColor ?? Theme.of(context).colorScheme.primary,
          shadowColor: shadowColor,
          minimumSize: Size(minWidth, minHeight),
          tapTargetSize: tapTargetSize,
        ),
      ),
      cupertinoData: CupertinoTextButtonData(
        color: buttonColor,
        padding: padding ??
            const EdgeInsets.symmetric(
              vertical: Sizes.paddingV4,
              horizontal: Sizes.paddingH8,
            ),
        borderRadius: shape != null
            ? (shape! as RoundedRectangleBorder)
                .borderRadius
                .resolve(Directionality.maybeOf(context))
            : null,
        minSize: minHeight,
      ),
      child: child ??
          CustomText.f14(
            context,
            text!,
            color: Theme.of(context).colorScheme.primary,
            //alignment: Alignment.center,
          ),
    );
  }
}

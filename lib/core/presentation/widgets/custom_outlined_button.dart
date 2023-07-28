import 'package:flutter/material.dart';

import '../../core_features/theme/presentation/utils/colors/app_static_colors.dart';
import '../styles/sizes.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    required this.onPressed,
    required this.child,
    this.onLongPress,
    this.padding = const EdgeInsets.symmetric(
      vertical: Sizes.buttonPaddingV14,
      horizontal: Sizes.buttonPaddingH80,
    ),
    this.constraints,
    this.borderRadius,
    this.side,
    this.buttonColor,
    this.splashColor,
    this.shadowColor,
    this.enableGradient = false,
    this.gradient = AppStaticColors.primaryIngredientColor,
    this.elevation = 0,
    super.key,
  });

  final VoidCallback? onPressed;
  final VoidCallback? onLongPress;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final BoxConstraints? constraints;
  final BorderRadius? borderRadius;
  final BorderSide? side;
  final Color? buttonColor;
  final Color? splashColor;
  final Color? shadowColor;
  final bool enableGradient;
  final Gradient? gradient;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        shape: RoundedRectangleBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(Sizes.buttonR24),
        ),
        side: side,
        backgroundColor: enableGradient ? Colors.transparent : buttonColor,
        foregroundColor: splashColor,
        shadowColor: shadowColor,
        elevation: elevation,
      ),
      // Ink is a workaround for gradient until https://github.com/flutter/flutter/issues/89563 is solved.
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: borderRadius ?? BorderRadius.circular(Sizes.buttonR24),
          gradient: enableGradient ? gradient : null,
        ),
        child: Container(
          constraints: constraints,
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

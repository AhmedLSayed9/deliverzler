import 'package:flutter/material.dart';

import '../../core_features/theme/presentation/utils/colors/app_static_colors.dart';
import '../styles/styles.dart';

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

  BorderRadius get _borderRadius => borderRadius ?? BorderRadius.circular(Sizes.buttonR24);

  Color? get _buttonColor => enableGradient ? Colors.transparent : buttonColor;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      onLongPress: onLongPress,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size.zero,
        shape: RoundedRectangleBorder(borderRadius: _borderRadius),
        side: side,
        backgroundColor: _buttonColor,
        foregroundColor: splashColor,
        shadowColor: shadowColor,
        elevation: elevation,
      ),
      // Ink is a workaround for gradient until https://github.com/flutter/flutter/issues/89563 is solved.
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: _borderRadius,
          gradient: enableGradient ? gradient : null,
        ),
        child: Container(
          padding: padding,
          constraints: constraints,
          child: child,
        ),
      ),
    );
  }
}

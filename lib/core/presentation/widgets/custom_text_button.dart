import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../core_features/theme/presentation/utils/app_static_colors.dart';
import '../styles/styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.onPressed,
    required this.child,
    this.onLongPress,
    this.padding = const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 12,
    ),
    this.constraints,
    this.borderRadius,
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
  final Color? buttonColor;
  final Color? splashColor;
  final Color? shadowColor;
  final bool enableGradient;
  final Gradient? gradient;
  final double elevation;

  BorderRadius get _borderRadius => borderRadius ?? BorderRadius.circular(Sizes.buttonR4);

  Color? get _buttonColor => enableGradient ? Colors.transparent : buttonColor;

  @override
  Widget build(BuildContext context) {
    return PlatformTextButton(
      onPressed: onPressed,
      material: (context, __) {
        return MaterialTextButtonData(
          onLongPress: onLongPress,
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            shape: RoundedRectangleBorder(borderRadius: _borderRadius),
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
      },
      cupertino: (context, __) {
        return CupertinoTextButtonData(
          padding: EdgeInsets.zero,
          minSize: 0,
          color: _buttonColor,
          borderRadius: _borderRadius,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: _borderRadius,
              gradient: enableGradient ? gradient : null,
            ),
            padding: padding,
            constraints: constraints,
            child: child,
          ),
        );
      },
    );
  }
}

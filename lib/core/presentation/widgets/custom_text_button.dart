import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../styles/sizes.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.onPressed,
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      vertical: 10,
      horizontal: 12,
    ),
    this.borderRadius,
    this.buttonColor,
    this.splashColor,
    this.shadowColor,
    this.elevation = 0,
    super.key,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final BorderRadius? borderRadius;
  final Color? buttonColor;
  final Color? splashColor;
  final Color? shadowColor;
  final double elevation;

  static const double _defaultRadius = Sizes.buttonR4;

  @override
  Widget build(BuildContext context) {
    return PlatformTextButton(
      onPressed: onPressed,
      padding: padding,
      color: buttonColor,
      child: child,
      material: (context, __) {
        return MaterialTextButtonData(
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: padding,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(_defaultRadius),
            ),
            backgroundColor: buttonColor,
            foregroundColor: splashColor,
            shadowColor: shadowColor,
            elevation: elevation,
          ),
        );
      },
      cupertino: (context, __) {
        return CupertinoTextButtonData(
          minSize: 0,
          borderRadius: BorderRadius.circular(_defaultRadius),
        );
      },
    );
  }
}

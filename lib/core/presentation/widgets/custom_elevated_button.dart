import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../core_features/theme/presentation/utils/colors/app_static_colors.dart';
import '../styles/sizes.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    required this.onPressed,
    required this.child,
    this.padding = const EdgeInsets.symmetric(
      vertical: Sizes.buttonPaddingV14,
      horizontal: Sizes.buttonPaddingH80,
    ),
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
  final Widget child;
  final EdgeInsetsGeometry padding;
  final BorderRadius? borderRadius;
  final Color? buttonColor;
  final Color? splashColor;
  final Color? shadowColor;
  final bool enableGradient;
  final Gradient? gradient;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return PlatformElevatedButton(
      onPressed: onPressed,
      color: enableGradient ? Colors.transparent : buttonColor,
      material: (context, __) {
        return MaterialElevatedButtonData(
          // Ink is a workaround for gradient until https://github.com/flutter/flutter/issues/89563 is solved.
          child: Ink(
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(Sizes.buttonR24),
              gradient: enableGradient ? gradient : null,
            ),
            child: child,
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(Sizes.buttonR24),
            ),
            backgroundColor: enableGradient ? Colors.transparent : buttonColor,
            foregroundColor: splashColor,
            shadowColor: shadowColor,
            elevation: elevation,
          ),
        );
      },
      cupertino: (context, __) {
        return CupertinoElevatedButtonData(
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              borderRadius: borderRadius ?? BorderRadius.circular(Sizes.buttonR24),
              gradient: enableGradient ? gradient : null,
            ),
            child: child,
          ),
          padding: EdgeInsets.zero,
          minSize: 0,
          borderRadius: BorderRadius.circular(Sizes.buttonR24),
        );
      },
    );
  }
}

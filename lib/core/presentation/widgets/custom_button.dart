import 'package:flutter/material.dart';

import '../../core_features/theme/presentation/utils/colors/app_static_colors.dart';
import '../styles/font_styles.dart';
import '../styles/sizes.dart';
import 'custom_text.dart';
import 'platform_widgets/platform_elevated_button.dart';

//Composition works better than inheritance: https://groups.google.com/g/flutter-dev/c/muVUV4z71fs/m/DS0twymQCAAJ
class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? minHeight;
  final double? minWidth;
  final Widget? child;
  final String? text;
  final VoidCallback? onPressed;
  final OutlinedBorder? shape;
  final double? elevation;
  final Color? buttonColor;
  final Color? splashColor;
  final Color? shadowColor;
  final Gradient? gradientColor;
  final BorderRadiusGeometry? gradientBorderRadius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onLongPress;

  const CustomButton({
    this.height,
    this.width,
    this.minHeight,
    this.minWidth,
    this.child,
    this.text,
    required this.onPressed,
    this.shape,
    this.elevation,
    this.buttonColor,
    this.splashColor,
    this.shadowColor,
    this.gradientColor,
    this.gradientBorderRadius,
    this.padding,
    this.onLongPress,
    Key? key,
  })  : assert(text != null || child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformElevatedButton(
      onPressed: onPressed,
      materialData: MaterialElevatedButtonData(
        onLongPress: onLongPress,
        style: ElevatedButton.styleFrom(
          padding: padding ?? EdgeInsets.zero,
          shape: shape ??
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(Sizes.buttonR24),
              ),
          elevation: elevation ?? 0,
          backgroundColor: buttonColor,
          foregroundColor: splashColor,
          shadowColor: shadowColor,
          minimumSize: Size(
            minWidth ?? Sizes.buttonWidth60,
            minHeight ?? Sizes.buttonHeight40,
          ),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
      cupertinoData: CupertinoElevatedButtonData(
        color: buttonColor,
        padding: padding ?? EdgeInsets.zero,
        borderRadius: shape != null
            ? (shape as RoundedRectangleBorder)
                .borderRadius
                .resolve(Directionality.maybeOf(context))
            : BorderRadius.circular(Sizes.buttonR24),
        minSize: minHeight ?? Sizes.buttonHeight40,
      ),
      child: Container(
        alignment: Alignment.center,
        height: height ?? Sizes.buttonHeight48,
        width: width ?? Sizes.buttonWidth220,
        decoration: buttonColor == null
            ? BoxDecoration(
                borderRadius: gradientBorderRadius ??
                    BorderRadius.circular(Sizes.buttonR24),
                gradient:
                    gradientColor ?? AppStaticColors.primaryIngredientColor,
              )
            : null,
        child: child ??
            CustomText.f16(
              context,
              text!,
              color: buttonColor == null ? const Color(0xffffffff) : null,
              weight: FontStyles.fontWeightSemiBold,
            ),
      ),
    );
  }
}

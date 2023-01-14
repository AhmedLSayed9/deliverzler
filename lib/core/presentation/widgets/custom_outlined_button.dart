import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';

class CustomOutlinedButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? minHeight;
  final Widget? child;
  final String? text;
  final VoidCallback? onPressed;
  final OutlinedBorder? shape;
  final BorderSide? side;
  final double? elevation;
  final Color? buttonColor;
  final Color? splashColor;
  final Color? shadowColor;
  final Gradient? gradientColor;
  final BorderRadiusGeometry? gradientBorderRadius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onLongPress;

  const CustomOutlinedButton({
    this.height,
    this.width,
    this.minHeight,
    this.child,
    this.text,
    required this.onPressed,
    this.shape,
    this.side,
    this.elevation,
    this.buttonColor,
    this.splashColor,
    this.shadowColor,
    this.gradientColor,
    this.gradientBorderRadius,
    this.padding,
    this.onLongPress,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        shape: shape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(Sizes.buttonR24),
            ),
        side: side,
        elevation: elevation ?? 0,
        backgroundColor: buttonColor,
        foregroundColor: splashColor,
        shadowColor: shadowColor,
        padding: padding ??
            EdgeInsets.zero, //Not necessary if you added height and width.
      ),
      onPressed: onPressed,
      onLongPress: onLongPress,
      child: Container(
        alignment: Alignment.center,
        height: height ?? Sizes.buttonHeight48,
        width: width ?? Sizes.buttonWidth280,
        constraints: BoxConstraints(
          minHeight: minHeight ?? Sizes.buttonHeight40,
        ),
        decoration: buttonColor == null
            ? BoxDecoration(
                borderRadius: gradientBorderRadius ??
                    BorderRadius.circular(Sizes.buttonR24),
                gradient:
                    gradientColor ?? AppStaticColors.primaryIngredientColor,
              )
            : null,
        child: child ??
            CustomText.f18(
              context,
              text!,
              color: buttonColor == null ? const Color(0xffffffff) : null,
              weight: FontStyles.fontWeightSemiBold,
              //alignment: Alignment.center,
            ),
      ),
    );
  }
}

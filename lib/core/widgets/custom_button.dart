import 'package:flutter/material.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

//Composition works better than inheritance: https://groups.google.com/g/flutter-dev/c/muVUV4z71fs/m/DS0twymQCAAJ
class CustomButton extends StatelessWidget {
  final double? height;
  final double? width;
  final double? minHeight;
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
      child: Container(
        height: height ?? Sizes.roundedButtonDefaultHeight(context),
        width: width ?? Sizes.roundedButtonDefaultWidth(context),
        constraints: BoxConstraints(
          minHeight: minHeight ?? Sizes.roundedButtonMinHeight(context),
        ),
        decoration: buttonColor == null
            ? BoxDecoration(
                borderRadius: gradientBorderRadius ??
                    BorderRadius.circular(
                        Sizes.roundedButtonDefaultRadius(context)),
                gradient: gradientColor ?? AppColors.primaryIngredientColor,
              )
            : null,
        child: child ??
            CustomText.h4(
              context,
              text!,
              color: buttonColor == null ? const Color(0xffffffff) : null,
              weight: FontStyles.fontWeightMedium,
              alignment: Alignment.center,
            ),
      ),
      onPressed: onPressed,
      color: buttonColor,
      //Not necessary if you added height and width.
      material: (_, __) {
        return MaterialElevatedButtonData(
          style: ElevatedButton.styleFrom(
            padding: padding ?? EdgeInsets.zero,
            shape: shape ??
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    Sizes.roundedButtonDefaultRadius(context),
                  ),
                ),
            primary: buttonColor,
            elevation: elevation ?? 0,
            onPrimary: splashColor,
            shadowColor: shadowColor,
          ),
          onLongPress: onLongPress,
        );
      },
      cupertino: (_, __) {
        return CupertinoElevatedButtonData(
          padding: padding ?? EdgeInsets.zero,
          borderRadius: shape != null
              ? (shape as RoundedRectangleBorder)
                  .borderRadius
                  .resolve(Directionality.maybeOf(context))
              : BorderRadius.circular(
                  Sizes.roundedButtonDefaultRadius(context),
                ),
        );
      },
    );
  }
}

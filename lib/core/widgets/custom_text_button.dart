import 'package:flutter/material.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class CustomTextButton extends StatelessWidget {
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

  const CustomTextButton({
    this.minHeight = 0,
    this.minWidth = 0,
    this.child,
    this.text,
    required this.onPressed,
    this.shape,
    this.elevation,
    this.buttonColor,
    this.splashColor,
    this.shadowColor,
    this.padding,
    this.onLongPress,
    this.tapTargetSize,
    Key? key,
  })  : assert(text != null || child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformTextButton(
      child: child ??
          CustomText.h5(
            context,
            text!,
            color: AppColors.lightThemePrimary,
            alignment: Alignment.center,
          ),
      onPressed: onPressed,
      color: buttonColor,
      //Not necessary if you added height and width.
      material: (_, __) {
        return MaterialTextButtonData(
          style: TextButton.styleFrom(
            shape: shape,
            elevation: elevation ?? 0,
            backgroundColor: buttonColor,
            primary: splashColor ?? AppColors.lightThemePrimary,
            shadowColor: shadowColor,
            padding: padding ??
                EdgeInsets.symmetric(
                  vertical: Sizes.vPaddingTiny(context),
                  horizontal: Sizes.hPaddingSmallest(context),
                ),
            minimumSize: Size(minWidth, minHeight),
            tapTargetSize: tapTargetSize,
          ),
          onLongPress: onLongPress,
        );
      },
      cupertino: (_, __) {
        return CupertinoTextButtonData(
          padding: padding ??
              EdgeInsets.symmetric(
                vertical: Sizes.vPaddingTiny(context),
                horizontal: Sizes.hPaddingSmallest(context),
              ),
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

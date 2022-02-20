import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  static showDefaultSnackBar(
    BuildContext context, {
    String title = '',
    String description = '',
    Color? backgroundColor,
    Gradient? backgroundGradient,
    double? borderRadius,
    BoxBorder? border,
    EdgeInsets? padding,
    EdgeInsets? margin,
    double? width,
    double? elevation,
    Duration duration = const Duration(seconds: 3),
    bool isDismissible = true,
    DismissDirection dismissDirection = DismissDirection.down,
    SnackBarAction? snackBarAction,
  }) {
    assert(width == null || margin == null);
    final _snackBar = SnackBar(
      content: Material(
        elevation: elevation ?? 6,
        borderRadius: BorderRadius.circular(
          borderRadius ?? Sizes.snackBarRadius,
        ),
        child: Container(
          padding: padding ??
              EdgeInsets.symmetric(
                vertical: Sizes.vPaddingSmall,
                horizontal: Sizes.hPaddingMedium,
              ),
          decoration: BoxDecoration(
            color: backgroundColor = const Color(0xFF303030),
            gradient: backgroundGradient ?? AppColors.primaryIngredientColor,
            borderRadius: BorderRadius.circular(
              borderRadius ?? Sizes.snackBarRadius,
            ),
            border: border,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CustomText.h4(
                context,
                title,
                weight: FontStyles.fontWeightMedium,
                color: AppColors.lightBlack,
              ),
              SizedBox(
                height: Sizes.vMarginTiny,
              ),
              CustomText.h5(
                context,
                description,
                color: AppColors.lightBlack,
              ),
            ],
          ),
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          borderRadius ?? Sizes.snackBarRadius,
        ),
      ),
      backgroundColor: Colors.transparent,
      padding: EdgeInsets.zero,
      elevation: 0,
      margin: margin ??
          EdgeInsets.symmetric(
            horizontal: Sizes.hMarginComment,
            vertical: Sizes.vMarginComment,
          ),
      width: width,
      action: snackBarAction,
      behavior: SnackBarBehavior.floating,
      duration: duration,
      dismissDirection:
          isDismissible ? dismissDirection : DismissDirection.none,
      onVisible: () {},
    );

    ScaffoldMessenger.of(context).removeCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
  }
}

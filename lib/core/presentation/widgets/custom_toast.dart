import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

abstract class CustomToast {
  static void showToast(
    BuildContext context, {
    Widget? child,
    Color? backgroundColor,
    Gradient? backgroundGradient,
    double? borderRadius,
    BoxBorder? border,
    EdgeInsets? margin,
    EdgeInsets? padding,
    ToastGravity toastGravity = ToastGravity.BOTTOM,
    Duration toastDuration = const Duration(seconds: 3),
    Duration fadeDuration = const Duration(milliseconds: 350),
    PositionedToastBuilder? positionedToastBuilder,
  }) {
    FToast().init(context);

    final toast = Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).colorScheme.secondary,
        gradient: backgroundGradient,
        borderRadius: BorderRadius.circular(
          borderRadius ?? Sizes.toastRadius20(context),
        ),
        border: border,
      ),
      margin: margin,
      padding: padding ??
          EdgeInsets.symmetric(
            vertical: Sizes.paddingV16(context),
            horizontal: Sizes.paddingH22(context),
          ),
      child: child,
    );

    FToast().removeCustomToast();
    FToast().showToast(
      child: toast,
      gravity: toastGravity,
      toastDuration: toastDuration,
      fadeDuration: fadeDuration,
      positionedToastBuilder: positionedToastBuilder,
    );
  }

  //using Toast without context will be shown even if the app is in background
  static Future<bool?> showBackgroundToast(
    BuildContext context, {
    String msg = '',
    Color? backgroundColor,
    Toast toastLength = Toast.LENGTH_LONG,
    ToastGravity toastGravity = ToastGravity.BOTTOM,
  }) async {
    return await Fluttertoast.showToast(
      msg: msg,
      fontSize: Sizes.font18(context),
      textColor: AppStaticColors.lightBlack,
      backgroundColor: backgroundColor ?? AppStaticColors.toastColor,
      toastLength: toastLength,
      gravity: toastGravity,
      timeInSecForIosWeb: 1,
    );
  }
}

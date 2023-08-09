import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';

import '../../core_features/theme/presentation/utils/app_static_colors.dart';
import '../styles/styles.dart';

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
          borderRadius ?? Sizes.dialogR20,
        ),
        border: border,
      ),
      margin: margin,
      padding: padding ??
          const EdgeInsets.symmetric(
            vertical: Sizes.paddingV14,
            horizontal: Sizes.paddingH20,
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
    return Fluttertoast.showToast(
      msg: msg,
      fontSize: Sizes.font16,
      textColor: AppStaticColors.lightBlack,
      backgroundColor: backgroundColor ?? AppStaticColors.toastColor,
      toastLength: toastLength,
      gravity: toastGravity,
    );
  }
}

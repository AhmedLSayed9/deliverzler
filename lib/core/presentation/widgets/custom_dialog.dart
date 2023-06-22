import 'package:flutter/material.dart';

abstract class CustomDialog {
  static Future<T?> showDialog<T extends Object?>(
    BuildContext context, {
    Widget? child,
    Color? backgroundColor,
    ShapeBorder? shape,
    EdgeInsets? margin,
    EdgeInsetsGeometry? contentPadding,
    bool barrierDismissible = true,
  }) async {
    final alertDialog = AlertDialog(
      content: child,
      backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      shape: shape,
      insetPadding: margin ?? EdgeInsets.zero,
      contentPadding: contentPadding ?? EdgeInsets.zero,
    );

    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: '',
      transitionBuilder: (ctx, a1, a2, widget) => Transform.scale(
        scale: a1.value,
        child: WillPopScope(
          //This prevent closing the dialog when pressing device's back button
          onWillPop: () => Future.value(barrierDismissible),
          child: Opacity(
            opacity: a1.value,
            child: alertDialog,
          ),
        ),
      ),
      pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) =>
          const SizedBox(),
    );
  }
}

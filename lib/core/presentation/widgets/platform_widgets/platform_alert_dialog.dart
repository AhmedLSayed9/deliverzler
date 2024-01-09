import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helpers/platform_helper.dart';

Future<T?> showPlatformAlertDialog<T extends Object?>({
  required BuildContext context,
  Widget? title,
  Widget Function(BuildContext context)? content,
  EdgeInsetsGeometry titlePadding = EdgeInsets.zero,
  EdgeInsetsGeometry contentPadding = EdgeInsets.zero,
  MaterialDialogData materialDialogData = const MaterialDialogData(),
  CupertinoDialogData cupertinoDialogData = const CupertinoDialogData(),
  bool barrierDismissible = true,
}) async {
  final reformedContentPadding = EdgeInsets.symmetric(
    horizontal: contentPadding.horizontal / 2,
  ).copyWith(
    top: title == null ? contentPadding.vertical / 2 : 0,
    bottom: contentPadding.vertical / 2,
  );

  if (PlatformHelper.isMaterialApp) {
    final horizontalActionPadding = materialDialogData.actionsPadding.horizontal / 2;
    final reformedActionsPadding = EdgeInsets.symmetric(
      horizontal: horizontalActionPadding,
    ).copyWith(
      top: title == null && content == null ? materialDialogData.actionsPadding.vertical / 2 : 0,
      bottom: materialDialogData.actionsPadding.vertical / 2,
    );
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: '',
      transitionBuilder: (context, a1, a2, widget) => Transform.scale(
        scale: a1.value,
        child: PopScope(
          //This prevent closing the dialog when pressing device's back button
          canPop: barrierDismissible,
          child: Opacity(
            opacity: a1.value,
            child: LayoutBuilder(
              builder: (context, constraints) {
                // This prioritizes insetPadding over preferred maxWidth.
                // It's A workaround until https://github.com/flutter/flutter/issues/44570 is fixed.
                final hInsetPadding = materialDialogData.insetPadding.horizontal;
                final maxWidth = min(
                  constraints.maxWidth - hInsetPadding,
                  materialDialogData.maxWidth + hInsetPadding,
                );
                return UnconstrainedBox(
                  constrainedAxis: Axis.vertical,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: maxWidth),
                    child: AlertDialog(
                      scrollable: true,
                      title: title,
                      titlePadding: titlePadding,
                      content: content != null ? content(context) : null,
                      contentPadding: reformedContentPadding,
                      actions: materialDialogData.actions?.call(context),
                      actionsPadding: reformedActionsPadding,
                      buttonPadding: EdgeInsets.symmetric(horizontal: horizontalActionPadding / 2),
                      actionsAlignment: MainAxisAlignment.center,
                      insetPadding: materialDialogData.insetPadding,
                      shape: materialDialogData.shape,
                      backgroundColor: materialDialogData.backgroundColor,
                    ),
                  ),
                );
              },
            ),
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

  // ignore: deprecated_member_use
  final textScaleFactor = MediaQuery.textScaleFactorOf(context);
  const kDialogEdgePadding = 20.0;

  return showCupertinoDialog(
    context: context,
    barrierDismissible: barrierDismissible,
    barrierLabel: '',
    // CupertinoAlertDialog adds 20.0 (_kDialogEdgePadding) horizontal padding for both title and content.
    // & adds 20.0 (_kDialogEdgePadding) vertical padding around title and content (together).
    // & adds 1.0 vertical padding between title and content.
    builder: (context) => CupertinoAlertDialog(
      title: Padding(
        padding: titlePadding
            .subtract(
              EdgeInsets.only(
                left: kDialogEdgePadding,
                right: kDialogEdgePadding,
                bottom: content == null ? kDialogEdgePadding : 1.0,
                top: kDialogEdgePadding * textScaleFactor,
              ),
            )
            .clamp(EdgeInsets.zero, EdgeInsetsGeometry.infinity),
        child: title,
      ),
      content: Padding(
        padding: reformedContentPadding
            .subtract(
              EdgeInsets.only(
                left: kDialogEdgePadding,
                right: kDialogEdgePadding,
                bottom: kDialogEdgePadding * textScaleFactor,
                top: title == null ? kDialogEdgePadding : 1.0,
              ),
            )
            .clamp(EdgeInsets.zero, EdgeInsetsGeometry.infinity),
        child: content != null ? content(context) : null,
      ),
      actions: cupertinoDialogData.actions?.call(context) ?? [],
    ),
  );
}

class MaterialDialogData {
  const MaterialDialogData({
    this.actions,
    this.actionsPadding = EdgeInsets.zero,
    this.insetPadding = EdgeInsets.zero,
    this.maxWidth = 300,
    this.shape,
    this.backgroundColor,
  });

  final List<Widget>? Function(BuildContext context)? actions;
  final EdgeInsetsGeometry actionsPadding;
  final EdgeInsets insetPadding;
  final double maxWidth;
  final ShapeBorder? shape;
  final Color? backgroundColor;
}

class CupertinoDialogData {
  const CupertinoDialogData({
    this.actions,
  });

  final List<CupertinoDialogAction> Function(BuildContext context)? actions;
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../helpers/platform_helper.dart';

Future<T?> showPlatformAlertDialog<T extends Object?>({
  required BuildContext context,
  Widget? title,
  Widget? content,
  EdgeInsetsGeometry titlePadding = EdgeInsets.zero,
  EdgeInsetsGeometry contentPadding = EdgeInsets.zero,
  MaterialDialogData materialDialogData = const MaterialDialogData(),
  CupertinoDialogData cupertinoDialogData = const CupertinoDialogData(),
  bool barrierDismissible = true,
}) async {
  final reformedTitlePadding = EdgeInsets.only(
    left: titlePadding.horizontal / 2,
    right: titlePadding.horizontal / 2,
    top: titlePadding.vertical / 2,
    bottom: content == null ? titlePadding.vertical / 2 : 0,
  );

  if (PlatformHelper.isMaterialApp) {
    final reformedActionsPadding = EdgeInsets.only(
      left: materialDialogData.actionsPadding.horizontal / 2,
      right: materialDialogData.actionsPadding.horizontal / 2,
      top: content == null ? materialDialogData.actionsPadding.vertical / 2 : 0,
      bottom: materialDialogData.actionsPadding.vertical / 2,
    );
    return showGeneralDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierLabel: '',
      transitionBuilder: (context, a1, a2, widget) => Transform.scale(
        scale: a1.value,
        child: WillPopScope(
          //This prevent closing the dialog when pressing device's back button
          onWillPop: () => Future.value(barrierDismissible),
          child: Opacity(
            opacity: a1.value,
            child: AlertDialog(
              title: title,
              titlePadding: reformedTitlePadding,
              content: content,
              contentPadding: contentPadding,
              actions: materialDialogData.actions,
              actionsPadding: reformedActionsPadding,
              actionsAlignment: MainAxisAlignment.center,
              insetPadding: materialDialogData.insetPadding,
              shape: materialDialogData.shape,
              backgroundColor: materialDialogData.backgroundColor,
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
        padding: reformedTitlePadding
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
        padding: contentPadding
            .subtract(
              EdgeInsets.only(
                left: kDialogEdgePadding,
                right: kDialogEdgePadding,
                bottom: kDialogEdgePadding * textScaleFactor,
                top: title == null ? kDialogEdgePadding : 1.0,
              ),
            )
            .clamp(EdgeInsets.zero, EdgeInsetsGeometry.infinity),
        child: content,
      ),
      actions: cupertinoDialogData.actions,
    ),
  );
}

class MaterialDialogData {
  const MaterialDialogData({
    this.actions,
    this.actionsPadding = EdgeInsets.zero,
    this.insetPadding = EdgeInsets.zero,
    this.shape,
    this.backgroundColor,
  });

  final List<Widget>? actions;
  final EdgeInsetsGeometry actionsPadding;
  final EdgeInsets insetPadding;
  final ShapeBorder? shape;
  final Color? backgroundColor;
}

class CupertinoDialogData {
  const CupertinoDialogData({
    this.actions = const [],
  });

  final List<CupertinoDialogAction> actions;
}

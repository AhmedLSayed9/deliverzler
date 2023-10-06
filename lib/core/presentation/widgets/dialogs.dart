import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../gen/my_assets.dart';
import '../helpers/localization_helper.dart';
import '../routing/navigation_service.dart';
import '../styles/styles.dart';
import 'custom_elevated_button.dart';
import 'platform_widgets/platform_alert_dialog.dart';
import 'loading_widgets.dart';

abstract class Dialogs {
  static const _defaultTitlePadding = EdgeInsets.symmetric(
    vertical: Sizes.dialogPaddingV20,
    horizontal: Sizes.dialogPaddingH20,
  );

  static const _defaultContentPadding = EdgeInsets.symmetric(
    vertical: Sizes.dialogPaddingV20,
    horizontal: Sizes.dialogPaddingH20,
  );

  static const _defaultMaterialActionPadding = EdgeInsets.symmetric(
    vertical: Sizes.dialogPaddingV20,
    horizontal: Sizes.dialogPaddingH20,
  );

  static const _defaultMaterialInsetPadding = EdgeInsets.symmetric(
    horizontal: Sizes.marginH28,
  );

  static final _defaultMaterialShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(Sizes.dialogR20),
  );

  static Future<T?> showLoadingDialog<T extends Object?>(BuildContext context) async {
    return showPlatformAlertDialog(
      context: context,
      barrierDismissible: false,
      contentPadding: const EdgeInsets.symmetric(
        vertical: Sizes.dialogPaddingV28,
        horizontal: Sizes.dialogPaddingH20,
      ),
      content: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const DeliveryLoadingAnimation(
            width: 90,
            height: 90,
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          Text(
            tr(context).loading,
            style: TextStyles.f18(context).copyWith(fontWeight: FontStyles.fontWeightMedium),
          ),
        ],
      ),
      materialDialogData: MaterialDialogData(
        insetPadding: const EdgeInsets.symmetric(horizontal: 72),
        shape: _defaultMaterialShape,
      ),
    );
  }

  static Future<T?> showErrorDialog<T extends Object?>(
    BuildContext context, {
    required String message,
  }) async {
    return showPlatformAlertDialog(
      context: context,
      titlePadding: _defaultTitlePadding,
      title: Text(
        tr(context).ops_err,
        //Explicitly using style to be applied for CupertinoAlertDialog.
        style: Theme.of(context).dialogTheme.titleTextStyle,
        textAlign: TextAlign.center,
      ),
      contentPadding: _defaultContentPadding,
      content: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Image.asset(
            MyAssets.ASSETS_ICONS_DIALOG_WIDGET_ICONS_ERROR_PNG,
            color: const Color(0xffcca76a),
            height: 72,
            width: 72,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: Sizes.marginV8,
          ),
          Text(
            message,
            style: Theme.of(context).dialogTheme.contentTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      materialDialogData: MaterialDialogData(
        actions: (context) => [
          CustomElevatedButton(
            enableGradient: true,
            onPressed: () => NavigationService.popDialog(context),
            child: Text(
              tr(context).oK,
              style: TextStyles.coloredElevatedButton(context),
            ),
          ),
        ],
        actionsPadding: _defaultMaterialActionPadding,
        insetPadding: _defaultMaterialInsetPadding,
        shape: _defaultMaterialShape,
      ),
      cupertinoDialogData: CupertinoDialogData(
        actions: (context) => [
          CupertinoDialogAction(
            onPressed: () => NavigationService.popDialog(context),
            child: Text(
              tr(context).oK,
              style: TextStyles.cupertinoDialogAction(context),
            ),
          ),
        ],
      ),
    );
  }

  static Future<T?> showGeneralDialog<T extends Object?>(
    BuildContext context, {
    Widget? title,
    Widget? content,
    Color? backgroundColor,
    List<Widget>? Function(BuildContext context)? materialActions,
    List<CupertinoDialogAction> Function(BuildContext context)? cupertinoActions,
  }) async {
    return showPlatformAlertDialog(
      context: context,
      titlePadding: _defaultTitlePadding,
      title: title,
      contentPadding: _defaultContentPadding,
      content: content != null
          ? (context) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [content],
              )
          : null,
      materialDialogData: MaterialDialogData(
        insetPadding: _defaultMaterialInsetPadding,
        shape: _defaultMaterialShape,
        actions: (context) => materialActions?.call(context),
        actionsPadding: _defaultMaterialActionPadding,
        backgroundColor: backgroundColor,
      ),
      cupertinoDialogData: CupertinoDialogData(
        actions: (context) => cupertinoActions?.call(context) ?? [],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../gen/my_assets.dart';
import '../helpers/localization_helper.dart';
import '../routing/navigation_service.dart';
import '../styles/font_styles.dart';
import '../styles/sizes.dart';
import 'custom_elevated_button.dart';
import 'platform_widgets/platform_alert_dialog.dart';
import 'custom_icon.dart';
import 'custom_text.dart';
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

  static const _defaultMaterialInsetPadding = EdgeInsets.symmetric(
    horizontal: Sizes.marginH28,
  );

  static RoundedRectangleBorder get _defaultMaterialShape => RoundedRectangleBorder(
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
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const DeliveryLoadingAnimation(
            width: Sizes.loadingIndicatorR90,
            height: Sizes.loadingIndicatorR90,
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          CustomText.f18(
            context,
            tr(context).loading,
            weight: FontStyles.fontWeightMedium,
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
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomIcon.i72(
            MyAssets.ASSETS_ICONS_DIALOG_WIDGET_ICONS_ERROR_PNG,
            color: const Color(0xffcca76a),
          ),
          const SizedBox(
            height: Sizes.marginV8,
          ),
          Text(
            message,
            style: Theme.of(context).dialogTheme.contentTextStyle,
          ),
        ],
      ),
      materialDialogData: MaterialDialogData(
        actions: [
          CustomElevatedButton(
            enableGradient: true,
            onPressed: () => NavigationService.popDialog(context),
            child: CustomText.f16(
              context,
              tr(context).oK,
              color: const Color(0xffffffff),
              weight: FontStyles.fontWeightSemiBold,
            ),
          ),
        ],
        actionsPadding: _defaultTitlePadding,
        insetPadding: _defaultMaterialInsetPadding,
        shape: _defaultMaterialShape,
      ),
      cupertinoDialogData: CupertinoDialogData(
        actions: [
          CupertinoDialogAction(
            onPressed: () => NavigationService.popDialog(context),
            child: CustomText.f16(
              context,
              tr(context).oK,
              weight: FontStyles.fontWeightSemiBold,
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
    List<Widget>? materialActions,
    List<CupertinoDialogAction> cupertinoActions = const [],
  }) async {
    return showPlatformAlertDialog(
      context: context,
      titlePadding: _defaultTitlePadding,
      title: title,
      contentPadding: _defaultContentPadding,
      content: content != null
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [content],
            )
          : null,
      materialDialogData: MaterialDialogData(
        insetPadding: _defaultMaterialInsetPadding,
        shape: _defaultMaterialShape,
        actions: materialActions,
        actionsPadding: _defaultTitlePadding,
      ),
      cupertinoDialogData: CupertinoDialogData(
        actions: cupertinoActions,
      ),
    );
  }
}

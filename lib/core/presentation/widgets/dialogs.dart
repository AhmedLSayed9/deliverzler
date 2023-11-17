import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../gen/my_assets.dart';
import '../../core_features/theme/presentation/utils/custom_colors.dart';
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
    horizontal: Sizes.marginH20,
  );

  static final _defaultMaterialShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(Sizes.dialogR20),
  );

  static Widget _titleText(BuildContext context, String text) => Text(
        text,
        //Explicitly using style to be applied for CupertinoAlertDialog.
        style: Theme.of(context).dialogTheme.titleTextStyle,
        textAlign: TextAlign.center,
      );

  static Widget _contentText(BuildContext context, String text) => Text(
        text,
        //Explicitly using style to be applied for CupertinoAlertDialog.
        style: Theme.of(context).dialogTheme.contentTextStyle,
        textAlign: TextAlign.center,
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
        maxWidth: 240,
        insetPadding: _defaultMaterialInsetPadding,
        shape: _defaultMaterialShape,
      ),
    );
  }

  static Future<T?> showCustomDialog<T extends Object?>(
    BuildContext context, {
    Widget? title,
    Widget Function(BuildContext context)? content,
    List<Widget>? Function(BuildContext context)? materialActions,
    List<CupertinoDialogAction> Function(BuildContext context)? cupertinoActions,
  }) async {
    return showPlatformAlertDialog(
      context: context,
      titlePadding: _defaultTitlePadding,
      title: title,
      contentPadding: _defaultContentPadding,
      content: content,
      materialDialogData: MaterialDialogData(
        shape: _defaultMaterialShape,
        actions: (context) => materialActions?.call(context),
        actionsPadding: _defaultMaterialActionPadding,
        insetPadding: _defaultMaterialInsetPadding,
      ),
      cupertinoDialogData: CupertinoDialogData(
        actions: (context) => cupertinoActions?.call(context) ?? [],
      ),
    );
  }

  static Future<T?> showErrorDialog<T extends Object?>(
    BuildContext context, {
    required String message,
  }) async {
    return showCustomDialog(
      context,
      title: _titleText(context, tr(context).ops_err),
      content: (_) => Column(
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
          _contentText(context, message),
        ],
      ),
      materialActions: (ctx) => [
        CustomElevatedButton(
          enableGradient: true,
          onPressed: () => NavigationService.popDialog(ctx),
          child: Text(
            tr(context).oK,
            style: TextStyles.coloredElevatedButton(context),
          ),
        ),
      ],
      cupertinoActions: (ctx) => [
        CupertinoDialogAction(
          onPressed: () => NavigationService.popDialog(ctx),
          child: Text(
            tr(context).oK,
            style: TextStyles.cupertinoDialogAction(context),
          ),
        ),
      ],
    );
  }

  static Future<T?> showConfirmDialog<T extends Object?>(
    BuildContext context, {
    required String title,
    required String confirmTitle,
    required void Function(BuildContext) confirmCallback,
    String? description,
    Widget Function(BuildContext context)? content,
  }) {
    assert(
      description != null || content != null,
      'One of description or content must be specified',
    );
    assert(
      description == null || content == null,
      'Only one of description or content may be specified',
    );

    return showCustomDialog(
      context,
      title: _titleText(context, title),
      content: (ctx) => content?.call(ctx) ?? _contentText(context, description!),
      materialActions: (ctx) => [
        CustomElevatedButton(
          constraints: const BoxConstraints(minWidth: 120, maxWidth: 120),
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.buttonPaddingV12,
            horizontal: Sizes.buttonPaddingH24,
          ),
          buttonColor: customColors(context).greyColor,
          onPressed: () => NavigationService.popDialog(ctx),
          child: Text(
            tr(context).cancel,
            style: TextStyles.coloredElevatedButton(context),
            textAlign: TextAlign.center,
          ),
        ),
        CustomElevatedButton(
          enableGradient: true,
          constraints: const BoxConstraints(minWidth: 120, maxWidth: 120),
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.buttonPaddingV12,
            horizontal: Sizes.buttonPaddingH24,
          ),
          onPressed: () => confirmCallback(ctx),
          child: Text(
            confirmTitle,
            style: TextStyles.coloredElevatedButton(context),
            textAlign: TextAlign.center,
          ),
        ),
      ],
      cupertinoActions: (ctx) => [
        CupertinoDialogAction(
          isDefaultAction: true,
          onPressed: () => NavigationService.popDialog(ctx),
          child: Text(
            tr(context).cancel,
            style: TextStyles.cupertinoDialogAction(context),
          ),
        ),
        CupertinoDialogAction(
          onPressed: () => confirmCallback(ctx),
          child: Text(
            confirmTitle,
            style: TextStyles.cupertinoDialogAction(context),
          ),
        ),
      ],
    );
  }
}

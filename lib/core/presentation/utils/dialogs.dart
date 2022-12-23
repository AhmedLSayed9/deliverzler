import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/styles/app_images.dart';
import 'package:deliverzler/core/presentation/routing/navigation_service.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_button.dart';
import 'package:deliverzler/core/presentation/widgets/custom_dialog.dart';
import 'package:deliverzler/core/presentation/widgets/custom_icon.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';
import 'package:deliverzler/core/presentation/widgets/loading_indicators.dart';
import 'package:flutter/material.dart';

abstract class Dialogs {
  static Future showLoadingDialog(BuildContext context) async {
    return await CustomDialog.showDialog(
      context,
      barrierDismissible: false,
      contentPadding: EdgeInsets.symmetric(
        vertical: Sizes.dialogPaddingV30(context),
        horizontal: Sizes.dialogPaddingH20(context),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Sizes.dialogRadius20(context),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          LoadingIndicators.smallLoadingAnimation(
            context,
            width: Sizes.loadingIndicatorRadius90(context),
            height: Sizes.loadingIndicatorRadius90(context),
          ),
          SizedBox(
            height: Sizes.marginV16(context),
          ),
          CustomText.f18(
            context,
            tr(context).loading,
            alignment: Alignment.center,
            weight: FontStyles.fontWeightMedium,
          ),
        ],
      ),
    );
  }

  static Future showErrorDialog(
    BuildContext context, {
    required String message,
  }) async {
    return await CustomDialog.showDialog(
      context,
      contentPadding: EdgeInsets.symmetric(
        vertical: Sizes.dialogPaddingV30(context),
        horizontal: Sizes.dialogPaddingH20(context),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: Sizes.marginH30(context),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Sizes.dialogRadius20(context),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomIcon.i70(
            context,
            AppImages.error,
            color: const Color(0xffcca76a),
          ),
          SizedBox(
            height: Sizes.marginV16(context),
          ),
          CustomText.f20(
            context,
            tr(context).ops_err,
            textAlign: TextAlign.center,
            weight: FontStyles.fontWeightBold,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: Sizes.marginV8(context),
          ),
          CustomText.f18(
            context,
            message,
            textAlign: TextAlign.center,
            alignment: Alignment.center,
          ),
          SizedBox(
            height: Sizes.marginV22(context),
          ),
          CustomButton(
            text: tr(context).oK,
            onPressed: () {
              NavigationService.dismissDialog(context);
            },
          ),
        ],
      ),
    );
  }

  static Future showCustomDialog(
    BuildContext context, {
    required Widget child,
  }) async {
    return await CustomDialog.showDialog(
      context,
      contentPadding: EdgeInsets.symmetric(
        vertical: Sizes.dialogPaddingV30(context),
        horizontal: Sizes.dialogPaddingH20(context),
      ),
      margin: EdgeInsets.symmetric(
        horizontal: Sizes.marginH30(context),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          Sizes.dialogRadius20(context),
        ),
      ),
      child: child,
    );
  }
}

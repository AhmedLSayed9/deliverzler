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
      contentPadding: const EdgeInsets.symmetric(
        vertical: Sizes.dialogPaddingV28,
        horizontal: Sizes.dialogPaddingH20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.dialogR20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SmallLoadingAnimation(
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
    );
  }

  static Future showErrorDialog(
    BuildContext context, {
    required String message,
  }) async {
    return await CustomDialog.showDialog(
      context,
      contentPadding: const EdgeInsets.symmetric(
        vertical: Sizes.dialogPaddingV28,
        horizontal: Sizes.dialogPaddingH20,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: Sizes.marginH28,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.dialogR20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomIcon.i72(
            AppImages.error,
            color: const Color(0xffcca76a),
          ),
          const SizedBox(
            height: Sizes.marginV12,
          ),
          CustomText.f18(
            context,
            tr(context).ops_err,
            textAlign: TextAlign.center,
            weight: FontStyles.fontWeightBold,
            //alignment: Alignment.center,
          ),
          const SizedBox(
            height: Sizes.marginV6,
          ),
          CustomText.f16(
            context,
            message,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: Sizes.marginV20,
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
      contentPadding: const EdgeInsets.symmetric(
        vertical: Sizes.dialogPaddingV28,
        horizontal: Sizes.dialogPaddingH20,
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: Sizes.marginH28,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Sizes.dialogR20),
      ),
      child: child,
    );
  }
}

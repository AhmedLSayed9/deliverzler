import 'package:flutter/material.dart';
import 'package:deliverzler/core/localization/app_localization.dart';
import 'package:deliverzler/core/services/navigation_service.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_button.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';

class ConfirmChoiceDialog extends StatelessWidget {
  final String message;

  const ConfirmChoiceDialog({
    required this.message,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.screenWidth,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.dialogHPaddingMedium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText.h3(
              context,
              tr('areYouSure'),
              weight: FontStyles.fontWeightMedium,
            ),
            SizedBox(
              height: Sizes.vMarginComment,
            ),
            Align(
              alignment: AppLocalizations.instance.isAr()
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: FittedBox(
                child: CustomText.h4(
                  context,
                  message,
                ),
              ),
            ),
            SizedBox(
              height: Sizes.vMarginSmall,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.hPaddingSmallest,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    child: CustomText.h4(
                      context,
                      tr('cancel'),
                      color: const Color(0xffffffff),
                      weight: FontStyles.fontWeightMedium,
                      alignment: Alignment.center,
                    ),
                    buttonColor: AppColors.grey,
                    height: Sizes.roundedButtonDialogHeight,
                    width: Sizes.roundedButtonSmallWidth,
                    onPressed: () {
                      NavigationService.goBack();
                    },
                  ),
                  CustomButton(
                    text: tr('confirm'),
                    height: Sizes.roundedButtonDialogHeight,
                    width: Sizes.roundedButtonSmallWidth,
                    onPressed: () {
                      NavigationService.goBack(result: [true]);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

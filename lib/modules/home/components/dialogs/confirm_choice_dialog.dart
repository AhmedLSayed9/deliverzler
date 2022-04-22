import 'package:flutter/material.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
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
      width: Sizes.availableScreenWidth(context),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Sizes.dialogHPaddingMedium(context)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText.h3(
              context,
              tr(context).areYouSure,
              weight: FontStyles.fontWeightMedium,
            ),
            SizedBox(
              height: Sizes.vMarginComment(context),
            ),
            Align(
              alignment: LocalizationService.instance.isAr(context)
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
              height: Sizes.vMarginSmall(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.hPaddingSmallest(context),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    child: CustomText.h4(
                      context,
                      tr(context).cancel,
                      color: const Color(0xffffffff),
                      weight: FontStyles.fontWeightMedium,
                      alignment: Alignment.center,
                    ),
                    buttonColor: AppColors.grey,
                    height: Sizes.roundedButtonDialogHeight(context),
                    width: Sizes.roundedButtonSmallWidth(context),
                    onPressed: () {
                      NavigationService.goBack(context);
                    },
                  ),
                  CustomButton(
                    text: tr(context).confirm,
                    height: Sizes.roundedButtonDialogHeight(context),
                    width: Sizes.roundedButtonSmallWidth(context),
                    onPressed: () {
                      NavigationService.goBack(context, result: [true]);
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

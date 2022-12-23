import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/routing/navigation_service.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_button.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';

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
        padding:
            EdgeInsets.symmetric(horizontal: Sizes.dialogPaddingH10(context)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText.f20(
              context,
              tr(context).areYouSure,
              weight: FontStyles.fontWeightSemiBold,
            ),
            SizedBox(
              height: Sizes.marginV8(context),
            ),
            Align(
              alignment: AlignmentDirectional.centerStart,
              child: FittedBox(
                child: CustomText.f18(
                  context,
                  message,
                ),
              ),
            ),
            SizedBox(
              height: Sizes.marginV16(context),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: Sizes.paddingH10(context),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    buttonColor: customColors(context).greyColor,
                    height: Sizes.buttonHeight46(context),
                    width: Sizes.buttonWidth116(context),
                    onPressed: () {
                      NavigationService.goBack(context);
                    },
                    child: CustomText.f16(
                      context,
                      tr(context).cancel,
                      color: const Color(0xffffffff),
                      weight: FontStyles.fontWeightSemiBold,
                      alignment: Alignment.center,
                    ),
                  ),
                  CustomButton(
                    text: tr(context).confirm,
                    height: Sizes.buttonHeight46(context),
                    width: Sizes.buttonWidth116(context),
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

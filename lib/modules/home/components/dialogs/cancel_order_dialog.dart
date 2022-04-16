import 'package:deliverzler/modules/home/components/dialogs/cancel_order_note_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_button.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/modules/home/models/order_model.dart';

class CancelOrderDialog extends HookWidget {
  final OrderModel orderModel;

  const CancelOrderDialog({
    required this.orderModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cancelNoteController = useTextEditingController(text: '');

    return SizedBox(
      width: Sizes.screenWidth(context),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Sizes.dialogHPaddingMedium(context)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText.h4(
              context,
              tr(context).reasonForCancelingTheOrder + ':',
            ),
            SizedBox(
              height: Sizes.vMarginSmallest(context),
            ),
            CancelOrderNoteComponent(cancelNoteController: _cancelNoteController,),
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
                      NavigationService.goBack();
                    },
                  ),
                  CustomButton(
                    text: tr(context).confirm,
                    height: Sizes.roundedButtonDialogHeight(context),
                    width: Sizes.roundedButtonSmallWidth(context),
                    onPressed: () {
                      NavigationService.goBack(
                          result: [true, _cancelNoteController.text]);
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

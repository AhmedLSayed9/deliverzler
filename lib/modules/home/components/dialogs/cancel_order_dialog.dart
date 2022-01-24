import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/localization/app_localization.dart';
import 'package:deliverzler/core/services/navigation_service.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_button.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/core/widgets/custom_text_field.dart';
import 'package:deliverzler/modules/home/models/order_model.dart';
import 'package:deliverzler/modules/home/viewmodels/order_dialogs_viewmodel.dart';

class CancelOrderDialog extends ConsumerStatefulWidget {
  final OrderModel orderModel;

  const CancelOrderDialog({
    required this.orderModel,
    Key? key,
  }) : super(key: key);

  @override
  _CancelOrderDialogState createState() => _CancelOrderDialogState();
}

class _CancelOrderDialogState extends ConsumerState<CancelOrderDialog> {
  @override
  void didChangeDependencies() {
    ref.read(orderDialogsViewModel).cancelNote = '';
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final orderDialogsVM = ref.watch(orderDialogsViewModel.notifier);

    return SizedBox(
      width: Sizes.screenWidth,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Sizes.dialogHPaddingMedium),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomText.h4(
              context,
              tr('reasonForCancelingTheOrder') + ':',
            ),
            SizedBox(
              height: Sizes.vMarginSmallest,
            ),
            CustomTextField(
              maxLines: 6,
              maxLength: 200,
              textInputAction: TextInputAction.newline,
              hintText: tr('typeYourNote') + '...',
              contentPadding: EdgeInsets.symmetric(
                vertical: Sizes.vPaddingSmall,
                horizontal: Sizes.hPaddingSmall,
              ),
              onChanged: (value) {
                orderDialogsVM.cancelNote = value;
              },
            ),
            SizedBox(
              height: Sizes.vMarginSmallest,
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

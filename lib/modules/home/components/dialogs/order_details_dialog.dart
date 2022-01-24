import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:deliverzler/core/localization/app_localization.dart';
import 'package:deliverzler/core/services/navigation_service.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_button.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/modules/home/models/order_model.dart';

class OrderDetailsDialog extends StatelessWidget {
  final OrderModel orderModel;

  const OrderDetailsDialog({
    required this.orderModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.screenWidth,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Sizes.dialogHPaddingSmall),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  QrImage(
                    data: orderModel.orderId!,
                    size: Sizes.qrImageRadius,
                    foregroundColor: AppColors.secondaryColor,
                    padding: EdgeInsets.zero,
                  ),
                  SizedBox(
                    width: Sizes.hMarginSmall,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        CustomText.h4(
                          context,
                          tr('orderDetails') + ':',
                          underline: true,
                          weight: FontStyles.fontWeightSemiBold,
                        ),
                        SizedBox(
                          height: Sizes.vMarginSmallest,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText.h4(
                              context,
                              tr('id') + ':',
                            ),
                            CustomText.h4(
                              context,
                              '#${orderModel.orderId!.substring(0, 6)}',
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText.h4(
                              context,
                              tr('status') + ':',
                            ),
                            CustomText.h4(
                              context,
                              orderModel.orderStatus,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText.h4(
                              context,
                              tr('payment') + ':',
                            ),
                            CustomText.h4(
                              context,
                              orderModel.paymentMethod,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: Sizes.vMarginSmallest,
              ),
              CustomText.h4(
                context,
                tr('userDetails') + ':',
                underline: true,
                weight: FontStyles.fontWeightSemiBold,
              ),
              SizedBox(
                height: Sizes.vMarginTiny,
              ),
              CustomText.h4(
                context,
                orderModel.userName.isEmpty
                    ? tr('user') + orderModel.userId.substring(0, 6)
                    : orderModel.userName,
                padding: AppLocalizations.instance.isAr()
                    ? EdgeInsets.only(right: Sizes.hPaddingSmall)
                    : EdgeInsets.only(left: Sizes.hPaddingSmall),
              ),
              CustomText.h4(
                context,
                orderModel.addressModel!.state +
                    ', ' +
                    orderModel.addressModel!.city +
                    ', ' +
                    orderModel.addressModel!.street,
                padding: AppLocalizations.instance.isAr()
                    ? EdgeInsets.only(right: Sizes.hPaddingSmall)
                    : EdgeInsets.only(left: Sizes.hPaddingSmall),
              ),
              CustomText.h4(
                context,
                orderModel.addressModel!.mobile,
                padding: AppLocalizations.instance.isAr()
                    ? EdgeInsets.only(right: Sizes.hPaddingSmall)
                    : EdgeInsets.only(left: Sizes.hPaddingSmall),
              ),
              SizedBox(
                height: Sizes.vMarginSmallest,
              ),
              CustomText.h4(
                context,
                tr('note') + ':',
                underline: true,
                weight: FontStyles.fontWeightSemiBold,
              ),
              SizedBox(
                height: Sizes.vMarginTiny,
              ),
              CustomText.h4(
                context,
                orderModel.userNote.isEmpty ? tr('none') : orderModel.userNote,
                padding: AppLocalizations.instance.isAr()
                    ? EdgeInsets.only(right: Sizes.hPaddingSmall)
                    : EdgeInsets.only(left: Sizes.hPaddingSmall),
              ),
              SizedBox(
                height: Sizes.vMarginSmall,
              ),
              CustomButton(
                text: tr('back'),
                height: Sizes.roundedButtonDialogHeight,
                width: Sizes.roundedButtonDialogWidth,
                onPressed: () {
                  NavigationService.goBack();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

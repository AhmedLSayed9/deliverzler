import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
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
      width: Sizes.screenWidth(context),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Sizes.dialogHPaddingSmall(context)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  QrImage(
                    data: orderModel.orderId!,
                    size: Sizes.qrImageRadius(context),
                    foregroundColor: AppColors.accentColor,
                    padding: EdgeInsets.zero,
                  ),
                  SizedBox(
                    width: Sizes.hMarginSmall(context),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        CustomText.h4(
                          context,
                          tr(context).orderDetails + ':',
                          underline: true,
                          weight: FontStyles.fontWeightSemiBold,
                        ),
                        SizedBox(
                          height: Sizes.vMarginSmallest(context),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText.h4(
                              context,
                              tr(context).id + ':',
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
                              tr(context).status + ':',
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
                              tr(context).payment + ':',
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
                height: Sizes.vMarginSmallest(context),
              ),
              CustomText.h4(
                context,
                tr(context).userDetails + ':',
                underline: true,
                weight: FontStyles.fontWeightSemiBold,
              ),
              SizedBox(
                height: Sizes.vMarginTiny(context),
              ),
              CustomText.h4(
                context,
                orderModel.userName.isEmpty
                    ? tr(context).user + orderModel.userId.substring(0, 6)
                    : orderModel.userName,
                padding: LocalizationService.instance.isAr(context)
                    ? EdgeInsets.only(right: Sizes.hPaddingSmall(context))
                    : EdgeInsets.only(left: Sizes.hPaddingSmall(context)),
              ),
              CustomText.h4(
                context,
                orderModel.addressModel!.state +
                    ', ' +
                    orderModel.addressModel!.city +
                    ', ' +
                    orderModel.addressModel!.street,
                padding: LocalizationService.instance.isAr(context)
                    ? EdgeInsets.only(right: Sizes.hPaddingSmall(context))
                    : EdgeInsets.only(left: Sizes.hPaddingSmall(context)),
              ),
              CustomText.h4(
                context,
                orderModel.addressModel!.mobile,
                padding: LocalizationService.instance.isAr(context)
                    ? EdgeInsets.only(right: Sizes.hPaddingSmall(context))
                    : EdgeInsets.only(left: Sizes.hPaddingSmall(context)),
              ),
              SizedBox(
                height: Sizes.vMarginSmallest(context),
              ),
              CustomText.h4(
                context,
                tr(context).note + ':',
                underline: true,
                weight: FontStyles.fontWeightSemiBold,
              ),
              SizedBox(
                height: Sizes.vMarginTiny(context),
              ),
              CustomText.h4(
                context,
                orderModel.userNote.isEmpty
                    ? tr(context).none
                    : orderModel.userNote,
                padding: LocalizationService.instance.isAr(context)
                    ? EdgeInsets.only(right: Sizes.hPaddingSmall(context))
                    : EdgeInsets.only(left: Sizes.hPaddingSmall(context)),
              ),
              SizedBox(
                height: Sizes.vMarginSmall(context),
              ),
              CustomButton(
                text: tr(context).back,
                height: Sizes.roundedButtonDialogHeight(context),
                width: Sizes.roundedButtonDialogWidth(context),
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

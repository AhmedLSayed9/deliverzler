import 'package:deliverzler/features/home/domain/entities/order.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/routing/navigation_service.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_button.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';

class OrderDetailsDialog extends StatelessWidget {
  final AppOrder order;

  const OrderDetailsDialog({
    required this.order,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Sizes.availableScreenWidth(context),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              QrImage(
                data: order.id,
                size: Sizes.imageRadius100(context),
                foregroundColor: Theme.of(context).colorScheme.secondary,
                padding: EdgeInsets.zero,
              ),
              SizedBox(
                width: Sizes.marginH16(context),
              ),
              Expanded(
                child: Column(
                  children: [
                    CustomText.f18(
                      context,
                      '${tr(context).orderDetails}:',
                      underline: true,
                      weight: FontStyles.fontWeightSemiBold,
                    ),
                    SizedBox(
                      height: Sizes.marginV10(context),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText.f18(
                          context,
                          '${tr(context).id}:',
                        ),
                        CustomText.f18(
                          context,
                          '#${order.id.substring(0, 6)}',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText.f18(
                          context,
                          '${tr(context).status}:',
                        ),
                        CustomText.f18(
                          context,
                          order.pickupOption.name,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText.f18(
                          context,
                          '${tr(context).payment}:',
                        ),
                        CustomText.f18(
                          context,
                          order.paymentMethod,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: Sizes.marginV10(context),
          ),
          CustomText.f18(
            context,
            '${tr(context).userDetails}:',
            underline: true,
            weight: FontStyles.fontWeightSemiBold,
          ),
          SizedBox(
            height: Sizes.marginV4(context),
          ),
          CustomText.f18(
            context,
            order.userName.isEmpty
                ? tr(context).user + order.userId.substring(0, 6)
                : order.userName,
            padding:
                EdgeInsetsDirectional.only(start: Sizes.paddingH16(context)),
          ),
          CustomText.f18(
            context,
            '${order.address!.state}, ${order.address!.city}, ${order.address!.street}',
            padding:
                EdgeInsetsDirectional.only(start: Sizes.paddingH16(context)),
          ),
          CustomText.f18(
            context,
            order.address!.mobile,
            padding:
                EdgeInsetsDirectional.only(start: Sizes.paddingH16(context)),
          ),
          SizedBox(
            height: Sizes.marginV10(context),
          ),
          CustomText.f18(
            context,
            '${tr(context).note}:',
            underline: true,
            weight: FontStyles.fontWeightSemiBold,
          ),
          SizedBox(
            height: Sizes.marginV4(context),
          ),
          CustomText.f18(
            context,
            order.userNote.isEmpty ? tr(context).none : order.userNote,
            padding:
                EdgeInsetsDirectional.only(start: Sizes.paddingH16(context)),
          ),
          SizedBox(
            height: Sizes.marginV16(context),
          ),
          CustomButton(
            text: tr(context).back,
            height: Sizes.buttonHeight46(context),
            width: Sizes.buttonWidth240(context),
            onPressed: () {
              NavigationService.goBack(context);
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../../core/presentation/styles/font_styles.dart';
import '../../../../../core/presentation/styles/sizes.dart';
import '../../../../../core/presentation/widgets/custom_text.dart';
import '../../../domain/order.dart';

class OrderDetailsDialog extends StatelessWidget {
  const OrderDetailsDialog({
    required this.order,
    super.key,
  });
  final AppOrder order;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minWidth: Sizes.dialogWidth280,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                height: Sizes.imageR100,
                width: Sizes.imageR100,
                child: QrImageView(
                  data: order.id,
                  // ignore: deprecated_member_use
                  foregroundColor: Theme.of(context).colorScheme.secondary,
                  padding: EdgeInsets.zero,
                ),
              ),
              const SizedBox(
                width: Sizes.marginH12,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText.f16(
                      context,
                      '${tr(context).orderDetails}:',
                      underline: true,
                      weight: FontStyles.fontWeightSemiBold,
                    ),
                    const SizedBox(
                      height: Sizes.marginV8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText.f16(
                          context,
                          '${tr(context).id}:',
                        ),
                        Flexible(
                          child: CustomText.f16(
                            context,
                            '#${order.id.substring(0, 6)}',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText.f16(
                          context,
                          '${tr(context).status}:',
                        ),
                        Flexible(
                          child: CustomText.f16(
                            context,
                            order.pickupOption.name,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText.f16(
                          context,
                          '${tr(context).payment}:',
                        ),
                        Flexible(
                          child: CustomText.f16(
                            context,
                            order.paymentMethod,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: Sizes.marginV8,
          ),
          CustomText.f18(
            context,
            '${tr(context).userDetails}:',
            underline: true,
            weight: FontStyles.fontWeightSemiBold,
          ),
          const SizedBox(
            height: Sizes.marginV2,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: Sizes.paddingH14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText.f16(
                  context,
                  order.userName.isEmpty
                      ? tr(context).user + order.userId.substring(0, 6)
                      : order.userName,
                ),
                CustomText.f16(
                  context,
                  '${order.address!.state}, ${order.address!.city}, ${order.address!.street}',
                ),
                CustomText.f16(
                  context,
                  order.address!.mobile,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: Sizes.marginV8,
          ),
          CustomText.f18(
            context,
            '${tr(context).note}:',
            underline: true,
            weight: FontStyles.fontWeightSemiBold,
          ),
          const SizedBox(
            height: Sizes.marginV2,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: Sizes.paddingH14),
            child: CustomText.f16(
              context,
              order.userNote.isEmpty ? tr(context).none : order.userNote,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:qr_flutter/qr_flutter.dart';

import '../../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../../core/presentation/styles/styles.dart';
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
                height: 100,
                width: 100,
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
                    Text(
                      '${tr(context).orderDetails}:',
                      style: TextStyles.f16SemiBold(context)
                          .copyWith(decoration: TextDecoration.underline),
                    ),
                    const SizedBox(
                      height: Sizes.marginV8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${tr(context).id}:',
                          style: TextStyles.f16(context),
                        ),
                        Flexible(
                          child: Text(
                            '#${order.id.substring(0, 6)}',
                            style: TextStyles.f16(context),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${tr(context).status}:',
                          style: TextStyles.f16(context),
                        ),
                        Flexible(
                          child: Text(
                            order.pickupOption.name,
                            style: TextStyles.f16(context),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${tr(context).payment}:',
                          style: TextStyles.f16(context),
                        ),
                        Flexible(
                          child: Text(
                            order.paymentMethod,
                            style: TextStyles.f16(context),
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
          Text(
            '${tr(context).userDetails}:',
            style: TextStyles.f18SemiBold(context).copyWith(decoration: TextDecoration.underline),
          ),
          const SizedBox(
            height: Sizes.marginV2,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: Sizes.paddingH14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  order.userName.isEmpty
                      ? tr(context).user + order.userId.substring(0, 6)
                      : order.userName,
                  style: TextStyles.f16(context),
                ),
                Text(
                  '${order.address!.state}, ${order.address!.city}, ${order.address!.street}',
                  style: TextStyles.f16(context),
                ),
                Text(
                  order.address!.mobile,
                  style: TextStyles.f16(context),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: Sizes.marginV8,
          ),
          Text(
            '${tr(context).note}:',
            style: TextStyles.f18SemiBold(context).copyWith(decoration: TextDecoration.underline),
          ),
          const SizedBox(
            height: Sizes.marginV2,
          ),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: Sizes.paddingH14),
            child: Text(
              order.userNote.isEmpty ? tr(context).none : order.userNote,
              style: TextStyles.f16(context),
            ),
          ),
        ],
      ),
    );
  }
}

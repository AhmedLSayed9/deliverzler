import 'package:flutter/material.dart';

import '../../../../core/presentation/helpers/date_helper.dart';
import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/styles/font_styles.dart';
import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/widgets/custom_text.dart';
import '../../domain/order.dart';
import '../../domain/value_objects.dart';

class CardOrderDetailsComponent extends StatelessWidget {

  const CardOrderDetailsComponent({
    required this.order,
    super.key,
  });
  final AppOrder order;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: Directionality.of(context) == TextDirection.rtl
              ? CrossAxisAlignment.baseline
              : CrossAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Container(
              height: Sizes.icon8,
              width: Sizes.icon8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: order.deliveryStatus == DeliveryStatus.upcoming
                    ? Colors.green
                    : Colors.blue,
              ),
            ),
            const SizedBox(
              width: Sizes.marginH4,
            ),
            Expanded(
              child: CustomText.f12(
                context,
                order.deliveryStatus == DeliveryStatus.upcoming
                    ? tr(context).orderUpcoming
                    : tr(context).orderOnTheWay,
                weight: FontStyles.fontWeightExtraBold,
                color: order.deliveryStatus == DeliveryStatus.upcoming
                    ? Colors.green
                    : Colors.blue,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        CustomText.f12(
          context,
          DateHelper.convertEpochToLocal(context, order.date),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

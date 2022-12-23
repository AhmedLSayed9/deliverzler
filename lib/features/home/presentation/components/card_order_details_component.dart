import 'package:deliverzler/core/presentation/helpers/date_helper.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/features/home/domain/entities/order.dart';
import 'package:deliverzler/features/home/presentation/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';

class CardOrderDetailsComponent extends StatelessWidget {
  final AppOrder order;

  const CardOrderDetailsComponent({
    required this.order,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: Directionality.of(context) == TextDirection.rtl
              ? CrossAxisAlignment.baseline
              : CrossAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Container(
              height: Sizes.icon8(context),
              width: Sizes.icon8(context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: order.deliveryStatus == DeliveryStatus.upcoming
                    ? Colors.green
                    : Colors.blue,
              ),
            ),
            SizedBox(
              width: Sizes.marginH4(context),
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

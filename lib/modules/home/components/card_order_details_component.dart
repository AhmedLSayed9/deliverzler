import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/modules/home/utils/enums.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/services/date_parser.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/modules/home/models/order_model.dart';

class CardOrderDetailsComponent extends StatelessWidget {
  final OrderModel orderModel;

  const CardOrderDetailsComponent({
    required this.orderModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: LocalizationService.instance.isAr(context)
              ? CrossAxisAlignment.baseline
              : CrossAxisAlignment.center,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Container(
              height: Sizes.statusCircleRadius(context),
              width: Sizes.statusCircleRadius(context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: orderModel.orderDeliveryStatus ==
                        describeEnum(OrderDeliveryStatus.upcoming)
                    ? Colors.green
                    : Colors.blue,
              ),
            ),
            SizedBox(
              width: Sizes.hMarginTiny(context),
            ),
            Expanded(
              child: CustomText.h6(
                context,
                orderModel.orderDeliveryStatus ==
                        describeEnum(OrderDeliveryStatus.upcoming)
                    ? tr(context).orderUpcoming
                    : tr(context).orderOnTheWay,
                weight: FontStyles.fontWeightExtraBold,
                color: orderModel.orderDeliveryStatus ==
                        describeEnum(OrderDeliveryStatus.upcoming)
                    ? Colors.green
                    : Colors.blue,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        CustomText.h6(
          context,
          DateParser.instance.convertEpochToLocal(orderModel.date),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}

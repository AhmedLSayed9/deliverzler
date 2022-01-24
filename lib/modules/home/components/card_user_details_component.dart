import 'package:deliverzler/core/localization/app_localization.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/cached_network_image_circular.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/modules/home/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';

class CardUserDetailsComponent extends StatelessWidget {
  final OrderModel orderModel;

  const CardUserDetailsComponent({
    required this.orderModel,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedNetworkImageCircular(
          imageUrl: orderModel.userImage,
          radius: Sizes.userImageSmallRadius,
        ),
        SizedBox(
          width: Sizes.hMarginSmallest,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.h5(
                context,
                orderModel.userName.isEmpty
                    ? tr('user') + orderModel.userId.substring(0, 6)
                    : orderModel.userName,
                color: context.textTheme.headline4!.color,
                weight: FontStyles.fontWeightBold,
                overflow: TextOverflow.ellipsis,
              ),
              CustomText.h6(
                context,
                orderModel.addressModel!.state +
                    ', ' +
                    orderModel.addressModel!.city +
                    ', ' +
                    orderModel.addressModel!.street,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              CustomText.h6(
                context,
                orderModel.addressModel!.mobile,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

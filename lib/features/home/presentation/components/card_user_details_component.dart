import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/cached_network_image_circular.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';
import 'package:deliverzler/features/home/domain/entities/order.dart';
import 'package:flutter/material.dart';

class CardUserDetailsComponent extends StatelessWidget {
  final Order order;

  const CardUserDetailsComponent({
    required this.order,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CachedNetworkImageCircular(
          imageUrl: order.userImage,
          radius: Sizes.imageRadius30(context),
        ),
        SizedBox(
          width: Sizes.marginH10(context),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText.f14(
                context,
                order.userName.isEmpty
                    ? tr(context).user + order.userId.substring(0, 6)
                    : order.userName,
                weight: FontStyles.fontWeightBold,
                overflow: TextOverflow.ellipsis,
              ),
              CustomText.f12(
                context,
                '${order.address!.state}, ${order.address!.city}, ${order.address!.street}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              CustomText.f12(
                context,
                order.address!.mobile,
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

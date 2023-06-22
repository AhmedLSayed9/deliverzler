import 'package:flutter/material.dart';

import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/styles/font_styles.dart';
import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/widgets/cached_network_image_circular.dart';
import '../../../../core/presentation/widgets/custom_text.dart';
import '../../domain/order.dart';

class CardUserDetailsComponent extends StatelessWidget {

  const CardUserDetailsComponent({
    required this.order,
    super.key,
  });
  final AppOrder order;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CachedNetworkImageCircular(
          imageUrl: order.userImage,
          radius: Sizes.imageR28,
        ),
        const SizedBox(
          width: Sizes.marginH8,
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

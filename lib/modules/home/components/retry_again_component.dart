import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_button.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/modules/home/viewmodels/location_service_provider/location_service_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class RetryAgainComponent extends ConsumerWidget {
  final String description;

  const RetryAgainComponent({
    required this.description,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.screenHPaddingMedium(context),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomText.h3(
            context,
            description,
            weight: FontStyles.fontWeightSemiBold,
            alignment: Alignment.center,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Sizes.vMarginMedium(context),
          ),
          CustomButton(
            text: tr(context).retry,
            onPressed:
                ref.watch(locationServiceProvider.notifier).getCurrentLocation,
            buttonColor: AppColors.lightThemePrimary,
          ),
        ],
      ),
    );
  }
}

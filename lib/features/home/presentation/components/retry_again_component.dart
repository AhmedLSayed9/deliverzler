import 'package:flutter/material.dart';

import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/styles/font_styles.dart';
import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/widgets/custom_button.dart';
import '../../../../core/presentation/widgets/custom_text.dart';

class RetryAgainComponent extends StatelessWidget {
  final String description;
  final VoidCallback onPressed;

  const RetryAgainComponent({
    required this.description,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.screenMarginH28,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          CustomText.f18(
            context,
            description,
            weight: FontStyles.fontWeightSemiBold,
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: Sizes.marginV20,
          ),
          CustomButton(
            text: tr(context).retry,
            onPressed: onPressed,
            buttonColor: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}

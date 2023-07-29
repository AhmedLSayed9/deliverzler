import 'package:flutter/material.dart';

import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/widgets/custom_elevated_button.dart';

class RetryAgainComponent extends StatelessWidget {
  const RetryAgainComponent({
    required this.description,
    required this.onPressed,
    super.key,
  });
  final String description;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.screenPaddingH28,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            description,
            style: TextStyles.f18SemiBold(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: Sizes.marginV20,
          ),
          CustomElevatedButton(
            onPressed: onPressed,
            buttonColor: Theme.of(context).colorScheme.primary,
            child: Text(
              tr(context).retry,
              style: TextStyles.coloredElevatedButton(context),
            ),
          ),
        ],
      ),
    );
  }
}

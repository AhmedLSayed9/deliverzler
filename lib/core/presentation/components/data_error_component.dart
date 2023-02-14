import 'package:flutter/material.dart';

import '../helpers/localization_helper.dart';
import '../styles/sizes.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text.dart';
import '../widgets/loading_indicators.dart';

class DataErrorComponent extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPressed;

  const DataErrorComponent({
    required this.title,
    required this.description,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SmallLoadingAnimation(),
        const SizedBox(
          height: Sizes.marginV32,
        ),
        CustomText.f20(
          context,
          title,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: Sizes.marginV12,
        ),
        CustomText.f14(
          context,
          description,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: Sizes.marginV32,
        ),
        CustomButton(
          text: tr(context).retry,
          onPressed: onPressed,
          buttonColor: Theme.of(context).colorScheme.primary,
        ),
      ],
    );
  }
}

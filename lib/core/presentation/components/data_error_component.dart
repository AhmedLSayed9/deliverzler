import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/widgets/loading_indicators.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_button.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';

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

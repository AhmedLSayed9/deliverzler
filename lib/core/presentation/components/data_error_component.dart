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
        LoadingIndicators.smallLoadingAnimation(context),
        SizedBox(
          height: Sizes.marginV30(context),
        ),
        CustomText.f24(
          context,
          title,
          alignment: Alignment.center,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: Sizes.marginV10(context),
        ),
        CustomText.f14(
          context,
          description,
          alignment: Alignment.center,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: Sizes.marginV30(context),
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

import 'package:flutter/material.dart';

import '../../../../core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/widgets/custom_text_button.dart';

class CardDetailsButtonComponent extends StatelessWidget {
  const CardDetailsButtonComponent({
    required this.title,
    required this.onPressed,
    super.key,
  });
  final String title;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      onPressed: onPressed,
      buttonColor: Theme.of(context).colorScheme.secondary,
      elevation: 2,
      child: Text(
        title,
        style: TextStyles.f14(context).copyWith(
          color: customColors(context).whiteColor,
          fontWeight: FontStyles.fontWeightSemiBold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

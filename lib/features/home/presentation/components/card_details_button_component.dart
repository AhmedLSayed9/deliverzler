import 'package:flutter/material.dart';

import '../../../../core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import '../../../../core/presentation/styles/font_styles.dart';
import '../../../../core/presentation/widgets/custom_text.dart';
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
      child: CustomText.f14(
        context,
        title,
        weight: FontStyles.fontWeightSemiBold,
        color: customColors(context).whiteColor,
      ),
    );
  }
}

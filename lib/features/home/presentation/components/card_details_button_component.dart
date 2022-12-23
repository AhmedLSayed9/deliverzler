import 'package:flutter/material.dart';

import '../../../../core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import '../../../../core/presentation/styles/font_styles.dart';
import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/widgets/custom_text.dart';
import '../../../../core/presentation/widgets/custom_text_button.dart';

class CardDetailsButtonComponent extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const CardDetailsButtonComponent({
    required this.title,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomTextButton(
      elevation: 1,
      minWidth: Sizes.buttonWidth60,
      minHeight: Sizes.buttonHeight32,
      buttonColor: Theme.of(context).colorScheme.secondary,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: onPressed,
      child: CustomText.f14(
        context,
        title,
        weight: FontStyles.fontWeightSemiBold,
        color: customColors(context).whiteColor,
        //alignment: Alignment.center,
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import '../../../../core/presentation/styles/font_styles.dart';
import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/widgets/custom_outlined_button.dart';
import '../../../../core/presentation/widgets/custom_text.dart';

class CardButtonComponent extends StatelessWidget {
  const CardButtonComponent({
    required this.title,
    required this.isColored,
    required this.onPressed,
    super.key,
  });
  final String title;
  final bool isColored;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      padding: const EdgeInsets.symmetric(
        vertical: Sizes.buttonPaddingV12,
        horizontal: Sizes.buttonPaddingH34,
      ),
      constraints: const BoxConstraints(
        minWidth: Sizes.buttonWidth136,
      ),
      side: isColored ? null : BorderSide(color: customColors(context).greyColor!),
      enableGradient: isColored,
      onPressed: onPressed,
      child: CustomText.f14(
        context,
        title,
        color: isColored ? customColors(context).whiteColor : null,
        weight: FontStyles.fontWeightSemiBold,
        textAlign: TextAlign.center,
      ),
    );
  }
}

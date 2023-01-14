import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

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

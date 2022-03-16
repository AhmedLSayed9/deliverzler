import 'package:flutter/material.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_outlined_button.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';

class CardButtonComponent extends StatelessWidget {
  final String title;
  final bool isColored;
  final VoidCallback? onPressed;

  const CardButtonComponent({
    required this.title,
    required this.isColored,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomOutlinedButton(
      height: Sizes.roundedButtonMediumHeight(context),
      width: Sizes.roundedButtonMediumWidth(context),
      child: CustomText.h5(
        context,
        title,
        color: isColored ? AppColors.white : Theme.of(context).textTheme.headline4!.color,
        weight: FontStyles.fontWeightBold,
        alignment: Alignment.center,
      ),
      side: isColored ? null : const BorderSide(color: AppColors.grey),
      buttonColor: isColored ? null : Colors.transparent,
      splashColor: isColored ? null : AppColors.primaryColor,
      onPressed: onPressed,
    );
  }
}

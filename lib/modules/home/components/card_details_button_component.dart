import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/core/widgets/custom_text_button.dart';
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
      child: CustomText.h5(
        context,
        title,
        color: AppColors.white,
        alignment: Alignment.center,
      ),
      elevation: 1,
      minWidth: Sizes.textButtonMinWidth(context),
      minHeight: Sizes.textButtonMinHeight(context),
      buttonColor: AppColors.secondaryColor,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      onPressed: onPressed,
    );
  }
}

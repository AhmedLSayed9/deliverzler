import 'package:deliverzler/core/services/platform_service.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class TitledTextFieldItem extends StatelessWidget {
  final String title;
  final String hint;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final bool isLastTextField;

  const TitledTextFieldItem({
    required this.title,
    required this.hint,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    required this.validator,
    this.keyboardType,
    this.isLastTextField = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (PlatformService.instance.isMaterialApp())
          CustomText.h4(
            context,
            title,
            color: Theme.of(context).textTheme.headline5!.color,
            padding:
                EdgeInsetsDirectional.only(start: Sizes.hPaddingTiny(context)),
            margin: EdgeInsets.only(bottom: Sizes.vPaddingSmallest(context)),
          ),
        CustomTextField(
          context,
          controller: controller,
          validator: validator,
          textInputAction:
              isLastTextField ? TextInputAction.done : TextInputAction.next,
          keyboardType: keyboardType,
          prefix: prefixIcon,
          cupertinoPrefix: Row(
            children: [
              SizedBox(
                width: Sizes.cTextFieldTitleWidthDefault(context),
                child: CustomText.h4(
                  context,
                  title,
                  weight: FontStyles.fontWeightMedium,
                  padding: EdgeInsetsDirectional.only(
                      end: Sizes.hPaddingTiny(context)),
                ),
              ),
              if (prefixIcon != null) prefixIcon!,
            ],
          ),
          suffixIcon: suffixIcon,
          hintText: hint,
          key: ValueKey(title),
        ),
      ],
    );
  }
}

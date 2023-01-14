import 'package:deliverzler/core/presentation/helpers/platform_helper.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class TitledTextFieldItem extends StatelessWidget {
  final String title;
  final String hint;
  final Widget? prefix;
  final Widget? suffix;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final bool isLastTextField;

  const TitledTextFieldItem({
    required this.title,
    required this.hint,
    this.prefix,
    this.suffix,
    this.controller,
    required this.validator,
    this.keyboardType,
    this.isLastTextField = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (PlatformHelper.isMaterialApp())
          Padding(
            padding: const EdgeInsetsDirectional.only(
              start: Sizes.paddingH4,
              bottom: Sizes.paddingV8,
            ),
            child: CustomText.f16(
              context,
              title,
            ),
          ),
        CustomTextFormField(
          controller: controller,
          validator: validator,
          textInputAction:
              isLastTextField ? TextInputAction.done : TextInputAction.next,
          keyboardType: keyboardType,
          materialPrefix: prefix,
          cupertinoPrefix: Row(
            children: [
              SizedBox(
                width: Sizes.textFieldPrefixWidth144,
                child: CustomText.f18(
                  context,
                  title,
                  weight: FontStyles.fontWeightSemiBold,
                ),
              ),
              const SizedBox(
                width: Sizes.marginH6,
              ),
              if (prefix != null) prefix!,
            ],
          ),
          suffix: suffix,
          hintText: hint,
          key: ValueKey(title),
        ),
      ],
    );
  }
}

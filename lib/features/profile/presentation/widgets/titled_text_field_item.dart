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
      children: [
        if (PlatformHelper.isMaterialApp())
          CustomText.f18(
            context,
            title,
            padding:
                EdgeInsetsDirectional.only(start: Sizes.paddingH6(context)),
            margin: EdgeInsets.only(bottom: Sizes.paddingV10(context)),
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
                width: Sizes.textFieldPrefixWidth148(context),
                child: CustomText.f18(
                  context,
                  title,
                  weight: FontStyles.fontWeightSemiBold,
                  padding:
                      EdgeInsetsDirectional.only(end: Sizes.paddingH6(context)),
                ),
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

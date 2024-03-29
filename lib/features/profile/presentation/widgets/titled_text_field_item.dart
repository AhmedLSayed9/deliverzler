import 'package:flutter/material.dart';

import '../../../../core/presentation/styles/styles.dart';

class TitledTextFieldItem extends StatelessWidget {
  const TitledTextFieldItem({
    required this.controller,
    required this.title,
    required this.hintText,
    required this.validator,
    this.textInputAction = TextInputAction.next,
    this.keyboardType,
    super.key,
  });

  final String title;
  final TextEditingController? controller;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.only(
            start: Sizes.paddingH4,
            bottom: Sizes.paddingV8,
          ),
          child: Text(
            title,
            style: TextStyles.f16(context),
          ),
        ),
        TextFormField(
          key: ValueKey(title),
          controller: controller,
          decoration: InputDecoration(hintText: hintText),
          validator: validator,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}

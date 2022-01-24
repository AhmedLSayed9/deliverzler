import 'package:deliverzler/core/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/core/widgets/custom_text_field.dart';

class ProfileTextFieldComponent extends StatelessWidget {
  final String title;
  final String hint;
  final String? initialValue;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final TextInputType? keyboardType;
  final bool isLastTextField;

  const ProfileTextFieldComponent({
    required this.title,
    required this.hint,
    this.initialValue,
    this.controller,
    required this.validator,
    this.onSaved,
    this.keyboardType,
    this.isLastTextField = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText.h4(
          context,
          title,
          color: context.textTheme.headline5!.color,
          padding: AppLocalizations.instance.isAr()
              ? EdgeInsets.only(right: Sizes.hPaddingTiny)
              : EdgeInsets.only(left: Sizes.hPaddingTiny),
        ),
        SizedBox(
          height: Sizes.vPaddingSmallest,
        ),
        CustomTextField(
          controller: controller,
          validationColor: AppColors.primaryColor,
          textInputAction:
              isLastTextField ? TextInputAction.done : TextInputAction.next,
          keyboardType: keyboardType,
          initialValue: initialValue,
          validator: validator,
          onSaved: onSaved,
          margin: EdgeInsets.only(
            bottom: Sizes.textFieldVMarginMedium,
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: Sizes.textFieldVPaddingMedium,
            horizontal: Sizes.textFieldHPaddingMedium,
          ),
          fillColor: Colors.transparent,
          hintText: hint,
          key: ValueKey(title),
        ),
      ],
    );
  }
}

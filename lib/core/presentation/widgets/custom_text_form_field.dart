import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../helpers/platform_helper.dart';
import '../styles/font_styles.dart';
import '../styles/sizes.dart';
import 'platform_widgets/platform_text_form_field.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.initialValue,
    this.controller,
    this.validator,
    this.onFieldSubmitted,
    this.inputFormatters,
    this.keyboardType,
    this.textInputAction,
    this.obscureText,
    this.enabled,
    this.contentPadding,
    this.hintText,
    this.materialPrefix,
    this.cupertinoPrefix,
    this.suffix,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.errorMaxLines,
  });

  final String? initialValue;
  final TextEditingController? controller;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool? obscureText;
  final bool? enabled;
  final EdgeInsets? contentPadding;
  final String? hintText;
  final Widget? materialPrefix;
  final Widget? cupertinoPrefix;
  final Widget? suffix;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final int? errorMaxLines;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PlatformTextFormField(
          initialValue: initialValue,
          controller: controller,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
          inputFormatters: inputFormatters,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          obscureText: obscureText,
          enabled: enabled,
          maxLength: maxLength,
          maxLines: minLines,
          minLines: minLines,
          style: TextStyle(
            color: Theme.of(context).textTheme.titleMedium?.color,
            fontSize: Sizes.font14,
            fontFamily: FontStyles.fontFamily(context),
          ),
          cursorColor: Theme.of(context).textSelectionTheme.cursorColor,
          materialData: MaterialTextFormFieldData(
            decoration: InputDecoration(
              isDense: true,
              contentPadding: contentPadding ??
                  const EdgeInsets.symmetric(
                    vertical: Sizes.textFieldPaddingV14,
                    horizontal: Sizes.textFieldPaddingH14,
                  ),
              filled: true,
              fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: Sizes.font12,
                fontFamily: FontStyles.fontFamily(context),
                color: Theme.of(context).hintColor,
              ),
              prefixIcon: materialPrefix,
              prefixIconColor: Theme.of(context).inputDecorationTheme.prefixIconColor,
              prefixIconConstraints: const BoxConstraints(),
              suffixIcon: suffix != null
                  ? Padding(
                      padding: const EdgeInsetsDirectional.only(
                        end: Sizes.paddingH14,
                      ),
                      child: suffix,
                    )
                  : null,
              suffixIconColor: Theme.of(context).inputDecorationTheme.suffixIconColor,
              suffixIconConstraints: const BoxConstraints(),
              errorStyle: TextStyle(
                color: Theme.of(context).inputDecorationTheme.errorStyle?.color,
                fontWeight: FontStyles.fontWeightNormal,
                fontSize: Sizes.font12,
                fontFamily: FontStyles.fontFamily(context),
              ),
              errorMaxLines: errorMaxLines,
              border: Theme.of(context).inputDecorationTheme.border,
              enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
              focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
              errorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
              focusedErrorBorder: Theme.of(context).inputDecorationTheme.errorBorder,
            ),
          ),
          cupertinoData: CupertinoFormRowData(
            padding: contentPadding ??
                EdgeInsetsDirectional.only(
                  top: Sizes.textFieldPaddingV10,
                  bottom: Sizes.textFieldPaddingV10,
                  end: suffix != null ? Sizes.textFieldPaddingH38 : 0.0,
                ),
            placeHolder: hintText,
            placeholderStyle: TextStyle(
              fontSize: Sizes.font12,
              fontFamily: FontStyles.fontFamily(context),
              color: Theme.of(context).hintColor,
            ),
            prefix: cupertinoPrefix,
          ),
        ),
        //Add suffix manually for iOS https://github.com/flutter/flutter/issues/103385
        if (suffix != null && !PlatformHelper.isMaterialApp())
          PositionedDirectional(
            top: (contentPadding?.top ?? Sizes.textFieldPaddingV10) * 1.5,
            end: Sizes.paddingH14,
            child: suffix!,
          ),
      ],
    );
  }
}

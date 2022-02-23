import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/services/init_services/localization_service.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends Container {
  CustomTextField({
    Key? formFieldKey,
    double? height,
    Widget? prefix,
    TextEditingController? controller,
    Color? fillColor,
    Color? hintTextColor,
    double? borderRadiusSize,
    String? hintText,
    Widget? suffixIcon,
    Color? textColor,
    Color? validationColor,
    double? validationFontSize,
    FontWeight? validationFontWeight,
    bool readonly = false,
    String? initialValue,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    TextDirection? textDirection,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    FormFieldSetter<String>? onSaved,
    bool? enabled,
    Color? cursorColor,
    ValueChanged<String>? onFieldSubmitted,
    bool obscureText = false,
    FocusNode? focusNode,
    // InputDecoration? inputDecoration,
    EdgeInsetsGeometry? padding,
    EdgeInsetsGeometry? margin,
    bool autoFocus = false,
    int? maxLength,
    int? maxLines = 1,
    int? minLines = 1,
    bool expands = false,
    EdgeInsets? contentPadding,
    List<TextInputFormatter>? inputFormatters,
    Key? key,
  }) : super(
          key: key,
          height: height,
          margin: margin,
          padding: padding,
          child: Column(
            children: [
              TextFormField(
                maxLength: maxLength,
                readOnly: readonly,
                autofocus: autoFocus,
                controller: controller,
                initialValue: initialValue,
                maxLines: maxLines,
                minLines: minLines,
                expands: expands,
                keyboardType: keyboardType,
                textInputAction: textInputAction,
                style: TextStyle(
                  color: textColor,
                  fontFamily: FontStyles.fontFamily,
                ),
                textDirection: textDirection,
                validator: validator,
                inputFormatters: inputFormatters,
                onChanged: onChanged,
                onSaved: onSaved,
                enabled: enabled,
                focusNode: focusNode,
                cursorColor: cursorColor,
                onFieldSubmitted: onFieldSubmitted,
                obscureText: obscureText,
                key: formFieldKey,
                decoration: //inputDecoration ??
                    InputDecoration(
                  prefixIcon: prefix,
                  errorStyle: TextStyle(
                    color: validationColor ?? const Color(0xffff0000),
                    fontWeight:
                        validationFontWeight ?? FontStyles.fontWeightNormal,
                    fontSize: validationFontSize ?? Sizes.fontSizes["h5"],
                    fontFamily: FontStyles.fontFamily,
                  ),
                  fillColor: fillColor,
                  filled: true,
                  contentPadding: contentPadding ??
                      (LocalizationService.instance
                              .isAr(NavigationService.context)
                          ? EdgeInsets.only(
                              right: Sizes.textFieldHPaddingMedium,
                            )
                          : EdgeInsets.only(
                              left: Sizes.textFieldHPaddingMedium,
                            )),
                  suffixIcon: suffixIcon != null
                      ? Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: Sizes.hPaddingSmallest,
                            vertical: Sizes.vPaddingSmallest,
                          ),
                          child: suffixIcon,
                        )
                      : null,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Sizes.textFieldDefaultRadius),
                    ),
                    borderSide: const BorderSide(
                      color: AppColors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Sizes.textFieldDefaultRadius),
                    ),
                    borderSide: const BorderSide(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Sizes.textFieldDefaultRadius),
                    ),
                    borderSide: BorderSide(
                      color: Colors.grey.shade400,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Sizes.textFieldDefaultRadius),
                    ),
                    borderSide: BorderSide(
                      color: validationColor ?? const Color(0xffff0000),
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(Sizes.textFieldDefaultRadius),
                    ),
                    borderSide: BorderSide(
                      color: validationColor ?? const Color(0xffff0000),
                    ),
                  ),
                  hintText: hintText,
                  hintStyle: TextStyle(
                    fontFamily: FontStyles.fontFamily,
                    fontSize: Sizes.fontSizes['h5'],
                    fontWeight: FontStyles.fontWeightBold,
                    color: hintTextColor,
                  ),
                ),
              ),
            ],
          ),
        );
}

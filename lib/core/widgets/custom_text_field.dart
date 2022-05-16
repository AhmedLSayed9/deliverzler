import 'package:deliverzler/core/services/platform_service.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/platform_widgets/platform_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends Container {
  CustomTextField(
    BuildContext context, {
    Key? formFieldKey,
    double? height,
    Widget? prefix,
    Widget? cupertinoPrefix,
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
          margin: PlatformService.instance.isMaterialApp()
              ? margin ??
                  EdgeInsets.only(
                    bottom: Sizes.textFieldVMarginDefault(context),
                  )
              : null,
          padding: padding,
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  PlatformTextFormField(
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
                      color: textColor ??
                          Theme.of(context).textTheme.subtitle1?.color,
                      fontSize: Sizes.fontSizes(context)['h4'],
                      fontFamily: FontStyles.fontFamily(context),
                    ),
                    hintText: hintText,
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
                    material: (_, __) {
                      return MaterialTextFormFieldData(
                        textDirection: textDirection,
                        decoration: InputDecoration(
                          prefixIcon: prefix,
                          prefixIconColor: Theme.of(context)
                              .inputDecorationTheme
                              .prefixIconColor,
                          prefixIconConstraints: const BoxConstraints(
                            minHeight: 0,
                            minWidth: 0,
                          ),
                          errorStyle: TextStyle(
                            color: validationColor ??
                                Theme.of(context)
                                    .inputDecorationTheme
                                    .errorStyle
                                    ?.color,
                            fontWeight: validationFontWeight ??
                                FontStyles.fontWeightNormal,
                            fontSize: validationFontSize ??
                                Sizes.fontSizes(context)["h5"],
                            fontFamily: FontStyles.fontFamily(context),
                          ),
                          fillColor: fillColor ??
                              Theme.of(context).inputDecorationTheme.fillColor,
                          filled: true,
                          contentPadding: contentPadding ??
                              EdgeInsets.symmetric(
                                vertical:
                                    Sizes.textFieldVPaddingDefault(context),
                                horizontal:
                                    Sizes.textFieldHPaddingDefault(context),
                              ),
                          suffixIcon: suffixIcon != null
                              ? Padding(
                                  padding: EdgeInsetsDirectional.only(
                                    end: Sizes.hPaddingSmall(context),
                                  ),
                                  child: suffixIcon,
                                )
                              : null,
                          suffixIconColor: Theme.of(context)
                              .inputDecorationTheme
                              .suffixIconColor,
                          suffixIconConstraints: const BoxConstraints(
                            minHeight: 0,
                            minWidth: 0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  Sizes.textFieldDefaultRadius(context)),
                            ),
                            borderSide: Theme.of(context)
                                .inputDecorationTheme
                                .border!
                                .borderSide,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  Sizes.textFieldDefaultRadius(context)),
                            ),
                            borderSide: Theme.of(context)
                                .inputDecorationTheme
                                .enabledBorder!
                                .borderSide,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  Sizes.textFieldDefaultRadius(context)),
                            ),
                            borderSide: Theme.of(context)
                                .inputDecorationTheme
                                .focusedBorder!
                                .borderSide,
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  Sizes.textFieldDefaultRadius(context)),
                            ),
                            borderSide: Theme.of(context)
                                .inputDecorationTheme
                                .errorBorder!
                                .borderSide,
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                  Sizes.textFieldDefaultRadius(context)),
                            ),
                            borderSide: Theme.of(context)
                                .inputDecorationTheme
                                .errorBorder!
                                .borderSide,
                          ),
                          hintStyle: TextStyle(
                            fontSize: Sizes.fontSizes(context)['h5'],
                            fontWeight: FontStyles.fontWeightBold,
                            fontFamily: FontStyles.fontFamily(context),
                            color: hintTextColor ?? Theme.of(context).hintColor,
                          ),
                        ),
                      );
                    },
                    cupertino: (_, __) {
                      return CupertinoTextFormFieldData(
                        textDirection: textDirection,
                        prefix: cupertinoPrefix,
                        placeholderStyle: TextStyle(
                          fontSize: Sizes.fontSizes(context)['h5'],
                          fontWeight: FontStyles.fontWeightBold,
                          fontFamily: FontStyles.fontFamily(context),
                          color: hintTextColor ?? Theme.of(context).hintColor,
                        ),
                        padding: contentPadding ??
                            EdgeInsetsDirectional.only(
                              top: Sizes.cTextFieldVPaddingDefault(context),
                              bottom: Sizes.cTextFieldVPaddingDefault(context),
                              end: suffixIcon != null
                                  ? Sizes.hPaddingHighest(context)
                                  : 0.0,
                            ),
                        cursorColor:
                            Theme.of(context).textSelectionTheme.cursorColor,
                      );
                    },
                  ),
                  if (suffixIcon != null &&
                      !PlatformService.instance.isMaterialApp())
                    PositionedDirectional(
                      end: Sizes.hPaddingSmall(context),
                      child: suffixIcon is Icon
                          ? Icon(
                              suffixIcon.icon,
                              color: Theme.of(context)
                                  .inputDecorationTheme
                                  .suffixIconColor,
                              semanticLabel: suffixIcon.semanticLabel,
                            )
                          : suffixIcon,
                    ),
                ],
              ),
            ],
          ),
        );
}

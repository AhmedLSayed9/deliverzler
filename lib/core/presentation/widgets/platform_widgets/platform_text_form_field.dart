import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'platform_base_widget.dart';

class PlatformTextFormField
    extends PlatformBaseWidget<TextFormField, CupertinoFormRow> {
  const PlatformTextFormField({
    super.key,
    this.widgetKey,
    this.initialValue,
    this.controller,
    this.validator,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.inputFormatters,
    this.keyboardType,
    this.textInputAction,
    this.textDirection,
    this.obscureText,
    this.enabled,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.style,
    this.cursorColor,
    this.materialData,
    this.cupertinoData,
  });

  final Key? widgetKey;
  final String? initialValue;
  final TextEditingController? controller;
  final FormFieldValidator<String?>? validator;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback? onTap;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String?>? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextDirection? textDirection;
  final bool? obscureText;
  final bool? enabled;
  final int? maxLength;
  final int? maxLines;
  final int? minLines;
  final TextStyle? style;
  final Color? cursorColor;
  final MaterialTextFormFieldData? materialData;
  final CupertinoFormRowData? cupertinoData;

  @override
  TextFormField createMaterialWidget(BuildContext context) {
    return TextFormField(
      key: widgetKey,
      initialValue: initialValue,
      controller: controller,
      validator: validator,
      onChanged: onChanged,
      onTap: onTap,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onSaved: onSaved,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      textDirection: textDirection,
      obscureText: obscureText ?? false,
      enabled: enabled,
      maxLength: maxLength,
      maxLines: maxLines ?? 1,
      minLines: minLines,
      style: style,
      cursorColor: cursorColor,
      decoration: materialData?.decoration,
    );
  }

  @override
  CupertinoFormRow createCupertinoWidget(BuildContext context) {
    return CupertinoFormRow(
      child: CupertinoTextFormFieldRow(
        key: widgetKey,
        initialValue: initialValue,
        controller: controller,
        validator: validator,
        onChanged: onChanged,
        onTap: onTap,
        onEditingComplete: onEditingComplete,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        inputFormatters: inputFormatters,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        textDirection: textDirection,
        obscureText: obscureText ?? false,
        enabled: enabled,
        maxLength: maxLength,
        maxLines: maxLines ?? 1,
        minLines: minLines,
        style: style,
        cursorColor: cursorColor,
        padding: cupertinoData?.padding,
        placeholder: cupertinoData?.placeHolder,
        placeholderStyle: cupertinoData?.placeholderStyle,
        prefix: cupertinoData?.prefix,
      ),
    );
  }
}

class MaterialTextFormFieldData {
  const MaterialTextFormFieldData({
    this.decoration,
  });

  final InputDecoration? decoration;
}

class CupertinoFormRowData {
  const CupertinoFormRowData({
    this.padding,
    this.placeHolder,
    this.placeholderStyle,
    this.prefix,
  });

  final EdgeInsetsGeometry? padding;
  final String? placeHolder;
  final TextStyle? placeholderStyle;
  final Widget? prefix;
}

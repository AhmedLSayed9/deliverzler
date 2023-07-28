// ignore_for_file: inference_failure_on_untyped_parameter, argument_type_not_assignable
// TODO(Ahmed): Fix this ignore.

import 'package:flutter/material.dart';

import '../../core_features/theme/presentation/utils/colors/custom_colors.dart';
import '../styles/font_styles.dart';
import '../styles/sizes.dart';

class CustomText extends Text {
  CustomText._(
    BuildContext context,
    super.text, {
    super.key,
    double? size,
    color,
    weight,
    height,
    bool underline = false,
    super.strutStyle,
    super.textAlign,
    super.textDirection,
    super.locale,
    super.softWrap,
    super.overflow,
    super.textScaleFactor,
    super.maxLines,
    super.semanticsLabel,
    super.textWidthBasis,
    super.textHeightBehavior,
  }) : super(
          style: TextStyle(
            color: color,
            height: height,
            fontSize: size,
            fontWeight: weight,
            decoration: underline ? TextDecoration.underline : null,
          ),
        );

  CustomText.f28(
    BuildContext context,
    String text, {
    Key? key,
    Color? color,
    FontWeight? weight,
    TextAlign? textAlign,
    double? height,
    int? maxLines,
  }) : this._(
          context,
          text,
          key: key,
          maxLines: maxLines,
          size: Sizes.font28,
          height: height,
          color: color ?? customColors(context).font28Color,
          weight: weight ?? FontStyles.fontWeightBlack,
          textAlign: textAlign,
        );

  CustomText.f20(
    BuildContext context,
    String text, {
    Key? key,
    Color? color,
    FontWeight? weight,
    TextAlign? textAlign,
    double? height,
    int? maxLines,
    dynamic overflow,
  }) : this._(
          context,
          text,
          key: key,
          size: Sizes.font20,
          color: color ?? customColors(context).font20Color,
          weight: weight ?? FontStyles.fontWeightBlack,
          textAlign: textAlign,
          height: height,
          maxLines: maxLines,
          overflow: overflow,
        );

  CustomText.f18(
    BuildContext context,
    String text, {
    Key? key,
    Color? color,
    FontWeight? weight,
    TextAlign? textAlign,
    double? height,
    bool underline = false,
    dynamic overflow,
    int? maxLines,
  }) : this._(
          context,
          text,
          key: key,
          size: Sizes.font18,
          color: color ?? customColors(context).font18Color,
          weight: weight,
          height: height,
          textAlign: textAlign,
          underline: underline,
          maxLines: maxLines,
          overflow: overflow,
        );

  CustomText.f16(
    BuildContext context,
    String text, {
    Key? key,
    Color? color,
    FontWeight? weight,
    TextAlign? textAlign,
    double? height,
    bool underline = false,
    dynamic overflow,
    int? maxLines,
  }) : this._(
          context,
          text,
          key: key,
          size: Sizes.font16,
          color: color ?? customColors(context).font16Color,
          weight: weight,
          height: height,
          textAlign: textAlign,
          underline: underline,
          maxLines: maxLines,
          overflow: overflow,
        );

  CustomText.f14(
    BuildContext context,
    String text, {
    Key? key,
    Color? color,
    FontWeight? weight,
    TextAlign? textAlign,
    double? height,
    dynamic overflow,
    int? maxLines,
  }) : this._(
          context,
          text,
          key: key,
          maxLines: maxLines,
          size: Sizes.font14,
          height: height,
          color: color ?? customColors(context).font14Color,
          weight: weight,
          overflow: overflow,
          textAlign: textAlign,
        );

  CustomText.f12(
    BuildContext context,
    String text, {
    Key? key,
    Color? color,
    FontWeight? weight,
    TextAlign? textAlign,
    dynamic overflow,
    double? height,
    int? maxLines,
  }) : this._(
          context,
          text,
          key: key,
          maxLines: maxLines,
          size: Sizes.font12,
          height: height,
          overflow: overflow,
          color: color ?? customColors(context).font12Color,
          weight: weight,
          textAlign: textAlign,
        );
}

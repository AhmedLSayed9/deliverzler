import 'package:flutter/material.dart';

import '../../core_features/theme/presentation/utils/colors/custom_colors.dart';
import '../styles/font_styles.dart';
import '../styles/sizes.dart';

class CustomText extends Text {
  CustomText._(
    BuildContext context,
    String text, {
    Key? key,
    double? size,
    color,
    weight,
    bool underline = false,
    strutStyle,
    textAlign,
    textDirection,
    locale,
    softWrap,
    overflow,
    textScaleFactor,
    maxLines,
    semanticsLabel,
    textWidthBasis,
    height,
    textHeightBehavior,
  }) : super(
          key: key,
          text,
          style: TextStyle(
            color: color,
            height: height,
            fontSize: size,
            fontWeight: weight,
            decoration: underline ? TextDecoration.underline : null,
            fontFamily: FontStyles.fontFamily(context),
          ),
          strutStyle: strutStyle,
          textAlign: textAlign,
          textDirection: textDirection,
          locale: locale,
          softWrap: softWrap,
          overflow: overflow,
          textScaleFactor: textScaleFactor,
          maxLines: maxLines,
          semanticsLabel: semanticsLabel,
          textWidthBasis: textWidthBasis,
          textHeightBehavior: textHeightBehavior,
        );

  CustomText.f28(
    BuildContext context,
    String text, {
    Key? key,
    Color? color,
    FontWeight? weight,
    bool? underline,
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

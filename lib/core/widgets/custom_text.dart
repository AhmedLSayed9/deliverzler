import 'package:deliverzler/core/services/init_services/localization_service.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';

class CustomText extends Container {
  CustomText(
    String text, {
    Key? key,
    double? size,
    color,
    weight,
    width,
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
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    Alignment? alignment,
  }) : super(
            key: key,
            margin: margin,
            padding: padding,
            alignment: alignment ??
                (LocalizationService.instance.isAr()
                    ? Alignment.topRight
                    : Alignment.topLeft),
            width: width,
            child: Text(
              text,
              style: TextStyle(
                color: color,
                height: height,
                fontSize: size,
                fontWeight: weight,
                decoration: underline ? TextDecoration.underline : null,
                fontFamily: FontStyles.fontFamily,
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
            ));

  CustomText.h1(
    //Don't use Get.theme because it is immutable, so theme change won't work.
    BuildContext context,
    String text, {
    Key? key,
    Color? color,
    FontWeight? weight,
    bool? underline,
    TextAlign? textAlign,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? height,
    int? maxLines,
    Alignment? alignment,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          size: Sizes.fontSizes['h1'],
          padding: padding,
          margin: margin,
          height: height,
          color: color ?? Theme.of(context).textTheme.headline1!.color,
          weight: weight ?? FontStyles.fontWeightBlack,
          textAlign: textAlign,
          alignment: alignment,
        );

  CustomText.h2(
    BuildContext context,
    String text, {
    Key? key,
    Color? color,
    FontWeight? weight,
    TextAlign? textAlign,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? height,
    bool underline = false,
    int? maxLines,
    dynamic overflow,
    Alignment? alignment,
  }) : this(
          text,
          key: key,
          padding: padding,
          margin: margin,
          size: Sizes.fontSizes['h2'],
          color: color ?? Theme.of(context).textTheme.headline2!.color,
          weight: weight ?? FontStyles.fontWeightBlack,
          textAlign: textAlign,
          height: height,
          underline: underline,
          maxLines: maxLines,
          overflow: overflow,
          alignment: alignment,
        );

  CustomText.h3(
    BuildContext context,
    String text, {
    Key? key,
    Color? color,
    FontWeight? weight,
    TextAlign? textAlign,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? height,
    bool underline = false,
    dynamic overflow,
    int? maxLines,
    Alignment? alignment,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          size: Sizes.fontSizes['h3'],
          padding: padding,
          margin: margin,
          height: height,
          color: color ?? Theme.of(context).textTheme.headline3!.color,
          weight: weight,
          textAlign: textAlign,
          underline: underline,
          overflow: overflow,
          alignment: alignment,
        );

  CustomText.h4(
    BuildContext context,
    String text, {
    Key? key,
    Color? color,
    FontWeight? weight,
    TextAlign? textAlign,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? height,
    bool underline = false,
    dynamic overflow,
    int? maxLines,
    Alignment? alignment,
  }) : this(
          text,
          key: key,
          padding: padding,
          margin: margin,
          size: Sizes.fontSizes['h4'],
          color: color ?? Theme.of(context).textTheme.headline4!.color,
          weight: weight,
          height: height,
          textAlign: textAlign,
          underline: underline,
          maxLines: maxLines,
          overflow: overflow,
          alignment: alignment,
        );

  CustomText.h5(
    BuildContext context,
    String text, {
    Key? key,
    Color? color,
    FontWeight? weight,
    TextAlign? textAlign,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? height,
    dynamic overflow,
    int? maxLines,
    Alignment? alignment,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          size: Sizes.fontSizes['h5'],
          padding: padding,
          margin: margin,
          height: height,
          color: color ?? Theme.of(context).textTheme.headline5!.color,
          weight: weight,
          overflow: overflow,
          textAlign: textAlign,
          alignment: alignment,
        );

  CustomText.h6(
    BuildContext context,
    String text, {
    Key? key,
    Color? color,
    FontWeight? weight,
    TextAlign? textAlign,
    dynamic overflow,
    EdgeInsetsGeometry? margin,
    EdgeInsetsGeometry? padding,
    double? height,
    int? maxLines,
    Alignment? alignment,
  }) : this(
          text,
          key: key,
          maxLines: maxLines,
          size: Sizes.fontSizes['h6'],
          padding: padding,
          margin: margin,
          height: height,
          overflow: overflow,
          color: color ?? Theme.of(context).textTheme.headline6!.color,
          weight: weight,
          textAlign: textAlign,
          alignment: alignment,
        );
}

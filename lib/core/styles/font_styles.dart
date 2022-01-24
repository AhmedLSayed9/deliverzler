import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:deliverzler/core/localization/app_localization.dart';
import 'package:deliverzler/core/styles/sizes.dart';

class FontStyles {
  static get fontFamily => tr('fontFamily');

  static const fontWeightBlack = FontWeight.w900;
  static const fontWeightExtraBold = FontWeight.w800;
  static const fontWeightBold = FontWeight.bold;
  static const fontWeightSemiBold = FontWeight.w600;
  static const fontWeightMedium = FontWeight.w500;
  static const fontWeightNormal = FontWeight.normal;
  static const fontWeightLight = FontWeight.w300;
  static const fontWeightExtraLight = FontWeight.w200;
  static const fontWeightThin = FontWeight.w100;
  static const fontStyleNormal = FontStyle.normal;

  static get mapSearchBarFontStyle => TextStyle(
        fontSize: Sizes.fontSizes['h4'],
        color: Get.context!.textTheme.subtitle1!.color,
        fontFamily: fontFamily,
        fontWeight: fontWeightNormal,
        fontStyle: fontStyleNormal,
      );
}

import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';

class FontStyles {
  static String fontFamily(BuildContext context) => tr(context).fontFamily;

  static const fontWeightBlack = FontWeight.w900;
  static const fontWeightExtraBold = FontWeight.w800;
  static const fontWeightBold = FontWeight.w700;
  static const fontWeightSemiBold = FontWeight.w600;
  static const fontWeightMedium = FontWeight.w500;
  static const fontWeightNormal = FontWeight.w400;
  static const fontWeightLight = FontWeight.w300;
  static const fontWeightExtraLight = FontWeight.w200;
  static const fontWeightThin = FontWeight.w100;

  static mapSearchBarFontStyle(BuildContext context) => TextStyle(
        fontSize: Sizes.font16,
        color: Theme.of(context).textTheme.subtitle1!.color,
        fontFamily: fontFamily(context),
        fontWeight: fontWeightNormal,
      );
}

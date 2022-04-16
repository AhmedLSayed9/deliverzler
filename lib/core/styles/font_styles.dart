import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/styles/sizes.dart';

class FontStyles {
  static get fontFamily => tr(NavigationService.context).fontFamily;

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

  static mapSearchBarFontStyle(BuildContext context) => TextStyle(
        fontSize: Sizes.fontSizes(context)['h4'],
        color: Theme.of(context).textTheme.subtitle1!.color,
        fontFamily: fontFamily,
        fontWeight: fontWeightNormal,
        fontStyle: fontStyleNormal,
      );
}

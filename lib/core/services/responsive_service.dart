import 'dart:math';

import 'package:flutter/material.dart';

class ResponsiveService {
  static const Size _designSize = Size(414, 895);
  static const bool _splitScreenMode = false;

  //This make design responsive when orientation change & should be used with scrolling screens.
  static Size _switchableDesignSize(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? _designSize
        : const Size(895, 414);
  }

  static double screenWidth(BuildContext context, {double ratio = 1}) =>
      MediaQuery.of(context).size.width * ratio;

  static double screenHeight(BuildContext context, {double ratio = 1}) =>
      MediaQuery.of(context).size.height * ratio;

  static Orientation orientation(BuildContext context) =>
      MediaQuery.of(context).orientation;

  static double statusBarHeight(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  static double systemNavBarHeight(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;

  static double textScaleFactor(BuildContext context) =>
      MediaQuery.of(context).textScaleFactor;

  static double devicePixelRatio(BuildContext context) =>
      MediaQuery.of(context).devicePixelRatio;

  static double scaleWidth(BuildContext context) =>
      screenWidth(context) / _switchableDesignSize(context).width;

  static double scaleHeight(BuildContext context) =>
      (_splitScreenMode
          ? max(screenHeight(context), 700)
          : screenHeight(context)) /
      _switchableDesignSize(context).height;

  static double scaleRadius(BuildContext context) =>
      min(scaleWidth(context), scaleHeight(context));

  static double scaleText(BuildContext context) =>
      min(scaleWidth(context), scaleHeight(context));
}

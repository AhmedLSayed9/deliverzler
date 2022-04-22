import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

class ResponsiveService {
  static const Size _designSize = Size(428, 860);
  static const bool _splitScreenMode = false;

  //This make design responsive when orientation change & should be used with scrolling screens.
  static Size _switchableDesignSize(BuildContext context) {
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? _designSize
        : const Size(860, 428);
  }

  static double fullScreenHeight(BuildContext context, {double ratio = 1}) =>
      MediaQuery.of(context).size.height * ratio;

  static double fullScreenWidth(BuildContext context, {double ratio = 1}) =>
      MediaQuery.of(context).size.width * ratio;

  //Use MediaQueryData.fromWindow(window) instead of MediaQuery.of(context)
  //This fix 0.0 padding value when using SafeArea or using fixed Appbar with IndexedStack
  static double availableScreenHeight(BuildContext context,
          {double ratio = 1}) =>
      (MediaQuery.of(context).size.height -
          MediaQueryData.fromWindow(window).viewPadding.vertical) *
      ratio;

  static double availableScreenWidth(BuildContext context,
          {double ratio = 1}) =>
      (MediaQuery.of(context).size.width -
          MediaQueryData.fromWindow(window).viewPadding.horizontal) *
      ratio;

  static Orientation orientation(BuildContext context) =>
      MediaQuery.of(context).orientation;

  //padding: The parts of the display that are partially obscured by system UI
  //This Typically used to calculate the hardware display "notches" or the system status bar
  static double deviceTopPadding(BuildContext context) =>
      MediaQueryData.fromWindow(window).padding.top;

  //Note: This doesn't get Android's bottom system bar as flutter already ignoring it when getting screen size
  //see: https://stackoverflow.com/questions/52954549/get-width-and-height-of-the-device-in-flutter
  static double deviceBottomPadding(BuildContext context) =>
      MediaQueryData.fromWindow(window).padding.bottom;

  //viewPadding: Same as padding but it maintains its value when keyboard opens unlike padding drops to zero
  //This is useful to avoid shifting widgets down a little pixels when keyboard open
  static double deviceBottomViewPadding(BuildContext context) =>
      MediaQueryData.fromWindow(window).viewPadding.bottom;

  //viewInsets: The parts of the display that are completely obscured by system UI
  //This typically used to calculate device's keyboard height when it's visible
  static double deviceKeyboardHeight(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom;

  static double textScaleFactor(BuildContext context) =>
      MediaQuery.of(context).textScaleFactor;

  static double devicePixelRatio(BuildContext context) =>
      MediaQuery.of(context).devicePixelRatio;

  static double scaleWidth(BuildContext context) =>
      availableScreenWidth(context) / _switchableDesignSize(context).width;

  static double scaleHeight(BuildContext context) =>
      (_splitScreenMode
          ? max(availableScreenHeight(context), 700)
          : availableScreenHeight(context)) /
      _switchableDesignSize(context).height;

  static double scaleRadius(BuildContext context) =>
      min(scaleWidth(context), scaleHeight(context));

  static double scaleText(BuildContext context) =>
      min(scaleWidth(context), scaleHeight(context));
}

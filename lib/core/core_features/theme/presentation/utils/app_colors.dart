import 'package:flutter/material.dart';

import 'custom_colors.dart';

part 'app_colors_light.dart';
part 'app_colors_dark.dart';

abstract class AppColors {
  ///Main
  // The background color for major parts of the app (toolbars, tab bars, etc)
  Color get primaryColor;

  // The color displayed most frequently across your app’s screens and components.
  Color get primary;

  // An accent color used for less prominent components in the UI, such as
  // filter chips, while expanding the opportunity for color expression.
  Color get secondary;

  ///Screen
  Color get statusBarColor;
  Color get systemNavBarColor;
  Color get olderAndroidSystemNavBarColor;
  Color get appBarBGColor;
  Color get scaffoldBGColor;
  Color get navBarColor;
  Color get navBarIndicatorColor;

  ///TextField Theme
  Color get textFieldSubtitle1Color;
  Color get textFieldHintColor;
  Color get textFieldCursorColor;
  Color get textFieldFillColor;
  Color get textFieldPrefixIconColor;
  Color get textFieldSuffixIconColor;
  Color get textFieldBorderColor;
  Color get textFieldEnabledBorderColor;
  Color get textFieldFocusedBorderColor;
  Color get textFieldErrorBorderColor;
  Color get textFieldErrorStyleColor;

  ///Icon
  Color get iconColor;

  ///Button
  Color get buttonColor;
  Color get buttonDisabledColor;

  ///ToggleButton
  Color get toggleButtonBorderColor;
  Color get toggleButtonSelectedColor;
  Color get toggleButtonDisabledColor;

  ///Card Theme
  Color get cardBGColor;
  Color get cardShadowColor;

  ///Custom Colors
  CustomColors get customColors;
}

import 'package:flutter/material.dart';

import 'custom_colors.dart';

extension ThemeExtension on ThemeBase {
  // TODO(AHMED): useMaterial3
  ThemeData getThemeData(String fontFamily) {
    return mainTheme.copyWith(
      appBarTheme: appBarTheme,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      navigationBarTheme: navigationBarTheme,
      navigationRailTheme: navigationRailTheme,
      primaryColor: primaryColor,
      colorScheme: colorScheme,
      textTheme: textTheme.apply(fontFamily: fontFamily),
      primaryTextTheme: primaryTextTheme.apply(fontFamily: fontFamily),
      iconTheme: iconTheme,
      buttonTheme: buttonTheme,
      toggleButtonsTheme: toggleButtonsTheme,
      hintColor: hintColor,
      textSelectionTheme: textSelectionTheme,
      inputDecorationTheme: inputDecorationTheme,
      cardTheme: cardTheme,
      dialogTheme: dialogTheme,
      extensions: [
        this.customColors,
      ],
    );
  }
}

abstract interface class ThemeBase {
  ThemeData get mainTheme;

  AppColors get appColors;

  Color get primaryColor;

  ColorScheme get colorScheme;

  AppBarTheme get appBarTheme;

  Color get scaffoldBackgroundColor;

  NavigationBarThemeData get navigationBarTheme;

  NavigationRailThemeData get navigationRailTheme;

  TextTheme get textTheme;

  TextTheme get primaryTextTheme;

  Color get hintColor;

  TextSelectionThemeData get textSelectionTheme;

  InputDecorationTheme get inputDecorationTheme;

  IconThemeData get iconTheme;

  ButtonThemeData get buttonTheme;

  ToggleButtonsThemeData get toggleButtonsTheme;

  CardTheme get cardTheme;

  DialogTheme get dialogTheme;

  CustomColors get customColors;
}

abstract class AppColors {
  ///Main
  // The background color for major parts of the app (toolbars, tab bars, etc)
  //Color get primaryColor;
  Color get primaryColor;

  // The color displayed most frequently across your app’s screens and components.
  Color get primary;

  // An accent color used for less prominent components in the UI, such as
  // filter chips, while expanding the opportunity for color expression.
  Color get secondary;

  ///Screen
  Color get statusBarColor;
  Color get systemNavBarColor;
  Color get appBarBGColor;
  Color get scaffoldBGColor;
  Color get navBarColor;

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

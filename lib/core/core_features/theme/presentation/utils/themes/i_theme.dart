import 'package:flutter/material.dart';

import '../colors/custom_colors.dart';
import '../colors/i_app_colors.dart';

abstract class ITheme {
  abstract final ThemeData baseTheme;

  abstract final IAppColors appColors;

  abstract final Color primaryColor;

  abstract final ColorScheme colorScheme;

  abstract final AppBarTheme appBarTheme;

  abstract final Color scaffoldBackgroundColor;

  abstract final NavigationBarThemeData navigationBarTheme;

  abstract final NavigationRailThemeData navigationRailTheme;

  abstract final TextTheme textTheme;

  abstract final TextTheme primaryTextTheme;

  abstract final Color hintColor;

  abstract final TextSelectionThemeData textSelectionTheme;

  abstract final InputDecorationTheme inputDecorationTheme;

  abstract final IconThemeData iconTheme;

  abstract final ButtonThemeData buttonTheme;

  abstract final ToggleButtonsThemeData toggleButtonsTheme;

  abstract final CardTheme cardTheme;

  abstract final CustomColors customColors;
}

extension ThemeExtension on ITheme {
  //TODO(AHMED): useMaterial3
  ThemeData getThemeData(String fontFamily) {
    return baseTheme.copyWith(
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
      extensions: [
        this.customColors,
      ],
    );
  }
}

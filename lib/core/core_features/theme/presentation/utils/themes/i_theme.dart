import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/i_app_colors.dart';
import 'package:flutter/material.dart';

abstract class ITheme {
  abstract final ThemeData baseTheme;

  abstract final IAppColors appColors;

  abstract final Color primaryColor;

  abstract final ColorScheme colorScheme;

  abstract final AppBarTheme appBarTheme;

  abstract final Color scaffoldBackgroundColor;

  abstract final Color bottomAppBarColor;

  abstract final TextTheme textTheme;

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
  ThemeData getThemeData() {
    return baseTheme.copyWith(
      appBarTheme: appBarTheme,
      bottomAppBarColor: bottomAppBarColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      primaryColor: primaryColor,
      colorScheme: colorScheme,
      iconTheme: iconTheme,
      buttonTheme: buttonTheme,
      toggleButtonsTheme: toggleButtonsTheme,
      textTheme: textTheme,
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

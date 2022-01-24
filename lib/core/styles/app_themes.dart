import 'package:flutter/material.dart';
import 'package:deliverzler/core/styles/app_colors.dart';

class AppThemes {
  static final lightTheme = ThemeData.light().copyWith(
    primaryColor: AppColors.lightThemePrimaryColor,
    scaffoldBackgroundColor: AppColors.lightThemeScaffoldBGColor,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primaryColor,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: AppColors.lightThemeBigTextColor,
      ),
      headline2: TextStyle(
        color: AppColors.lightThemeBigTextColor,
      ),
      headline3: TextStyle(
        color: AppColors.lightThemeNormalTextColor,
      ),
      headline4: TextStyle(
        color: AppColors.lightThemeNormalTextColor,
      ),
      headline5: TextStyle(
        color: AppColors.lightThemeSmallTextColor,
      ),
      headline6: TextStyle(
        color: AppColors.lightThemeSmallTextColor,
      ),
      subtitle1: TextStyle(
        color: AppColors.lightThemeTextFieldTextColor,
      ),
    ),
    hintColor: AppColors.lightThemeTextFieldHintColor,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.lightThemeTextFieldCursorColor,
    ),
  );

  static final darkTheme = ThemeData.dark().copyWith(
    primaryColor: AppColors.darkThemePrimaryColor,
    scaffoldBackgroundColor: AppColors.darkThemeScaffoldBGColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColors.primaryColor,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: AppColors.darkThemeBigTextColor,
      ),
      headline2: TextStyle(
        color: AppColors.darkThemeBigTextColor,
      ),
      headline3: TextStyle(
        color: AppColors.darkThemeNormalTextColor,
      ),
      headline4: TextStyle(
        color: AppColors.darkThemeNormalTextColor,
      ),
      headline5: TextStyle(
        color: AppColors.darkThemeSmallTextColor,
      ),
      headline6: TextStyle(
        color: AppColors.darkThemeSmallTextColor,
      ),
      subtitle1: TextStyle(
        color: AppColors.darkThemeTextFieldTextColor,
      ),
    ),
    hintColor: AppColors.darkThemeTextFieldHintColor,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.darkThemeTextFieldCursorColor,
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:flutter/services.dart';

class DarkTheme {
  static final darkTheme = ThemeData.dark().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: AppColors.darkThemeStatusBarColor,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    primaryColor: AppColors.darkThemeMajorBGColor,
    scaffoldBackgroundColor: AppColors.darkThemeScaffoldBGColor,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColors.darkThemePrimary,
      secondary: AppColors.accentColor,
    ),
    iconTheme: const IconThemeData(color: AppColors.darkThemeIconColor),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.darkThemePrimary,
      disabledColor: AppColors.grey,
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
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColors.darkThemeTextFieldFillColor,
      prefixIconColor: AppColors.darkThemeTextFieldBorderColor,
      suffixIconColor: AppColors.darkThemeTextFieldBorderColor,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.darkThemeTextFieldBorderColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.darkThemeTextFieldBorderColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.darkThemeTextFieldFocusedBorderColor,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.darkThemeTextFieldErrorBorderColor,
        ),
      ),
      errorStyle: TextStyle(
        color: AppColors.darkThemeTextFieldValidationColor,
      ),
    ),
  );
}

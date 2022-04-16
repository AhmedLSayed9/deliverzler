import 'package:flutter/material.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:flutter/services.dart';

class LightTheme {
  static final lightTheme = ThemeData.light().copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        //For Android
        statusBarColor: AppColors.lightThemeStatusBarColor,
        // For apps with a dark background:
        // For Android (light icons)
        statusBarIconBrightness: Brightness.dark,
        // For iOS (light icons)
        statusBarBrightness: Brightness.light,
      ),
    ),
    scaffoldBackgroundColor: AppColors.lightThemeScaffoldBGColor,
    primaryColor: AppColors.lightThemeMajorBGColor,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.lightThemePrimary,
      secondary: AppColors.accentColor,
    ),
    iconTheme: const IconThemeData(color: AppColors.lightThemeIconColor),
    buttonTheme: const ButtonThemeData(
      buttonColor: AppColors.lightThemePrimary,
      disabledColor: AppColors.grey,
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
    inputDecorationTheme: const InputDecorationTheme(
      fillColor: AppColors.lightThemeTextFieldFillColor,
      prefixIconColor: AppColors.lightThemeTextFieldBorderColor,
      suffixIconColor: AppColors.lightThemeTextFieldBorderColor,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.lightThemeTextFieldBorderColor,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.lightThemeTextFieldBorderColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.lightThemeTextFieldFocusedBorderColor,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: AppColors.lightThemeTextFieldErrorBorderColor,
        ),
      ),
      errorStyle: TextStyle(
        color: AppColors.lightThemeTextFieldValidationColor,
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors/app_colors_light.dart';
import '../colors/custom_colors.dart';
import '../colors/i_app_colors.dart';
import 'i_theme.dart';

class ThemeLight implements ITheme {
  @override
  final ThemeData baseTheme = ThemeData.light();

  @override
  final IAppColors appColors = AppColorsLight();

  @override
  late final Color primaryColor = appColors.primaryColor;

  @override
  late final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: appColors.primary,
    secondary: appColors.secondary,
  );

  @override
  late final AppBarTheme appBarTheme = AppBarTheme(
    backgroundColor: appColors.appBarBGColor,
    systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
      //For Android
      statusBarColor: appColors.statusBarColor,
      systemNavigationBarColor: appColors.bottomNavBarColor,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
    elevation: 0,
  );

  @override
  late final Color scaffoldBackgroundColor = appColors.scaffoldBGColor;

  @override
  late final Color bottomAppBarColor = appColors.bottomNavBarColor;

  @override
  late final TextTheme textTheme = TextTheme(
    titleMedium: TextStyle(
      color: appColors.textFieldSubtitle1Color,
    ),
  );

  @override
  late final Color hintColor = appColors.textFieldHintColor;

  @override
  late final TextSelectionThemeData textSelectionTheme = TextSelectionThemeData(
    cursorColor: appColors.textFieldCursorColor,
  );

  @override
  late final InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    fillColor: appColors.textFieldFillColor,
    prefixIconColor: appColors.textFieldPrefixIconColor,
    suffixIconColor: appColors.textFieldSuffixIconColor,
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: appColors.textFieldBorderColor,
        width: 0.8,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: appColors.textFieldEnabledBorderColor,
        width: 0.8,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: appColors.textFieldFocusedBorderColor,
        width: 1.2,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: appColors.textFieldErrorBorderColor,
        width: 0.8,
      ),
    ),
    errorStyle: TextStyle(
      color: appColors.textFieldErrorStyleColor,
    ),
  );

  @override
  late final IconThemeData iconTheme =
      IconThemeData(color: appColors.iconColor);

  @override
  late final ButtonThemeData buttonTheme = ButtonThemeData(
    buttonColor: appColors.buttonColor,
    disabledColor: appColors.buttonDisabledColor,
  );

  @override
  late final ToggleButtonsThemeData toggleButtonsTheme = ToggleButtonsThemeData(
    borderColor: appColors.toggleButtonBorderColor,
    selectedColor: appColors.toggleButtonSelectedColor,
    disabledColor: appColors.toggleButtonDisabledColor,
  );

  @override
  late final CardTheme cardTheme = CardTheme(
    color: appColors.cardBGColor,
    shadowColor: appColors.cardShadowColor,
  );
  @override
  late final CustomColors customColors = CustomColors(
    font28Color: appColors.customFont28Color,
    font20Color: appColors.customFont20Color,
    font18Color: appColors.customFont18Color,
    font16Color: appColors.customFont16Color,
    font14Color: appColors.customFont14Color,
    font12Color: appColors.customFont12Color,
    whiteColor: appColors.customWhiteColor,
    blackColor: appColors.customBlackColor,
    redColor: appColors.customRedColor,
    greenColor: appColors.customGreenColor,
    greyColor: appColors.customGreyColor,
    marinerColor: appColors.customMarinerColor,
    loadingIndicatorColor: appColors.customLoadingIndicatorColor,
  );
}

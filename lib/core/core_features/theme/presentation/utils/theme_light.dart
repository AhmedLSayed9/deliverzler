// ignore_for_file: overridden_fields

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../presentation/styles/styles.dart';
import 'custom_colors.dart';
import 'theme_base.dart';

class ThemeLight implements ThemeBase {
  @override
  ThemeData get mainTheme => ThemeData.light();

  @override
  AppColors get appColors => AppColorsLight();

  @override
  Color get primaryColor => appColors.primaryColor;

  @override
  ColorScheme get colorScheme => const ColorScheme.light().copyWith(
        primary: appColors.primary,
        secondary: appColors.secondary,
      );

  @override
  AppBarTheme get appBarTheme => AppBarTheme(
        systemOverlayStyle: SystemUiOverlayStyle.dark.copyWith(
          //For Android
          statusBarColor: appColors.statusBarColor,
          systemNavigationBarColor: appColors.systemNavBarColor,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        backgroundColor: appColors.appBarBGColor,
        elevation: Sizes.appBarElevation,
      );

  @override
  Color get scaffoldBackgroundColor => appColors.scaffoldBGColor;

  @override
  NavigationBarThemeData get navigationBarTheme => NavigationBarThemeData(
        backgroundColor: appColors.navBarColor,
        surfaceTintColor: Colors.transparent,
        shadowColor: appColors.navBarColor,
        indicatorColor: appColors.secondary.withOpacity(0.24),
        labelTextStyle: MaterialStatePropertyAll(
          TextStyles.navigationLabel(appColors.customColors.font12Color!),
        ),
        elevation: Sizes.navBarElevation,
      );

  @override
  NavigationRailThemeData get navigationRailTheme => NavigationRailThemeData(
        backgroundColor: appColors.navBarColor,
        elevation: Sizes.navBarElevation,
      );

  @override
  TextTheme get textTheme => mainTheme.textTheme.copyWith(
        titleMedium: TextStyles.titleMedium(appColors.textFieldSubtitle1Color),
      );

  @override
  TextTheme get primaryTextTheme => mainTheme.primaryTextTheme;

  @override
  Color get hintColor => appColors.textFieldHintColor;

  @override
  TextSelectionThemeData get textSelectionTheme => TextSelectionThemeData(
        cursorColor: appColors.textFieldCursorColor,
      );

  @override
  InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
        contentPadding: Insets.inputDecorationContentPadding,
        isDense: true,
        filled: true,
        fillColor: appColors.textFieldFillColor,
        hintStyle: TextStyles.inputDecorationHint(appColors.textFieldHintColor),
        prefixIconColor: appColors.textFieldPrefixIconColor,
        suffixIconColor: appColors.textFieldSuffixIconColor,
        border: Borders.inputDecorationBorder(appColors.textFieldBorderColor),
        enabledBorder: Borders.inputDecorationBorder(appColors.textFieldEnabledBorderColor),
        focusedBorder: Borders.inputDecorationBorder(appColors.textFieldFocusedBorderColor, 1.2),
        errorBorder: Borders.inputDecorationBorder(appColors.textFieldErrorBorderColor),
        focusedErrorBorder: Borders.inputDecorationBorder(appColors.textFieldErrorBorderColor),
        errorStyle: TextStyles.inputDecorationError(appColors.textFieldErrorStyleColor),
      );

  @override
  IconThemeData get iconTheme => IconThemeData(color: appColors.iconColor);

  @override
  ButtonThemeData get buttonTheme => ButtonThemeData(
        buttonColor: appColors.buttonColor,
        disabledColor: appColors.buttonDisabledColor,
      );

  @override
  ToggleButtonsThemeData get toggleButtonsTheme => ToggleButtonsThemeData(
        borderColor: appColors.toggleButtonBorderColor,
        selectedColor: appColors.toggleButtonSelectedColor,
        disabledColor: appColors.toggleButtonDisabledColor,
      );

  @override
  CardTheme get cardTheme => CardTheme(
        color: appColors.cardBGColor,
        shadowColor: appColors.cardShadowColor,
      );

  @override
  DialogTheme get dialogTheme => DialogTheme(
        backgroundColor: appColors.scaffoldBGColor,
        titleTextStyle: TextStyles.dialogTitle(appColors.customColors.font18Color!),
        contentTextStyle: TextStyles.dialogContent(appColors.customColors.font16Color!),
      );

  @override
  CustomColors get customColors => appColors.customColors;
}

class AppColorsLight implements AppColors {
  @override
  Color get primaryColor => const Color(0xffffffff);
  @override
  Color get primary => const Color(0xFFC11718);
  @override
  Color get secondary => const Color(0xFF4b98db);

  @override
  Color get statusBarColor => Colors.transparent;
  @override
  Color get systemNavBarColor => Colors.transparent;
  @override
  Color get appBarBGColor => scaffoldBGColor;
  @override
  Color get scaffoldBGColor => const Color(0xFFFAFAFA);
  @override
  Color get navBarColor => const Color(0xFFEFEFEF);

  @override
  Color get textFieldSubtitle1Color => const Color(0xff333333);
  @override
  Color get textFieldHintColor => const Color(0xff9b9b9b);
  @override
  Color get textFieldCursorColor => const Color(0xff000000);
  @override
  Color get textFieldFillColor => scaffoldBGColor;
  @override
  Color get textFieldPrefixIconColor => const Color(0xFF9E9E9E);
  @override
  Color get textFieldSuffixIconColor => const Color(0xFF9E9E9E);
  @override
  Color get textFieldBorderColor => const Color(0xFF9E9E9E);
  @override
  Color get textFieldEnabledBorderColor => const Color(0xFF9E9E9E);
  @override
  Color get textFieldFocusedBorderColor => const Color(0xFFC11718);
  @override
  Color get textFieldErrorBorderColor => const Color(0xffff0000);
  @override
  Color get textFieldErrorStyleColor => const Color(0xffff0000);

  @override
  Color get iconColor => const Color(0xff000000);

  @override
  Color get buttonColor => const Color(0xFFC11718);
  @override
  Color get buttonDisabledColor => const Color(0xFF9E9E9E);

  @override
  Color get toggleButtonBorderColor => const Color(0xFFA9A9A9);
  @override
  Color get toggleButtonSelectedColor => const Color(0xFFA9A9A9);
  @override
  Color get toggleButtonDisabledColor => const Color(0xFFFAFAFA);

  @override
  Color get cardBGColor => const Color(0xFFFFFFFF);
  @override
  Color get cardShadowColor => const Color(0x8A000000);

  @override
  CustomColors get customColors => const CustomColors(
        font28Color: Color(0xff000000),
        font20Color: Color(0xff000000),
        font18Color: Color(0xff000000),
        font16Color: Color(0xff000000),
        font14Color: Color(0xff000000),
        font12Color: Color(0xFF858992),
        whiteColor: Color(0xffffffff),
        blackColor: Color(0xff000000),
        redColor: Color(0xFFF44336),
        greenColor: Color(0xFF2bbb2b),
        greyColor: Color(0xFF9E9E9E),
        marinerColor: Color(0xFF4268A1),
        loadingIndicatorColor: Color(0xFF193764),
      );
}

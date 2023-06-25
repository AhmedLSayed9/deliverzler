import 'package:flutter/material.dart';

import 'custom_colors.dart';
import 'i_app_colors.dart';

class AppColorsDark implements IAppColors {
  @override
  final Color primaryColor = const Color(0xff212327);
  @override
  final Color primary = const Color(0xFFC11718);
  @override
  final Color secondary = const Color(0xFF4b98db);

  @override
  late final Color appBarBGColor = scaffoldBGColor;
  @override
  final Color statusBarColor = const Color(0xFF303030);
  @override
  final Color scaffoldBGColor = const Color(0xFF303030);
  @override
  final Color bottomNavBarColor = const Color(0xFF515151);

  //in the custom
  final Color font40Color = const Color(0xfff0f0f0);

  @override
  final Color textFieldSubtitle1Color = const Color(0xfff0f0f0);
  @override
  final Color textFieldHintColor = const Color(0xff9b9b9b);
  @override
  final Color textFieldCursorColor = const Color(0xfff44336);
  @override
  late final Color textFieldFillColor = scaffoldBGColor;
  @override
  final Color textFieldPrefixIconColor = const Color(0xFF9E9E9E);
  @override
  final Color textFieldSuffixIconColor = const Color(0xFF9E9E9E);
  @override
  final Color textFieldBorderColor = const Color(0xFF9E9E9E);
  @override
  final Color textFieldEnabledBorderColor = const Color(0xFF9E9E9E);
  @override
  final Color textFieldFocusedBorderColor = const Color(0xFFC11718);
  @override
  final Color textFieldErrorBorderColor = const Color(0xffff0000);
  @override
  final Color textFieldErrorStyleColor = const Color(0xffff0000);

  @override
  final Color iconColor = const Color(0xfff0f0f0);

  @override
  final Color buttonColor = const Color(0xFFC11718);
  @override
  final Color buttonDisabledColor = const Color(0xFF9E9E9E);

  @override
  final Color toggleButtonBorderColor = const Color(0xFF858585);
  @override
  final Color toggleButtonSelectedColor = const Color(0xFF858585);
  @override
  final Color toggleButtonDisabledColor = const Color(0xFF303030);

  @override
  final Color cardBGColor = const Color(0xFF424242);
  @override
  final Color cardShadowColor = const Color(0x26000000);

  @override
  final CustomColors customColors = const CustomColors(
    font28Color: Color(0xfff0f0f0),
    font20Color: Color(0xfff0f0f0),
    font18Color: Color(0xfff0f0f0),
    font16Color: Color(0xfff0f0f0),
    font14Color: Color(0xffcccccc),
    font12Color: Color(0xffcccccc),
    whiteColor: Color(0xffffffff),
    blackColor: Color(0xff000000),
    redColor: Color(0xFFF44336),
    greenColor: Color(0xFF32cf32),
    greyColor: Color(0xFF9E9E9E),
    marinerColor: Color(0xFF9ab2d5),
    loadingIndicatorColor: Color(0xFF5286d3),
  );
}

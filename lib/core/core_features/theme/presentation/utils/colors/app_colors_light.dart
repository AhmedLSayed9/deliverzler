import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/i_app_colors.dart';
import 'package:flutter/material.dart';

class AppColorsLight implements IAppColors {
  @override
  final Color primaryColor = const Color(0xffffffff);
  @override
  final Color primary = const Color(0xFFC11718);
  @override
  final Color secondary = const Color(0xFF4b98db);

  @override
  late final Color appBarBGColor = scaffoldBGColor;
  @override
  final Color statusBarColor = const Color(0xFFFAFAFA);
  @override
  final Color scaffoldBGColor = const Color(0xFFFAFAFA);
  @override
  final Color bottomNavBarColor = const Color(0xFFEFEFEF);

  @override
  final Color textFieldSubtitle1Color = const Color(0xff333333);
  @override
  final Color textFieldHintColor = const Color(0xff9b9b9b);
  @override
  final Color textFieldCursorColor = const Color(0xff000000);
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
  final Color iconColor = const Color(0xff000000);

  @override
  final Color buttonColor = const Color(0xFFC11718);
  @override
  final Color buttonDisabledColor = const Color(0xFF9E9E9E);

  @override
  final Color toggleButtonBorderColor = const Color(0xFFA9A9A9);
  @override
  final Color toggleButtonSelectedColor = const Color(0xFFA9A9A9);
  @override
  final Color toggleButtonDisabledColor = const Color(0xFFFAFAFA);

  @override
  final Color cardBGColor = const Color(0xFFFFFFFF);
  @override
  final Color cardShadowColor = const Color(0x8A000000);

  @override
  final Color customFont40Color = const Color(0xff000000);
  @override
  final Color customFont32Color = const Color(0xff000000);
  @override
  final Color customFont24Color = const Color(0xff000000);
  @override
  final Color customFont20Color = const Color(0xff000000);
  @override
  final Color customFont17Color = const Color(0xff000000);
  @override
  final Color customFont14Color = const Color(0xff000000);
  @override
  final Color customFont12Color = const Color(0xFF858992);
  @override
  final Color customWhiteColor = const Color(0xffffffff);
  @override
  final Color customBlackColor = const Color(0xff000000);
  @override
  final Color customRedColor = const Color(0xFFF44336);
  @override
  final Color customGreenColor = const Color(0xFF2bbb2b);
  @override
  final Color customGreyColor = const Color(0xFF9E9E9E);
  @override
  final Color customMarinerColor = const Color(0xFF4268A1);
  @override
  final Color customLoadingIndicatorColor = const Color(0xFF193764);
}

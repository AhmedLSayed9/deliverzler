import 'package:deliverzler/core/presentation/services/responsive_service.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/extensions/responsive_extension.dart';
import 'package:deliverzler/core/presentation/services/locator_service.dart';

final _responsiveService = getIt<ResponsiveService>();

abstract class Sizes {
  static double fullScreenHeight(BuildContext context) =>
      _responsiveService.fullScreenHeight(context);

  static double fullScreenWidth(BuildContext context) =>
      _responsiveService.fullScreenWidth(context);

  static double availableScreenHeight(BuildContext context) =>
      _responsiveService.availableScreenHeight(context);

  static double availableScreenWidth(BuildContext context) =>
      _responsiveService.availableScreenWidth(context);

  static double get statusBarHeight => _responsiveService.deviceTopPadding;

  static double get homeIndicatorHeight =>
      _responsiveService.deviceBottomViewPadding;

  //Font Size
  static double font32(BuildContext context) => 32.sp(context);
  static double font24(BuildContext context) => 24.sp(context);
  static double font20(BuildContext context) => 20.sp(context);
  static double font18(BuildContext context) => 18.sp(context);
  static double font16(BuildContext context) => 16.sp(context);
  static double font14(BuildContext context) => 14.sp(context);
  static double font12(BuildContext context) => 12.sp(context);

  //Icon Size
  static double icon96(BuildContext context) => 96.r(context);
  static double icon70(BuildContext context) => 70.r(context);
  static double icon48(BuildContext context) => 48.r(context);
  static double icon32(BuildContext context) => 32.r(context);
  static double icon24(BuildContext context) => 24.r(context);
  static double icon18(BuildContext context) => 18.r(context);
  static double icon14(BuildContext context) => 14.r(context);
  static double icon8(BuildContext context) => 8.r(context);

  //Screen Padding
  static double screenPaddingV20(BuildContext context) => 20.h(context);
  static double screenPaddingV80(BuildContext context) => 80.h(context);
  static double screenPaddingH40(BuildContext context) => 40.w(context);
  static double screenPaddingH36(BuildContext context) => 36.w(context);

  //Widget Padding
  static double paddingV16(BuildContext context) => 16.h(context);
  static double paddingV10(BuildContext context) => 10.h(context);
  static double paddingV6(BuildContext context) => 6.h(context);
  static double paddingH40(BuildContext context) => 40.w(context);
  static double paddingH30(BuildContext context) => 30.w(context);
  static double paddingH22(BuildContext context) => 22.w(context);
  static double paddingH16(BuildContext context) => 16.w(context);
  static double paddingH10(BuildContext context) => 10.w(context);
  static double paddingH6(BuildContext context) => 6.w(context);

  //Widget Margin
  static double marginV50(BuildContext context) => 50.h(context);
  static double marginV40(BuildContext context) => 40.h(context);
  static double marginV30(BuildContext context) => 30.h(context);
  static double marginV22(BuildContext context) => 22.h(context);
  static double marginV16(BuildContext context) => 16.h(context);
  static double marginV10(BuildContext context) => 10.h(context);
  static double marginV8(BuildContext context) => 8.h(context);
  static double marginV6(BuildContext context) => 6.h(context);
  static double marginV4(BuildContext context) => 4.h(context);
  static double marginH30(BuildContext context) => 30.w(context);
  static double marginH22(BuildContext context) => 22.w(context);
  static double marginH16(BuildContext context) => 16.w(context);
  static double marginH10(BuildContext context) => 10.w(context);
  static double marginH8(BuildContext context) => 8.w(context);
  static double marginH6(BuildContext context) => 6.w(context);
  static double marginH4(BuildContext context) => 4.w(context);

  //Button
  static double buttonHeight50(BuildContext context) => 50.h(context);
  static double buttonHeight46(BuildContext context) => 46.h(context);
  static double buttonHeight40(BuildContext context) => 40.h(context);
  static double buttonHeight34(BuildContext context) => 34.h(context);
  static double buttonWidth300(BuildContext context) => 300.w(context);
  static double buttonWidth264(BuildContext context) => 264.w(context);
  static double buttonWidth240(BuildContext context) => 240.w(context);
  static double buttonWidth140(BuildContext context) => 140.w(context);
  static double buttonWidth116(BuildContext context) => 116.w(context);
  static double buttonWidth60(BuildContext context) => 60.w(context);
  static double buttonWidth44(BuildContext context) => 44.w(context);
  static double buttonRadius26(BuildContext context) => 26.r(context);

  //TextField
  static double textFieldRadius12(BuildContext context) => 12.r(context);
  static double textFieldPaddingV16(BuildContext context) => 16.h(context);
  static double textFieldPaddingV12(BuildContext context) => 12.h(context);
  static double textFieldPaddingH16(BuildContext context) => 16.w(context);
  static double textFieldMarginV24(BuildContext context) => 24.h(context);
  static double textFieldPrefixWidth148(BuildContext context) => 148.w(context);

  //Card
  static double cardRadius14(BuildContext context) => 14.r(context);
  static double cardPaddingV16(BuildContext context) => 16.h(context);
  static double cardPaddingH20(BuildContext context) => 20.w(context);

  //Dialog
  static double dialogRadius20(BuildContext context) => 20.r(context);
  static double dialogRadius6(BuildContext context) => 6.r(context);
  static double dialogPaddingV30(BuildContext context) => 30.h(context);
  static double dialogPaddingH20(BuildContext context) => 20.w(context);
  static double dialogPaddingH10(BuildContext context) => 10.w(context);
  static double dialogPaddingH4(BuildContext context) => 4.w(context);

  //Toast
  static double toastRadius20(BuildContext context) => 20.r(context);

  //Image
  static double imageRadius400(BuildContext context) => 400.r(context);
  static double imageRadius220(BuildContext context) => 220.r(context);
  static double imageRadius126(BuildContext context) => 126.r(context);
  static double imageRadius100(BuildContext context) => 100.r(context);
  static double imageRadius66(BuildContext context) => 66.r(context);
  static double imageRadius56(BuildContext context) => 56.r(context);
  static double imageRadius30(BuildContext context) => 30.r(context);

  //LoadingIndicator
  static double loadingIndicatorRadius150(BuildContext context) =>
      150.r(context);
  static double loadingIndicatorRadius90(BuildContext context) => 90.r(context);

  //AppBar
  static double appBarHeight(BuildContext context) => 60.h(context);
  static double appBarButtonRadius(BuildContext context) => 32.r(context);

  //Drawer
  static double drawerWidth(BuildContext context) => 250.w(context);
  static double drawerPaddingV(BuildContext context) => 90.h(context);
  static double drawerPaddingH(BuildContext context) => 30.w(context);

  //BottomNavigationBar
  static double bottomNavBarHeight(BuildContext context) => 64.h(context);
  static double bottomNavBarIconRadius(BuildContext context) => 24.r(context);

  ///Other Sizes
  //Map
  static double mapSearchBarHeight(BuildContext context) => 54.h(context);
  static double mapSearchBarRadius(BuildContext context) => 8.r(context);
  static double mapFABRadius(BuildContext context) => 60.r(context);
  static double mapFABBottom(BuildContext context) => 36.h(context);
  static double mapFABRight(BuildContext context) => 28.w(context);
  static double mapDirectionsInfoRadius(BuildContext context) => 20.r(context);
  static double mapDirectionsInfoTop(BuildContext context) => 116.h(context);
  static double mapConfirmButtonBottom(BuildContext context) => 42.h(context);
  static double mapConfirmButtonLeft(BuildContext context) => 40.w(context);
}

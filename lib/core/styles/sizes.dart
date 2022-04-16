import 'package:deliverzler/core/extensions/num_extensions.dart';
import 'package:deliverzler/core/services/responsive_service.dart';
import 'package:flutter/material.dart';

class Sizes {
  static screenHeight(BuildContext context) =>
      ResponsiveService.screenHeight(context);

  static screenWidth(BuildContext context) =>
      ResponsiveService.screenWidth(context);

  static statusBarHeight(BuildContext context) =>
      ResponsiveService.statusBarHeight(context);

  static systemNavBarHeight(BuildContext context) =>
      ResponsiveService.systemNavBarHeight(context);

  //Font sizes
  static fontSizes(BuildContext context) => {
        "h0": 40.0.sp(context),
        "h1": 32.0.sp(context),
        "h2": 24.0.sp(context),
        "h3": 20.0.sp(context),
        "h4": 17.0.sp(context),
        "h5": 14.0.sp(context),
        "h6": 12.0.sp(context),
      };

  //Icons sizes
  static iconsSizes(BuildContext context) => {
        "s1": 95.r(context),
        "s2": 70.r(context),
        "s3": 48.r(context),
        "s4": 32.r(context),
        "s5": 24.r(context),
        "s6": 19.r(context),
        "s7": 14.r(context),
      };

  //Screens Padding
  static screenVPaddingDefault(BuildContext context) => 20.h(context);
  static screenHPaddingDefault(BuildContext context) => 40.w(context);
  static screenVPaddingHigh(BuildContext context) => 80.h(context);
  static screenHPaddingMedium(BuildContext context) => 36.w(context);

  //Widgets Padding
  static vPaddingHighest(BuildContext context) => 40.h(context);
  static vPaddingHigh(BuildContext context) => 30.h(context);
  static vPaddingMedium(BuildContext context) => 22.h(context);
  static vPaddingSmall(BuildContext context) => 16.h(context);
  static vPaddingSmallest(BuildContext context) => 10.h(context);
  static vPaddingTiny(BuildContext context) => 5.h(context);
  static hPaddingHighest(BuildContext context) => 40.w(context);
  static hPaddingHigh(BuildContext context) => 30.w(context);
  static hPaddingMedium(BuildContext context) => 22.w(context);
  static hPaddingSmall(BuildContext context) => 16.w(context);
  static hPaddingSmallest(BuildContext context) => 10.w(context);
  static hPaddingTiny(BuildContext context) => 5.w(context);

  //Widgets Margin
  static vMarginExtreme(BuildContext context) => 80.h(context);
  static vMarginHighest(BuildContext context) => 40.h(context);
  static vMarginHigh(BuildContext context) => 30.h(context);
  static vMarginMedium(BuildContext context) => 22.h(context);
  static vMarginSmall(BuildContext context) => 16.h(context);
  static vMarginSmallest(BuildContext context) => 10.h(context);
  static vMarginComment(BuildContext context) => 8.h(context);
  static vMarginTiny(BuildContext context) => 5.h(context);
  static vMarginDot(BuildContext context) => 3.h(context);
  static hMarginExtreme(BuildContext context) => 70.w(context);
  static hMarginHighest(BuildContext context) => 40.w(context);
  static hMarginHigh(BuildContext context) => 30.w(context);
  static hMarginMedium(BuildContext context) => 22.w(context);
  static hMarginSmall(BuildContext context) => 16.w(context);
  static hMarginSmallest(BuildContext context) => 10.w(context);
  static hMarginComment(BuildContext context) => 8.w(context);
  static hMarginTiny(BuildContext context) => 5.w(context);
  static hMarginDot(BuildContext context) => 3.w(context);

  //Buttons
  static roundedButtonMinHeight(BuildContext context) => 40.h(context);
  static roundedButtonDefaultHeight(BuildContext context) => 50.h(context);
  static roundedButtonDefaultWidth(BuildContext context) => 300.w(context);
  static roundedButtonDefaultRadius(BuildContext context) => 26.r(context);
  static roundedButtonDialogHeight(BuildContext context) => 44.h(context);
  static roundedButtonDialogWidth(BuildContext context) => 240.w(context);
  static roundedButtonHighWidth(BuildContext context) => 260.w(context);
  static roundedButtonMediumHeight(BuildContext context) => 44.h(context);
  static roundedButtonMediumWidth(BuildContext context) => 140.w(context);
  static roundedButtonSmallWidth(BuildContext context) => 116.w(context);
  static textButtonMinWidth(BuildContext context) => 60.w(context);
  static textButtonMinHeight(BuildContext context) => 34.h(context);

  //TextFields
  static textFieldDefaultRadius(BuildContext context) => 12.r(context);
  static textFieldVMarginDefault(BuildContext context) => 24.h(context);
  static textFieldHPaddingDefault(BuildContext context) => 16.w(context);
  static textFieldVPaddingDefault(BuildContext context) => 16.h(context);
  static cTextFieldVPaddingDefault(BuildContext context) => 12.h(context);
  static cTextFieldTitleWidthDefault(BuildContext context) => 148.w(context);

  //Cards
  static cardVPadding(BuildContext context) => 16.h(context);
  static cardHRadius(BuildContext context) => 20.w(context);
  static cardRadius(BuildContext context) => 14.r(context);

  //Dialogs
  static dialogVPadding(BuildContext context) => 30.h(context);
  static dialogHPadding(BuildContext context) => 20.w(context);
  static dialogRadius(BuildContext context) => 24.r(context);
  static dialogHPaddingMedium(BuildContext context) => 10.w(context);
  static dialogHPaddingSmall(BuildContext context) => 4.w(context);
  static dialogSmallRadius(BuildContext context) => 6.r(context);

  //LoadingIndicators
  static loadingAnimationDefaultHeight(BuildContext context) => 150.h(context);
  static loadingAnimationDefaultWidth(BuildContext context) => 150.w(context);
  static loadingIndicatorDefaultHeight(BuildContext context) => 150.r(context);
  static loadingIndicatorDefaultWidth(BuildContext context) => 150.r(context);
  static loadingListViewDefaultHeight(BuildContext context) => 150.h(context);
  static loadingListViewDefaultWidth(BuildContext context) => 136.w(context);
  static loadingAnimationButton(BuildContext context) => 90.r(context);

  //Images
  static userImageSmallRadius(BuildContext context) => 30.r(context);
  static userImageMediumRadius(BuildContext context) => 56.r(context);
  static userImageHighRadius(BuildContext context) => 66.r(context);
  static statusCircleRadius(BuildContext context) => 8.r(context);
  static qrImageRadius(BuildContext context) => 100.r(context);
  static pickedImageMaxSize(BuildContext context) => 400.r(context);

  //Text
  static smallTextHeight(BuildContext context) => 1.4.h(context);

  //Map
  static mapSearchBarHeight(BuildContext context) => 54.h(context);
  static mapSearchBarTopMargin(BuildContext context) => 50.h(context);
  static mapSearchBarRadius(BuildContext context) => 8.r(context);
  static mapDirectionsInfoTop(BuildContext context) => 116.h(context);
  static mapDirectionsInfoRadius(BuildContext context) => 20.r(context);
  static mapConfirmButtonBottom(BuildContext context) => 42.h(context);
  static mapConfirmButtonLeft(BuildContext context) => 40.w(context);

  //AppBar & Drawer
  static appBarDefaultHeight(BuildContext context) => 60.h(context);
  static appBarStatusBarHeight(BuildContext context) => 24.h(context);
  static appBarBackButtonRadius(BuildContext context) => 32.r(context);
  static appBarMenuButtonRadius(BuildContext context) => 32.r(context);
  static mainDrawerWidth(BuildContext context) => 250.w(context);
  static mainDrawerHPadding(BuildContext context) => 30.w(context);
  static mainDrawerVPadding(BuildContext context) => 90.h(context);
  static appBarIconSize(BuildContext context) => 26.r(context);

  ///Core
  static toastRadius(BuildContext context) => 20.r(context);

  ///App Constants
  static screenTopShadowHeight(BuildContext context) => 400.h(context);
  static splashLogoSize(BuildContext context) => 220.r(context);
  static loginLogoSize(BuildContext context) => 126.r(context);
  static switchThemeButtonWidth(BuildContext context) => 44.w(context);
  static navBarIconRadius(BuildContext context) => 26.r(context);
  static cupertinoNavBarHeight(BuildContext context) => 58.h(context);
}

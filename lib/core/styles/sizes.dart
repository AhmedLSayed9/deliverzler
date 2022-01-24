import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sizes {
  static const designHeight = 895.0;
  static const designWidth = 414.0;
  static get screenHeight => ScreenUtil().screenHeight;
  static get screenWidth => ScreenUtil().screenWidth;

  //Font sizes
  static get fontSizes => {
        "h1": 32.0.sp,
        "h2": 24.0.sp,
        "h3": 20.0.sp,
        "h4": 17.0.sp,
        "h5": 14.0.sp,
        "h6": 12.0.sp,
      };

  //Icons sizes
  static get iconsSizes => {
        "s1": 95.r,
        "s2": 70.r,
        "s3": 48.r,
        "s4": 32.r,
        "s5": 24.r,
        "s6": 19.r,
        "s7": 14.r,
      };

  //Screens Padding
  static get screenVPaddingDefault => 20.h;
  static get screenHPaddingDefault => 40.w;
  static get screenVPaddingHigh => 80.h;
  static get screenHPaddingMedium => 36.w;

  //Widgets Padding
  static get vPaddingHighest => 40.h;
  static get vPaddingHigh => 30.h;
  static get vPaddingMedium => 22.h;
  static get vPaddingSmall => 16.h;
  static get vPaddingSmallest => 10.h;
  static get vPaddingTiny => 5.h;
  static get hPaddingHighest => 40.w;
  static get hPaddingHigh => 30.w;
  static get hPaddingMedium => 22.w;
  static get hPaddingSmall => 16.w;
  static get hPaddingSmallest => 10.w;
  static get hPaddingTiny => 5.w;

  //Widgets Margin
  static get vMarginExtreme => 80.h;
  static get vMarginHighest => 40.h;
  static get vMarginHigh => 30.h;
  static get vMarginMedium => 22.h;
  static get vMarginSmall => 16.h;
  static get vMarginSmallest => 10.h;
  static get vMarginComment => 8.h;
  static get vMarginTiny => 5.h;
  static get vMarginDot => 3.h;
  static get hMarginExtreme => 70.w;
  static get hMarginHighest => 40.w;
  static get hMarginHigh => 30.w;
  static get hMarginMedium => 22.w;
  static get hMarginSmall => 16.w;
  static get hMarginSmallest => 10.w;
  static get hMarginComment => 8.w;
  static get hMarginTiny => 5.w;
  static get hMarginDot => 3.w;

  //Buttons
  static get roundedButtonMinHeight => 40.h;
  static get roundedButtonDefaultHeight => 50.h;
  static get roundedButtonDefaultWidth => 300.w;
  static get roundedButtonDefaultRadius => 26.r;
  static get roundedButtonDialogHeight => 44.h;
  static get roundedButtonDialogWidth => 240.w;
  static get roundedButtonHighWidth => 260.w;
  static get roundedButtonMediumHeight => 44.h;
  static get roundedButtonMediumWidth => 140.w;
  static get roundedButtonSmallWidth => 116.w;
  static get textButtonMinWidth => 60.w;
  static get textButtonMinHeight => 34.h;

  //TextFields
  static get textFieldDefaultRadius => 12.r;
  static get textFieldVMarginMedium => 24.h;
  static get textFieldHPaddingMedium => 16.w;
  static get textFieldVPaddingMedium => 16.h;

  //Cards
  static get cardVPadding => 16.h;
  static get cardHRadius => 20.w;
  static get cardRadius => 14.r;

  //Dialogs
  static get dialogVPadding => 30.h;
  static get dialogHPadding => 20.w;
  static get dialogRadius => 24.r;
  static get dialogHPaddingMedium => 10.w;
  static get dialogHPaddingSmall => 4.w;
  static get dialogSmallRadius => 6.r;

  //LoadingIndicators
  static get loadingAnimationDefaultHeight => 150.h;
  static get loadingAnimationDefaultWidth => 150.w;
  static get loadingIndicatorDefaultHeight => 150.r;
  static get loadingIndicatorDefaultWidth => 150.r;
  static get loadingListViewDefaultHeight => 150.h;
  static get loadingListViewDefaultWidth => 136.w;
  static get loadingAnimationButton => 90.r;

  //Images
  static get userImageSmallRadius => 30.r;
  static get userImageMediumRadius => 56.r;
  static get userImageHighRadius => 66.r;
  static get statusCircleRadius => 8.r;
  static get qrImageRadius => 100.r;
  static get pickedImageMaxSize => 400.r;

  //Text
  static get smallTextHeight => 1.4.h;

  //Map
  static get mapSearchBarHeight => 54.h;
  static get mapSearchBarTopMargin => 50.h;
  static get mapSearchBarRadius => 8.r;
  static get mapDirectionsInfoTop => 116.h;
  static get mapDirectionsInfoRadius => 20.r;
  static get mapConfirmButtonBottom => 42.h;
  static get mapConfirmButtonLeft => 40.w;

  //AppBar & Drawer
  static get appBarDefaultHeight => 60.h;
  static get mainDrawerWidth => 250.w;
  static get mainDrawerHPadding => 30.w;
  static get mainDrawerVPadding => 90.h;
  static get appBarIconSize => 26.r;
  static get snackBarRadius => 20.r;

  ///App Constants
  static get screenTopShadowHeight => 400.h;
  static get splashLogoSize => 220.r;
  static get loginLogoSize => 126.r;
  static get switchThemeButtonWidth => 44.w;
}

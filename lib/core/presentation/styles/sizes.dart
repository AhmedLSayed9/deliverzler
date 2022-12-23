// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';

abstract class Sizes {
  static final double statusBarHeight =
      MediaQueryData.fromWindow(window).padding.top;

  static final double homeIndicatorHeight =
      MediaQueryData.fromWindow(window).viewPadding.bottom;

  //Font Size
  static const double font28 = 28.0;
  static const double font20 = 20.0;
  static const double font18 = 18.0;
  static const double font16 = 16.0;
  static const double font14 = 14.0;
  static const double font12 = 12.0;

  //Icon Size
  static const double icon72 = 72.0;
  static const double icon44 = 44.0;
  static const double icon32 = 32.0;
  static const double icon24 = 24.0;
  static const double icon16 = 16.0;
  static const double icon12 = 12.0;
  static const double icon8 = 8.0;

  //Screen Margin
  static const double screenMarginV20 = 20.0;
  static const double screenMarginV16 = 16.0;
  static const double screenMarginH36 = 36.0;
  static const double screenMarginH28 = 28.0;

  //Widget Margin
  static const double marginV44 = 44.0;
  static const double marginV40 = 40.0;
  static const double marginV36 = 36.0;
  static const double marginV32 = 32.0;
  static const double marginV28 = 28.0;
  static const double marginV20 = 20.0;
  static const double marginV16 = 16.0;
  static const double marginV12 = 12.0;
  static const double marginV8 = 8.0;
  static const double marginV6 = 6.0;
  static const double marginV2 = 2.0;
  static const double marginH28 = 28.0;
  static const double marginH20 = 20.0;
  static const double marginH16 = 16.0;
  static const double marginH12 = 12.0;
  static const double marginH8 = 8.0;
  static const double marginH6 = 6.0;
  static const double marginH4 = 4.0;

  //Widget Padding
  static const double paddingV14 = 14.0;
  static const double paddingV12 = 12.0;
  static const double paddingV8 = 8.0;
  static const double paddingV4 = 4.0;
  static const double paddingH20 = 20.0;
  static const double paddingH14 = 14.0;
  static const double paddingH8 = 8.0;
  static const double paddingH4 = 4.0;

  //Widget Size
  static const double maxWidth600 = 600.0;
  static const double maxWidth360 = 360.0;

  //Button
  static const double buttonHeight48 = 48.0;
  static const double buttonHeight44 = 44.0;
  static const double buttonHeight40 = 40.0;
  static const double buttonHeight32 = 32.0;
  static const double buttonWidth280 = 280.0;
  static const double buttonWidth240 = 240.0;
  static const double buttonWidth220 = 220.0;
  static const double buttonWidth136 = 136.0;
  static const double buttonWidth120 = 120.0;
  static const double buttonWidth60 = 60.0;
  static const double buttonWidth40 = 40.0;
  static const double buttonR24 = 24.0;

  //TextField
  static const double textFieldR12 = 12.0;
  static const double textFieldPaddingV14 = 14.0;
  static const double textFieldPaddingV10 = 10.0;
  static const double textFieldPaddingH38 = 38.0;
  static const double textFieldPaddingH14 = 14.0;
  static const double textFieldMarginV24 = 24.0;
  static const double textFieldPrefixWidth144 = 144.0;

  //Card
  static const double cardR12 = 12.0;
  static const double cardPaddingV16 = 16.0;
  static const double cardPaddingH20 = 20.0;

  //Dialog
  static const double dialogWidth280 = 280.0;
  static const double dialogR20 = 20.0;
  static const double dialogR6 = 4.0;
  static const double dialogPaddingV28 = 28.0;
  static const double dialogPaddingH20 = 20.0;
  static const double dialogPaddingH10 = 10.0;

  //Image
  static const double imageR140 = 140.0;
  static const double imageR100 = 100.0;
  static const double imageR64 = 64.0;
  static const double imageR56 = 56.0;
  static const double imageR28 = 28.0;

  //LoadingIndicator
  static const double loadingIndicatorR150 = 150.0;
  static const double loadingIndicatorR90 = 90.0;

  //AppBar
  static const double appBarHeight56 = 56.0;
  static const double appBarButtonR32 = 32.0;

  //Drawer
  static const double drawerWidth240 = 240.0;
  static const double drawerPaddingV88 = 88.0;
  static const double drawerPaddingH28 = 28.0;

  //BottomNavigationBar
  static const double bottomNavBarHeight60 = 60.0;
  static const double bottomNavBarIconR22 = 22.0;

  //Map
  static const double mapSearchBarHeight = 60.0;
  static const double mapSearchBarRadius = 8.0;
  static const double mapDirectionsInfoRadius = 20.0;
  static const double mapDirectionsInfoTop = 112.0;
  static const double mapFABRadius = 56.0;
  static const double mapFABBottom = 32.0;
  static const double mapFABRight = 28.0;
  static const double mapConfirmButtonBottom = 36.0;
  static const double mapConfirmButtonLeft = 36.0;
}

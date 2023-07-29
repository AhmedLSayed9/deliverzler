// ignore_for_file: deprecated_member_use

import 'dart:ui';

import 'package:flutter/material.dart';

abstract class Sizes {
  static final double statusBarHeight = MediaQueryData.fromWindow(window).padding.top;

  static final double homeIndicatorHeight = MediaQueryData.fromWindow(window).viewPadding.bottom;

  //Font Size
  static const double font28 = 28;
  static const double font20 = 20;
  static const double font18 = 18;
  static const double font16 = 16;
  static const double font14 = 14;
  static const double font12 = 12;

  //Icon Size
  static const double icon72 = 72;
  static const double icon44 = 44;
  static const double icon32 = 32;
  static const double icon24 = 24;
  static const double icon16 = 16;
  static const double icon12 = 12;
  static const double icon8 = 8;

  //Screen Margin
  static const double screenMarginV20 = 20;
  static const double screenMarginV16 = 16;
  static const double screenMarginH36 = 36;
  static const double screenMarginH28 = 28;

  //Widget Margin
  static const double marginV44 = 44;
  static const double marginV40 = 40;
  static const double marginV36 = 36;
  static const double marginV32 = 32;
  static const double marginV28 = 28;
  static const double marginV20 = 20;
  static const double marginV16 = 16;
  static const double marginV12 = 12;
  static const double marginV8 = 8;
  static const double marginV6 = 6;
  static const double marginV2 = 2;
  static const double marginH28 = 28;
  static const double marginH20 = 20;
  static const double marginH16 = 16;
  static const double marginH12 = 12;
  static const double marginH8 = 8;
  static const double marginH6 = 6;
  static const double marginH4 = 4;

  //Widget Padding
  static const double paddingV14 = 14;
  static const double paddingV12 = 12;
  static const double paddingV8 = 8;
  static const double paddingV4 = 4;
  static const double paddingH20 = 20;
  static const double paddingH14 = 14;
  static const double paddingH8 = 8;
  static const double paddingH4 = 4;

  //Widget Size
  static const double maxWidth600 = 600;
  static const double maxWidth360 = 360;

  //Button
  static const double buttonPaddingV14 = 14;
  static const double buttonPaddingV12 = 12;
  static const double buttonPaddingH80 = 80;
  static const double buttonPaddingH34 = 34;
  static const double buttonHeight48 = 48;
  static const double buttonHeight44 = 44;
  static const double buttonHeight40 = 40;
  static const double buttonHeight32 = 32;
  static const double buttonWidth280 = 280;
  static const double buttonWidth240 = 240;
  static const double buttonWidth220 = 220;
  static const double buttonWidth136 = 136;
  static const double buttonWidth120 = 120;
  static const double buttonWidth60 = 60;
  static const double buttonWidth40 = 40;
  static const double buttonR24 = 24;
  static const double buttonR4 = 4;

  //TextField
  static const double textFieldR12 = 12;
  static const double textFieldPaddingV14 = 14;
  static const double textFieldPaddingV10 = 10;
  static const double textFieldPaddingH38 = 38;
  static const double textFieldPaddingH14 = 14;
  static const double textFieldMarginV24 = 24;
  static const double textFieldPrefixWidth144 = 144;

  //Card
  static const double cardR12 = 12;
  static const double cardPaddingV16 = 16;
  static const double cardPaddingH20 = 20;

  //Dialog
  static const double dialogWidth280 = 280;
  static const double dialogR20 = 20;
  static const double dialogR6 = 4;
  static const double dialogPaddingV28 = 28;
  static const double dialogPaddingV20 = 20;
  static const double dialogPaddingH20 = 20;
  static const double dialogPaddingH10 = 10;

  //Image
  static const double imageR140 = 140;
  static const double imageR100 = 100;
  static const double imageR64 = 64;
  static const double imageR56 = 56;
  static const double imageR28 = 28;

  //LoadingIndicator
  static const double loadingIndicatorR150 = 150;
  static const double loadingIndicatorR90 = 90;

  //AppBar
  static const double appBarHeight56 = 56;
  static const double appBarLeadingWidth = 68;

  //Drawer
  static const double drawerWidth240 = 240;
  static const double drawerPaddingV88 = 88;
  static const double drawerPaddingH28 = 28;

  //BottomNavigationBar
  static const double bottomNavBarHeight60 = 60;
  static const double bottomNavBarIconR22 = 22;

  //Map
  static const double mapSearchBarHeight = 60;
  static const double mapSearchBarRadius = 8;
  static const double mapDirectionsInfoRadius = 20;
  static const double mapDirectionsInfoTop = 112;
  static const double mapFABRadius = 56;
  static const double mapFABBottom = 32;
  static const double mapFABRight = 28;
  static const double mapConfirmButtonBottom = 36;
  static const double mapConfirmButtonLeft = 36;
}

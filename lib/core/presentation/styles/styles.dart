import 'package:flutter/material.dart';

import '../../core_features/theme/presentation/utils/colors/custom_colors.dart';

/// Single source of truth for styling.
///
/// TL;DR: Don't try and create every variant in existence here, just the high level ones (core & duplicates).
///
/// Like most rules, there are exceptions: one-off values that are used nowhere else in the app.
/// There is little point in cluttering up the styling rules with these values, but it’s worth
/// considering if they should be derived from an existing value (for example, padding + 1.0).
/// You should also watch for reuse or duplication of the same semantic values.
/// Those values should likely be added to this global styling ruleset.

abstract class Sizes {
  static final double statusBarHeight =
      MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single).padding.top;

  static final double homeIndicatorHeight =
      MediaQueryData.fromView(WidgetsBinding.instance.platformDispatcher.views.single)
          .viewPadding
          .bottom;

  /// Font Sizes
  /// You can use these directly if you need, but usually there should be a predefined style in TextStyles
  static const double font28 = 28;
  static const double font20 = 20;
  static const double font18 = 18;
  static const double font16 = 16;
  static const double font14 = 14;
  static const double font12 = 12;

  // Icon Sizes
  static const double icon24 = 24;
  static const double icon16 = 16;
  static const double icon8 = 8;

  // Screen Padding
  static const double screenPaddingV20 = 20;
  static const double screenPaddingV16 = 16;
  static const double screenPaddingH36 = 36;
  static const double screenPaddingH28 = 28;

  // Widget Margin
  static const double marginV40 = 40;
  static const double marginV32 = 32;
  static const double marginV28 = 28;
  static const double marginV24 = 24;
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

  // Widget Padding
  static const double paddingV14 = 14;
  static const double paddingV12 = 12;
  static const double paddingV8 = 8;
  static const double paddingV4 = 4;
  static const double paddingH20 = 20;
  static const double paddingH14 = 14;
  static const double paddingH8 = 8;
  static const double paddingH4 = 4;

  // Widget Constraints
  static const double maxWidth360 = 360;

  // Button
  static const double buttonPaddingV14 = 14;
  static const double buttonPaddingV12 = 12;
  static const double buttonPaddingH80 = 80;
  static const double buttonPaddingH34 = 34;
  static const double buttonR24 = 24;
  static const double buttonR4 = 4;

  // Card
  static const double cardR12 = 12;
  static const double cardPaddingV16 = 16;
  static const double cardPaddingH20 = 20;

  // Dialog
  static const double dialogWidth280 = 280;
  static const double dialogR20 = 20;
  static const double dialogR6 = 4;
  static const double dialogPaddingV28 = 28;
  static const double dialogPaddingV20 = 20;
  static const double dialogPaddingH20 = 20;

  // Image
  static const double imageR28 = 28;

  // HomeShell
  static const double appBarHeight56 = 56;
  static const double appBarLeadingWidth = 68;
  static const double appBarElevation = 0;
  static const double drawerWidth240 = 240;
  static const double drawerPaddingV88 = 88;
  static const double drawerPaddingH28 = 28;
  static const double navBarHeight60 = 60;
  static const double navBarIconR22 = 22;
  static const double navBarElevation = 4;

  // Map
  static const double mapSearchBarRadius = 8;
  static const double mapDirectionsInfoTop = 112;
}

class FontStyles {
  static const String familyPoppins = 'Poppins';
  static const String familyTajawal = 'Tajawal';

  static const fontWeightBlack = FontWeight.w900;
  static const fontWeightExtraBold = FontWeight.w800;
  static const fontWeightBold = FontWeight.w700;
  static const fontWeightSemiBold = FontWeight.w600;
  static const fontWeightMedium = FontWeight.w500;
  static const fontWeightNormal = FontWeight.w400;
  static const fontWeightLight = FontWeight.w300;
  static const fontWeightExtraLight = FontWeight.w200;
  static const fontWeightThin = FontWeight.w100;
}

abstract class TextStyles {
  static TextStyle f28(BuildContext context) => TextStyle(
        color: customColors(context).font28Color,
        fontSize: Sizes.font28,
        fontWeight: FontStyles.fontWeightBlack,
      );

  static TextStyle f20(BuildContext context) => TextStyle(
        color: customColors(context).font20Color,
        fontSize: Sizes.font20,
        fontWeight: FontStyles.fontWeightBlack,
      );

  static TextStyle f18(BuildContext context) => TextStyle(
        color: customColors(context).font18Color,
        fontSize: Sizes.font18,
      );

  static TextStyle f18SemiBold(BuildContext context) =>
      f18(context).copyWith(fontWeight: FontStyles.fontWeightSemiBold);

  static TextStyle f16(BuildContext context) => TextStyle(
        color: customColors(context).font16Color,
        fontSize: Sizes.font16,
      );

  static TextStyle f16SemiBold(BuildContext context) =>
      f16(context).copyWith(fontWeight: FontStyles.fontWeightSemiBold);

  static TextStyle f14(BuildContext context) => TextStyle(
        color: customColors(context).font14Color,
        fontSize: Sizes.font14,
      );

  static TextStyle f12(BuildContext context) => TextStyle(
        color: customColors(context).font12Color,
        fontSize: Sizes.font12,
      );

  static TextStyle titleMedium(Color color) => TextStyle(color: color, fontSize: Sizes.font14);

  static TextStyle inputDecorationHint(Color color) =>
      TextStyle(color: color, fontSize: Sizes.font12);

  static TextStyle inputDecorationError(Color color) =>
      TextStyle(color: color, fontSize: Sizes.font12);

  static TextStyle navigationLabel(Color color) => TextStyle(color: color, fontSize: Sizes.font12);

  static TextStyle coloredElevatedButton(BuildContext context) => f16(context).copyWith(
        color: const Color(0xffffffff),
        fontWeight: FontStyles.fontWeightSemiBold,
      );

  static TextStyle dialogTitle(Color color) => TextStyle(
        color: color,
        fontSize: Sizes.font18,
        fontWeight: FontStyles.fontWeightBold,
      );

  static TextStyle dialogContent(Color color) => TextStyle(color: color, fontSize: Sizes.font16);

  static TextStyle cupertinoDialogAction(BuildContext context) => f16SemiBold(context);
}

abstract class Borders {
  static OutlineInputBorder inputDecorationBorder(Color borderColor, [double borderWidth = 0.8]) =>
      OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: borderColor, width: 0.8),
      );
}

abstract class Insets {
  static const inputDecorationContentPadding = EdgeInsets.symmetric(vertical: 14, horizontal: 14);
}

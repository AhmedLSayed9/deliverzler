import 'package:flutter/material.dart';

import '../../core_features/theme/presentation/utils/custom_colors.dart';
import '../helpers/localization_helper.dart';

part 'sizes.dart';
part 'text_styles.dart';

/// Single source of truth for styling.
///
/// TL;DR: Don't try and create every variant in existence here, just the high level ones (core & duplicates).
///
/// Like most rules, there are exceptions: one-off values that are used nowhere else in the app.
/// There is little point in cluttering up the styling rules with these values, but it’s worth
/// considering if they should be derived from an existing value (for example, padding + 1.0).
/// You should also watch for reuse or duplication of the same semantic values.
/// Those values should likely be added to this global styling ruleset.

abstract class FontStyles {
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

abstract class Borders {
  static OutlineInputBorder inputDecorationBorder(Color borderColor, [double borderWidth = 0.8]) =>
      OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        borderSide: BorderSide(color: borderColor, width: borderWidth),
      );
}

abstract class Insets {
  static const inputDecorationContentPadding = EdgeInsets.symmetric(vertical: 14, horizontal: 14);
}

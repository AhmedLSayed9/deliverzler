import 'package:flutter/material.dart';

import '../../../../../gen/my_assets.dart';
import '../../../../presentation/helpers/localization_helper.dart';
import '../../../../presentation/styles/font_styles.dart';

enum AppLocale {
  english('en', MyAssets.ASSETS_ICONS_LANGUAGES_ICONS_ENGLISH_PNG, FontStyles.familyPoppins),
  arabic('ar', MyAssets.ASSETS_ICONS_LANGUAGES_ICONS_ARABIC_PNG, FontStyles.familyTajawal);

  const AppLocale(this.code, this.flag, this.fontFamily);

  final String code;
  final String flag;
  final String fontFamily;
}

extension LanguageExtension on AppLocale {
  String getLanguageName(BuildContext context) {
    return switch (this) {
      AppLocale.arabic => tr(context).arabic,
      AppLocale.english => tr(context).english,
    };
  }
}

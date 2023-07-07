import 'package:flutter/material.dart';

import '../../../../../gen/my_assets.dart';
import '../../../../presentation/helpers/localization_helper.dart';

enum AppLocale {
  english('en', MyAssets.ASSETS_ICONS_LANGUAGES_ICONS_ENGLISH_PNG),
  arabic('ar', MyAssets.ASSETS_ICONS_LANGUAGES_ICONS_ARABIC_PNG);

  const AppLocale(this.code, this.flag);

  final String code;
  final String flag;
}

extension LanguageExtension on AppLocale {
  String getLanguageName(BuildContext context) {
    return switch (this) {
      AppLocale.arabic => tr(context).arabic,
      AppLocale.english => tr(context).english,
    };
  }
}

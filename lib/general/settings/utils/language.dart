import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/styles/app_images.dart';
import 'package:flutter/material.dart';

enum Language {
  english('en', AppImages.languageIconEnglish),
  arabic('ar', AppImages.languageIconArabic);

  final String code;
  final String flag;

  const Language(this.code, this.flag);
}

extension LanguageExtension on Language {
  String getCurrentLanguageName(BuildContext context) {
    switch (this) {
      case Language.arabic:
        return tr(context).arabic;
      case Language.english:
      default:
        return tr(context).english;
    }
  }
}

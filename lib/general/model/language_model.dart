import 'package:deliverzler/core/services/init_services/localization_service.dart';
import 'package:deliverzler/core/styles/app_images.dart';
import 'package:flutter/material.dart';

class LanguageModel {
  String code;
  String name;
  String flag;

  LanguageModel(
    this.code,
    this.name,
    this.flag,
  );
}

final languagesList = [
  LanguageModel(
    'en',
    'english',
    AppImages.languageIconEnglish,
  ),
  LanguageModel(
    'ar',
    'arabic',
    AppImages.languageIconArabic,
  ),
];

String getCurrentLanguageName(BuildContext context, code) {
  switch (code) {
    case 'en':
      return tr(context).english;
    case 'ar':
      return tr(context).arabic;
    default:
      return tr(context).english;
  }
}

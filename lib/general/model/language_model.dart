import 'package:deliverzler/core/styles/app_images.dart';

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

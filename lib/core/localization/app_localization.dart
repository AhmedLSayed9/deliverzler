import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLocalizations {
  AppLocalizations._();

  static final instance = AppLocalizations._();

  static const String defaultLocal = 'en';

  /// Change language for the current application
  /// Save current application language in device local storage so that even if app terminated/restarted, the language doesn't change
  changeLocale({required String languageCode}) {
    Get.updateLocale(Locale(languageCode));
    setUserStoredLocale(Get.locale!);
  }

  Future setUserStoredLocale(Locale locale) async {
    (await SharedPreferences.getInstance()).setString(
      'user_stored_locale',
      locale.toString(),
    );
  }

  Future<Locale> getUserStoredLocale() async {
    String locale = (await SharedPreferences.getInstance())
            .getString('user_stored_locale') ??
        defaultLocal;
    return Locale(locale);
  }

  String getLanguageCode() {
    return Get.locale?.languageCode ?? defaultLocal;
  }

  /// Check if current application language is Arabic for TextDirection
  bool isAr() {
    return Get.locale?.languageCode.toString() == 'ar';
  }
}

String tr(String key) {
  return key.tr;
}

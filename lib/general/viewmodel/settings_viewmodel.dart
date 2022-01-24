import 'package:get/get.dart';
import 'package:deliverzler/core/localization/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/services/init_services/theme_service.dart';

final settingsViewModel =
    ChangeNotifierProvider<SettingsViewModel>((ref) => SettingsViewModel());

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel() {
    selectedLanguageCode = AppLocalizations.instance.getLanguageCode();
    isLightThemeMode = !Get.isDarkMode;
  }

  late String selectedLanguageCode;
  late bool isLightThemeMode;

  changeLocale({required String langCode}) {
    selectedLanguageCode = langCode;
    AppLocalizations.instance.changeLocale(languageCode: langCode);
    notifyListeners();
  }

  changeTheme({required bool isLight}) {
    ThemeService.instance.changeTheme(
      themeMode: isLight ? ThemeMode.light : ThemeMode.dark,
    );
    isLightThemeMode = !isLightThemeMode;
    notifyListeners();
  }
}

import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/services/init_services/localization_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/services/init_services/theme_service.dart';

final settingsViewModel =
    ChangeNotifierProvider<SettingsViewModel>((ref) => SettingsViewModel(ref));

class SettingsViewModel extends ChangeNotifier {
  SettingsViewModel(this.ref) {
    selectedLanguageCode = LocalizationService.instance
        .getCurrentLocale(NavigationService.context);
    isLightThemeMode =
        Theme.of(NavigationService.context).brightness == Brightness.light;
  }

  final Ref ref;
  late String selectedLanguageCode;
  late bool isLightThemeMode;

  changeLocale({required String langCode}) {
    selectedLanguageCode = langCode;
    ref.read(appLocaleProvider.notifier).state = Locale(langCode);
    LocalizationService.instance.changeLocale(languageCode: langCode);
    notifyListeners();
  }

  changeTheme({required bool isLight}) {
    final _theme = isLight ? ThemeMode.light : ThemeMode.dark;
    ref.read(appThemeProvider.notifier).state = _theme;
    ThemeService.instance.changeTheme(themeMode: _theme);
    isLightThemeMode = !isLightThemeMode;
    notifyListeners();
  }
}

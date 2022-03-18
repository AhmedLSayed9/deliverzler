import 'package:deliverzler/core/viewmodels/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeService {
  ThemeService._();

  static final instance = ThemeService._();

  factory ThemeService(WidgetRef ref) {
    instance._ref = ref;
    return instance;
  }

  late WidgetRef _ref;

  bool isDarkMode(BuildContext context) {
    final _currentTheme = _ref.watch(appThemeProvider);
    if (_currentTheme == ThemeMode.system) {
      return MediaQuery.of(context).platformBrightness == Brightness.dark;
    } else if (_currentTheme == ThemeMode.dark) {
      return true;
    } else {
      return false;
    }
  }
}

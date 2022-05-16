import 'package:deliverzler/core/viewmodels/app_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ThemeService {
  ThemeService._();

  static final instance = ThemeService._();

  factory ThemeService(Reader reader) {
    instance._reader = reader;
    return instance;
  }

  late Reader _reader;

  bool isDarkMode([ThemeMode? currentTheme, Brightness? platformBrightness]) {
    final _currentTheme = currentTheme ?? _reader(appThemeProvider);
    if (_currentTheme == ThemeMode.system) {
      return (platformBrightness ??
              SchedulerBinding.instance.window.platformBrightness) ==
          Brightness.dark;
    } else if (_currentTheme == ThemeMode.dark) {
      return true;
    } else {
      return false;
    }
  }
}

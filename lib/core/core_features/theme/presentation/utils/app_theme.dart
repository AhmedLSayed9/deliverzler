import 'package:flutter/material.dart';

import 'theme_base.dart';
import 'theme_dark.dart';
import 'theme_light.dart';

enum AppTheme {
  light,
  dark;
}

extension ThemeExtension on AppTheme {
  ThemeData getThemeData(String fontFamily) {
    return switch (this) {
      AppTheme.light => ThemeLight().getThemeData(fontFamily),
      AppTheme.dark => ThemeDark().getThemeData(fontFamily),
    };
  }

  IconData getThemeIcon() {
    return switch (this) {
      AppTheme.light => Icons.wb_sunny,
      AppTheme.dark => Icons.nights_stay,
    };
  }
}

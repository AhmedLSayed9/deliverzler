import 'package:flutter/material.dart';

import 'themes/i_theme.dart';
import 'themes/theme_dark.dart';
import 'themes/theme_light.dart';

enum AppTheme {
  light,
  dark;
}

extension ThemeExtension on AppTheme {
  ThemeData getThemeData() {
    return switch (this) {
      AppTheme.light => ThemeLight().getThemeData(),
      AppTheme.dark => ThemeDark().getThemeData(),
    };
  }

  IconData getThemeIcon() {
    return switch (this) {
      AppTheme.light => Icons.wb_sunny,
      AppTheme.dark => Icons.nights_stay,
    };
  }
}

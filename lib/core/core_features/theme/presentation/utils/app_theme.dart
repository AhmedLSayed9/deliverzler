import 'package:deliverzler/core/core_features/theme/presentation/utils/themes/i_theme.dart';
import 'package:deliverzler/core/core_features/theme/presentation/utils/themes/theme_dark.dart';
import 'package:deliverzler/core/core_features/theme/presentation/utils/themes/theme_light.dart';
import 'package:flutter/material.dart';

enum AppTheme {
  light,
  dark;
}

extension ThemeExtension on AppTheme {
  ThemeData getThemeData() {
    switch (this) {
      case AppTheme.light:
        final themeLight = ThemeLight();
        return themeLight.getThemeData();
      case AppTheme.dark:
        final themeDark = ThemeDark();
        return themeDark.getThemeData();
    }
  }

  IconData getThemeIcon() {
    switch (this) {
      case AppTheme.light:
        return Icons.wb_sunny;
      case AppTheme.dark:
        return Icons.nights_stay;
    }
  }
}

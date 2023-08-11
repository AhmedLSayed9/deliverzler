import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import '../../core_features/theme/presentation/utils/app_colors.dart';
import '../../core_features/theme/presentation/utils/app_theme.dart';

bool isDarkMode([Brightness? platformBrightness]) {
  final brightness =
      // ignore: deprecated_member_use
      platformBrightness ?? SchedulerBinding.instance.window.platformBrightness;
  return brightness == Brightness.dark;
}

AppThemeMode getSystemTheme([Brightness? platformBrightness]) {
  final isDark = isDarkMode(platformBrightness);
  return isDark ? AppThemeMode.dark : AppThemeMode.light;
}

SystemUiOverlayStyle getFullScreenOverlayStyle(
  BuildContext context, {
  required bool darkOverlays,
  required bool supportsEdgeToEdge,
}) {
  final (themeMode, olderAndroidSystemNavBarColor) = darkOverlays
      ? (AppThemeMode.light, AppColorsLight().olderAndroidSystemNavBarColor)
      : (AppThemeMode.dark, AppColorsDark().olderAndroidSystemNavBarColor);

  return themeMode.overlayStyle(
    statusBarColor: Colors.transparent,
    supportsEdgeToEdge: supportsEdgeToEdge,
    systemNavBarColor: Colors.transparent,
    olderAndroidSystemNavBarColor: olderAndroidSystemNavBarColor,
  );
}

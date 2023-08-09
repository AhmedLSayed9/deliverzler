import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

import '../../core_features/theme/presentation/utils/app_theme.dart';
import '../../core_features/theme/presentation/utils/theme_dark.dart';
import '../../core_features/theme/presentation/utils/theme_light.dart';

bool isDarkMode([Brightness? platformBrightness]) {
  final brightness =
      // ignore: deprecated_member_use
      platformBrightness ?? SchedulerBinding.instance.window.platformBrightness;
  return brightness == Brightness.dark;
}

AppTheme getSystemTheme([Brightness? platformBrightness]) {
  final isDark = isDarkMode(platformBrightness);
  return isDark ? AppTheme.dark : AppTheme.light;
}

SystemUiOverlayStyle getFullScreenOverlayStyle(
  BuildContext context, {
  required bool darkOverlays,
}) {
  return darkOverlays
      ? ThemeLight().appBarTheme.systemOverlayStyle!
      : ThemeDark().appBarTheme.systemOverlayStyle!;
}

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

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
}) {
  return darkOverlays
      ? SystemUiOverlayStyle.dark.copyWith(
          //For Android
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.dark,
        )
      : SystemUiOverlayStyle.light.copyWith(
          //For Android
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
        );
}

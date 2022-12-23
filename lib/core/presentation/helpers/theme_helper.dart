import 'package:deliverzler/core/core_features/theme/presentation/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

bool isDarkMode([Brightness? platformBrightness]) {
  final brightness =
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
      ? SystemUiOverlayStyle.dark.copyWith(
          //For Android
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          systemNavigationBarIconBrightness: Brightness.dark,
        )
      : SystemUiOverlayStyle.light.copyWith(
          //For Android
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Theme.of(context).scaffoldBackgroundColor,
          systemNavigationBarIconBrightness: Brightness.light,
        );
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../platform_widgets/platform_base_widget.dart';

class PlatformApp extends PlatformBaseWidget<MaterialApp, CupertinoApp> {
  const PlatformApp({
    required this.routerConfig,
    super.key,
    this.widgetKey,
    this.builder,
    this.title = '',
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowCheckedModeBanner = true,
    this.materialData,
    this.cupertinoData,
  });

  final Key? widgetKey;
  final RouterConfig<Object> routerConfig;
  final TransitionBuilder? builder;
  final String title;
  final Color? color;
  final Locale? locale;
  final Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates;
  final Iterable<Locale> supportedLocales;
  final bool debugShowCheckedModeBanner;
  final MaterialAppData? materialData;
  final CupertinoAppData? cupertinoData;

  @override
  MaterialApp createMaterialWidget(BuildContext context) {
    return MaterialApp.router(
      key: widgetKey,
      routerConfig: routerConfig,
      builder: builder,
      title: title,
      color: color,
      theme: materialData?.theme ?? Theme.of(context),
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
    );
  }

  @override
  CupertinoApp createCupertinoWidget(BuildContext context) {
    return CupertinoApp.router(
      key: widgetKey,
      routerConfig: routerConfig,
      builder: builder,
      title: title,
      color: color,
      theme: cupertinoData?.theme,
      locale: locale,
      localizationsDelegates: localizationsDelegates,
      supportedLocales: supportedLocales,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
    );
  }
}

class MaterialAppData {
  const MaterialAppData({
    this.theme,
  });

  final ThemeData? theme;
}

class CupertinoAppData {
  const CupertinoAppData({
    this.theme,
  });

  final CupertinoThemeData? theme;
}

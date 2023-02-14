import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_base_widget.dart';

class PlatformApp extends PlatformBaseWidget<MaterialApp, CupertinoApp> {
  const PlatformApp({
    super.key,
    this.widgetKey,
    this.navigatorKey,
    this.navigatorObservers = const <NavigatorObserver>[],
    this.home,
    this.routes = const <String, WidgetBuilder>{},
    this.initialRoute,
    this.onGenerateRoute,
    this.onGenerateInitialRoutes,
    this.onUnknownRoute,
    this.builder,
    this.title = '',
    this.color,
    this.locale,
    this.localizationsDelegates,
    this.supportedLocales = const <Locale>[Locale('en', 'US')],
    this.debugShowCheckedModeBanner = true,
    this.materialData,
    this.cupertinoData,
  })  : assert(navigatorObservers != null),
        assert(routes != null);

  final Key? widgetKey;
  final GlobalKey<NavigatorState>? navigatorKey;
  final List<NavigatorObserver>? navigatorObservers;
  final Widget? home;
  final Map<String, WidgetBuilder>? routes;
  final String? initialRoute;
  final RouteFactory? onGenerateRoute;
  final InitialRouteListFactory? onGenerateInitialRoutes;
  final RouteFactory? onUnknownRoute;
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
    return MaterialApp(
      key: widgetKey,
      navigatorKey: navigatorKey,
      navigatorObservers: navigatorObservers!,
      home: home,
      routes: routes!,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      onUnknownRoute: onUnknownRoute,
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
    return CupertinoApp(
      key: widgetKey,
      navigatorKey: navigatorKey,
      navigatorObservers: navigatorObservers!,
      home: home,
      routes: routes!,
      initialRoute: initialRoute,
      onGenerateRoute: onGenerateRoute,
      onGenerateInitialRoutes: onGenerateInitialRoutes,
      onUnknownRoute: onUnknownRoute,
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

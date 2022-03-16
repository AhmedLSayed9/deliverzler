import 'package:deliverzler/core/routing/app_router.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/services/init_services/localization_service.dart';
import 'package:deliverzler/core/services/init_services/theme_service.dart';
import 'package:deliverzler/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/services/init_services/services_initializer.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/app_themes.dart';
import 'package:deliverzler/core/routing/route_paths.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  List results = await ServiceInitializer.instance.initializeSettings();
  runApp(ProviderScope(
    child: MyApp(
      locale: results[0],
      theme: results[1],
    ),
  ));
}

class MyApp extends ConsumerWidget {
  const MyApp({
    required this.locale,
    required this.theme,
    Key? key,
  }) : super(key: key);

  final Locale? locale;
  final ThemeMode theme;

  @override
  Widget build(BuildContext context, ref) {
    final _appLocale = ref.watch(appLocaleProvider);
    final _appTheme = ref.watch(appThemeProvider);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        // For Android
        statusBarColor: Colors.transparent,
        // For apps with a light background:
        // For Android (dark icons)
        statusBarIconBrightness: Brightness.dark,
        // For iOS (dark icons)
        statusBarBrightness: Brightness.light,
      ),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: MaterialApp(
          navigatorKey: NavigationService.navigationKey,
          debugShowCheckedModeBanner: false,
          title: 'Deliverzler',
          color: AppColors.primaryColor,
          locale: _appLocale ?? locale,
          supportedLocales: L10n.all,
          localizationsDelegates: L10n.localizationsDelegates,
          themeMode: _appTheme ?? theme,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          initialRoute: RoutePaths.coreSplash,
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    );
  }
}

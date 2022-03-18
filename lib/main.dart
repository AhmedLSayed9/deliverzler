import 'package:deliverzler/core/routing/app_router.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/viewmodels/app_locale_provider.dart';
import 'package:deliverzler/core/viewmodels/app_theme_provider.dart';
import 'package:deliverzler/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:deliverzler/core/services/init_services/services_initializer.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/app_themes.dart';
import 'package:deliverzler/core/routing/route_paths.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

Future main() async {
  final _container = ProviderContainer();
  WidgetsFlutterBinding.ensureInitialized();
  await ServicesInitializer.instance.initializeServices(_container);
  runApp(
    UncontrolledProviderScope(
      container: _container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    useEffect(() {
      ServicesInitializer.instance.initializeServicesRef(ref);
      return null;
    }, []);
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
          color: AppColors.lightThemePrimary,
          locale: _appLocale,
          supportedLocales: L10n.all,
          localizationsDelegates: L10n.localizationsDelegates,
          themeMode: _appTheme,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
          initialRoute: RoutePaths.coreSplash,
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    );
  }
}

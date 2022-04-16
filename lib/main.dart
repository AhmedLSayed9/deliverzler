import 'package:deliverzler/core/hooks/platform_brightness_hook.dart';
import 'package:deliverzler/core/routing/app_router.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/services/theme_service.dart';
import 'package:deliverzler/core/styles/app_themes/dark_theme.dart';
import 'package:deliverzler/core/styles/app_themes/light_theme.dart';
import 'package:deliverzler/core/viewmodels/app_locale_provider.dart';
import 'package:deliverzler/core/viewmodels/app_theme_provider.dart';
import 'package:deliverzler/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/services/init_services/services_initializer.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/routing/route_paths.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  //This let us access providers before runApp (read only)
  final _container = ProviderContainer();
  WidgetsBinding _widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await ServicesInitializer.instance.init(_widgetsBinding, _container);
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
    final _platformBrightness = usePlatformBrightness();
    final _appLocale = ref.watch(appLocaleProvider);
    final _appTheme = ref.watch(appThemeProvider);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Theme(
        data: ThemeService.instance.isDarkMode(_appTheme, _platformBrightness)
            ? DarkTheme.darkTheme
            : LightTheme.lightTheme,
        child: PlatformApp(
          navigatorKey: NavigationService.navigationKey,
          debugShowCheckedModeBanner: false,
          title: 'Deliverzler',
          color: AppColors.lightThemePrimary,
          locale: _appLocale,
          supportedLocales: L10n.all,
          localizationsDelegates: L10n.localizationsDelegates,
          initialRoute: RoutePaths.coreSplash,
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    );
  }
}

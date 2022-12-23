import 'package:deliverzler/core/core_features/locale/presentation/providers/current_app_locale_provider.dart';
import 'package:deliverzler/core/core_features/theme/presentation/utils/app_theme.dart';
import 'package:deliverzler/core/core_features/theme/presentation/providers/current_app_theme_provider.dart';
import 'package:deliverzler/core/data/local/local_storage_caller/shared_pref_local_storage_caller.dart';
import 'package:deliverzler/core/presentation/services/locator_service.dart';
import 'package:deliverzler/core/presentation/services/services_initializer.dart';
import 'package:deliverzler/core/presentation/providers/provider_observers.dart';
import 'package:deliverzler/core/presentation/routing/app_router.dart';
import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_app.dart';
import 'package:deliverzler/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/routing/route_paths.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await setupLocator();

  final prefs = await SharedPreferences.getInstance();
  //This let us access providers before runApp
  final ProviderContainer container = ProviderContainer(
    overrides: [sharedPrefsProvider.overrideWithValue(prefs)],
    observers: [LogProviderObserver()],
  );
  await container.read(servicesInitializerProvider).init(widgetsBinding);

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    useOnPlatformBrightnessChange((previous, current) {
      ref.read(platformBrightnessProvider.notifier).state = current;
    });
    final theme = ref.watch(currentAppThemeProvider);
    final locale = ref.watch(currentAppLocaleProvider);

    return Theme(
      data: theme.getThemeData(),
      child: PlatformApp(
        initialRoute: RoutePaths.coreSplash,
        onGenerateRoute: AppRouter.generateRoute,
        builder: (_, child) {
          return GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: child,
          );
        },
        title: 'Deliverzler',
        color: Theme.of(context).colorScheme.primary,
        locale: Locale(locale.code),
        localizationsDelegates: L10n.localizationsDelegates,
        supportedLocales: L10n.all,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

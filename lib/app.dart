import 'package:flutter/material.dart';

import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'core/core_features/locale/presentation/providers/current_app_locale_provider.dart';
import 'core/core_features/theme/presentation/providers/current_app_theme_provider.dart';
import 'core/core_features/theme/presentation/utils/app_theme.dart';
import 'core/presentation/routing/app_router.dart';
import 'core/presentation/routing/route_paths.dart';
import 'core/presentation/widgets/platform_widgets/platform_app.dart';
import 'l10n/l10n.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    useOnPlatformBrightnessChange((previous, current) {
      ref.read(platformBrightnessProvider.notifier).update((_) => current);
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

import 'package:flutter/material.dart';

import 'core/core_features/locale/presentation/providers/current_app_locale_provider.dart';
import 'core/core_features/theme/presentation/providers/current_app_theme_provider.dart';
import 'core/core_features/theme/presentation/utils/app_theme.dart';
import 'core/presentation/routing/app_router.dart';
import 'core/presentation/routing/navigation_service.dart';
import 'core/presentation/utils/riverpod_framework.dart';
import 'core/presentation/widgets/platform_widgets/platform_app.dart';
import 'l10n/l10n.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final router = ref.watch(goRouterProvider);

    useOnPlatformBrightnessChange((previous, current) {
      ref.read(platformBrightnessProvider.notifier).update((_) => current);
    });
    final theme = ref.watch(currentAppThemeProvider);
    final locale = ref.watch(currentAppLocaleProvider);

    return Theme(
      data: theme.getThemeData(),
      child: PlatformApp(
        routerConfig: router,
        builder: (_, child) {
          return GestureDetector(
            onTap: NavigationService.removeFocus,
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

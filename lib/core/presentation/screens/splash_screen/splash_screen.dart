import 'package:flutter/material.dart';

import '../../hooks/fade_in_controller_hook.dart';
import '../../providers/splash_providers.dart';
import '../../routing/navigation_service.dart';
import '../../utils/riverpod_framework.dart';
import '../../widgets/responsive_widgets/widget_builders.dart';
import 'splash_screen_compact.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final isWarmedUp = !ref.isLoading(splashServicesWarmupProvider);
    if (isWarmedUp) {
      ref.listen<AsyncValue<String>>(
        splashTargetProvider,
        (prevState, newState) {
          newState.unwrapPrevious().whenOrNull(
            data: (nextPage) {
              NavigationService.pushReplacementAll(
                context,
                isNamed: true,
                page: nextPage,
                arguments: {'offAll': true},
              );
            },
          );
        },
      );
    }

    final fadeController = useFadeInController();

    return WindowClassLayout(
      compact: (_) => OrientationLayout(
        portrait: (_) => SplashScreenCompact(
          fadeInController: fadeController,
        ),
      ),
    );
  }
}

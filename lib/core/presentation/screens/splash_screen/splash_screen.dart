import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../hooks/fade_in_controller_hook.dart';
import '../../providers/splash_provider.dart';
import '../../routing/navigation_service.dart';
import '../../widgets/responsive_widgets/widget_builders.dart';
import 'splash_screen_compact.dart';

class SplashScreen extends HookConsumerWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    ref.listen<AsyncValue<String>>(
      splashProvider,
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

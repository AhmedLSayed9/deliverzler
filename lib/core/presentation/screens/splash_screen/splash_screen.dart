import 'package:deliverzler/core/presentation/hooks/fade_in_controller_hook.dart';
import 'package:deliverzler/core/presentation/providers/splash_provider.dart';
import 'package:deliverzler/core/presentation/routing/navigation_service.dart';
import 'package:deliverzler/core/presentation/screens/splash_screen/splash_screen_compact.dart';
import 'package:deliverzler/core/presentation/widgets/responsive_widgets/widget_builders.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

import 'package:flutter/material.dart';

import '../../routing/app_router.dart';
import '../../utils/riverpod_framework.dart';
import '../../widgets/responsive_widgets/responsive_layouts.dart';
import 'route_error_screen_compact.dart';

class RouteErrorScreen extends HookConsumerWidget {
  const RouteErrorScreen(this.error, {super.key});

  final Exception? error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return WillPopScope(
      onWillPop: () {
        const SplashRoute().go(context);
        return Future.value(false);
      },
      child: WindowClassLayout(
        compact: (_) => OrientationLayout(
          portrait: (_) => const ErrorScreenCompact(),
        ),
      ),
    );
  }
}

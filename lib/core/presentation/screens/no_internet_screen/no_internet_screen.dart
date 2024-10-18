import 'package:flutter/material.dart';

import '../../routing/app_router.dart';
import '../../utils/riverpod_framework.dart';
import '../../widgets/responsive_widgets/responsive_layouts.dart';
import 'no_internet_screen_compact.dart';

class NoInternetScreen extends HookConsumerWidget {
  const NoInternetScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, __) => const SplashRoute().go(context),
      child: WindowClassLayout(
        compact: (_) => OrientationLayout(
          portrait: (_) => const NoInternetScreenCompact(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core_features/theme/presentation/providers/current_app_theme_provider.dart';
import '../../../../core_features/theme/presentation/utils/app_theme.dart';
import '../../../helpers/theme_helper.dart';
import '../../../providers/device_info_providers.dart';
import '../../../utils/riverpod_framework.dart';
import 'platform_scaffold.dart';

class FullScreenPlatformScaffold extends ConsumerWidget {
  const FullScreenPlatformScaffold({
    required this.body,
    this.darkOverlays,
    super.key,
  });

  final Widget body;
  final bool? darkOverlays;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(currentAppThemeModeProvider);
    final supportsFullscreen = ref.watch(androidDeviceInfoProvider).supportsFullscreen;

    return PlatformScaffold(
      hasStatusBarSpace: false,
      body: AnnotatedRegion(
        value: getFullScreenOverlayStyle(
          context,
          darkOverlays: darkOverlays ?? currentTheme == AppThemeMode.light,
          supportsFullscreen: supportsFullscreen,
        ),
        child: body,
      ),
    );
  }
}

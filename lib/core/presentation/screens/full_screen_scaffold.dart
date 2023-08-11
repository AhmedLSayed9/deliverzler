import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core_features/theme/presentation/providers/current_app_theme_provider.dart';
import '../../core_features/theme/presentation/utils/app_theme.dart';
import '../helpers/theme_helper.dart';
import '../providers/device_info_providers.dart';
import '../utils/riverpod_framework.dart';
import '../widgets/status_bar_spacer.dart';

class FullScreenScaffold extends ConsumerStatefulWidget {
  const FullScreenScaffold({
    required this.body,
    this.hasStatusBarSpace = false,
    this.statusBarColor,
    this.darkOverlays,
    this.setOlderAndroidImmersiveMode = false,
    super.key,
  });

  final Widget body;
  final bool hasStatusBarSpace;
  final Color? statusBarColor;
  final bool? darkOverlays;
  final bool setOlderAndroidImmersiveMode;

  @override
  ConsumerState<FullScreenScaffold> createState() => _FullScreenScaffoldState();
}

class _FullScreenScaffoldState extends ConsumerState<FullScreenScaffold> {
  late final bool supportsFullscreen;

  @override
  void initState() {
    super.initState();
    supportsFullscreen = ref.read(androidDeviceInfoProvider).supportsFullscreen;
    if (!supportsFullscreen && widget.setOlderAndroidImmersiveMode) {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    }
  }

  @override
  void dispose() {
    if (!supportsFullscreen && widget.setOlderAndroidImmersiveMode) {
      SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual,
        overlays: SystemUiOverlay.values,
      );
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(currentAppThemeModeProvider);
    return Scaffold(
      appBar:
          widget.hasStatusBarSpace ? StatusBarSpacer(statusBarColor: widget.statusBarColor) : null,
      body: AnnotatedRegion(
        value: getFullScreenOverlayStyle(
          context,
          darkOverlays: widget.darkOverlays ?? currentTheme == AppThemeMode.light,
          supportsFullscreen: supportsFullscreen,
        ),
        child: widget.body,
      ),
    );
  }
}

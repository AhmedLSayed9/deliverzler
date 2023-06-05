import 'package:flutter/material.dart';

import '../../core_features/theme/presentation/providers/current_app_theme_provider.dart';
import '../../core_features/theme/presentation/utils/app_theme.dart';
import '../helpers/theme_helper.dart';
import '../utils/riverpod_framework.dart';
import '../widgets/platform_widgets/platform_scaffold.dart';

class FullScreenPlatformScaffold extends ConsumerWidget {
  const FullScreenPlatformScaffold({
    required this.body,
    this.darkOverlays,
    Key? key,
  }) : super(key: key);

  final Widget body;
  final bool? darkOverlays;

  @override
  Widget build(BuildContext context, ref) {
    final currentTheme = ref.watch(currentAppThemeProvider);

    return PlatformScaffold(
      hasEmptyAppbar: false,
      body: AnnotatedRegion(
        value: getFullScreenOverlayStyle(
          context,
          darkOverlays: darkOverlays ?? currentTheme == AppTheme.light,
        ),
        child: body,
      ),
    );
  }
}

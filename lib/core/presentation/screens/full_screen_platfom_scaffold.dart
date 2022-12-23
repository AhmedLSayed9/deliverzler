import 'package:deliverzler/core/core_features/theme/presentation/utils/app_theme.dart';
import 'package:deliverzler/core/core_features/theme/presentation/providers/current_app_theme_provider.dart';
import 'package:deliverzler/core/presentation/helpers/theme_helper.dart';
import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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

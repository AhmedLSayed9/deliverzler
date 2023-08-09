import 'package:flutter/material.dart';

import '../../../../core/core_features/theme/presentation/utils/app_static_colors.dart';
import '../../../../core/core_features/theme/presentation/utils/custom_colors.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../providers/map_controller_provider.dart';

class MapFloatingActionButton extends ConsumerWidget {
  const MapFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      bottom: 32,
      right: 28,
      child: SizedBox(
        height: 56,
        width: 56,
        child: FloatingActionButton(
          heroTag: const Text('fab1'),
          backgroundColor: AppStaticColors.blue,
          elevation: 2,
          onPressed: () {
            ref.read(mapControllerProvider.notifier).centerFocus();
          },
          child: Icon(
            Icons.center_focus_strong,
            color: customColors(context).whiteColor,
          ),
        ),
      ),
    );
  }
}

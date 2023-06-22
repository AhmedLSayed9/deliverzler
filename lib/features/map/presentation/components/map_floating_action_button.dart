import 'package:flutter/material.dart';

import '../../../../core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import '../../../../core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../providers/map_controller_provider.dart';

class MapFloatingActionButton extends ConsumerWidget {
  const MapFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Positioned(
      bottom: Sizes.mapFABBottom,
      right: Sizes.mapFABRight,
      child: SizedBox(
        height: Sizes.mapFABRadius,
        width: Sizes.mapFABRadius,
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

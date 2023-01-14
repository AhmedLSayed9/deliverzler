import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import 'package:deliverzler/features/map/presentation/providers/map_controller_provider.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MapFloatingActionButton extends ConsumerWidget {
  const MapFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
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

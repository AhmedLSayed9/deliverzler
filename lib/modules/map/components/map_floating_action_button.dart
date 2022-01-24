import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/modules/map/viewmodels/main_map_viewmodel.dart';
import 'package:deliverzler/modules/map/viewmodels/map_current_location_viewmodel.dart';

class MapFloatingActionButton extends ConsumerWidget {
  const MapFloatingActionButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final mainMapVM = ref.watch(mainMapViewModel.notifier);

    return Container(
      margin:
          EdgeInsets.fromLTRB(0, 0, Sizes.hMarginComment, Sizes.vMarginMedium),
      child: FloatingActionButton(
        heroTag: const Text('fab1'),
        child: const Icon(
          Icons.center_focus_strong,
          color: AppColors.white,
        ),
        backgroundColor: AppColors.blue,
        elevation: 2,
        onPressed: () {
          if (mainMapVM.mapMarkersBounds == null) {
            ref.read(mapCurrentLocationViewModel).animateToCurrentLocation();
          } else {
            mainMapVM.animateToMarkersBounds();
          }
        },
      ),
    );
  }
}

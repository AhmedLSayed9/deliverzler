import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../core/core_features/theme/presentation/providers/current_app_theme_provider.dart';
import '../../../../core/core_features/theme/presentation/utils/app_theme.dart';
import '../../../../core/presentation/providers/provider_utils.dart';
import '../../../../core/presentation/utils/functional.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/entities/place_directions.dart';
import '../helpers/map_style_helper.dart';
import '../utils/constants.dart';
import 'my_location_providers/my_location_camera_position_provider.dart';
import 'target_location_providers/target_location_directions_provider.dart';

part 'map_controller_provider.g.dart';

@riverpod
class CurrentMapController extends _$CurrentMapController with NotifierUpdate {
  @override
  GoogleMapController? build() => null;
}

@riverpod
class MapController extends _$MapController {
  @override
  GoogleMapController? build() {
    state = ref.watch(currentMapControllerProvider);
    ref.listen<AppTheme>(
      currentAppThemeProvider,
      (previous, next) async {
        final isDark = next == AppTheme.dark;
        state?.setMapStyle(await MapStyleHelper.getMapStyle(isDark));
      },
    );
    ref.listen<Option<PlaceDirections>>(
      targetLocationDirectionsProvider,
      (previous, next) {
        if (next is Some<PlaceDirections>) {
          state?.animateCamera(
            CameraUpdate.newLatLngBounds(
              next.value.bounds,
              defaultBoundsPadding,
            ),
          );
        }
      },
    );
    return state;
  }

  void centerFocus() {
    final directions = ref.read(targetLocationDirectionsProvider);
    directions.fold(
      () => _animateToMyLocation(),
      (directions) => _animateToBounds(directions.bounds),
    );
  }

  void _animateToMyLocation() {
    final myLoc = ref.read(myLocationCameraPositionProvider);
    state?.animateCamera(
      CameraUpdate.newCameraPosition(myLoc),
    );
  }

  void _animateToBounds(LatLngBounds bounds) {
    state?.animateCamera(
      CameraUpdate.newLatLngBounds(
        bounds,
        defaultBoundsPadding,
      ),
    );
  }
}

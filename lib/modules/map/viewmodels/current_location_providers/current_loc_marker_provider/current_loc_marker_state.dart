import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'current_loc_marker_state.freezed.dart';

@freezed
abstract class CurrentLocMarkerState with _$CurrentLocMarkerState {
  const factory CurrentLocMarkerState.loading() = _Loading;

  const factory CurrentLocMarkerState.available(Marker marker, Circle circle) =
      _Available;
}

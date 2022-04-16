import 'package:deliverzler/modules/home/utils/location_error.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';

part 'location_service_state.freezed.dart';

@freezed
abstract class LocationServiceState with _$LocationServiceState {
  const factory LocationServiceState.loading() = _Loading;

  const factory LocationServiceState.error(LocationError error) = _Error;

  const factory LocationServiceState.available(Position location) = _Available;
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_service_state.freezed.dart';

@freezed
abstract class LocationServiceState with _$LocationServiceState {
  const factory LocationServiceState.loading() = _Loading;

  const factory LocationServiceState.loadingLocation() = _LoadingLocation;

  const factory LocationServiceState.error(String errorText) = _Error;

  const factory LocationServiceState.available() = _Available;
}

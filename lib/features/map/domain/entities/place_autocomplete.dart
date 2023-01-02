import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_autocomplete.freezed.dart';

@freezed
class PlaceAutocomplete with _$PlaceAutocomplete {
  const factory PlaceAutocomplete({
    required String placeId,
    required String description,
    required String mainText,
    required String secondaryText,
  }) = _PlaceAutocomplete;
}

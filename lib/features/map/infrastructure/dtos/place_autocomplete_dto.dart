import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/place_autocomplete.dart';

part 'place_autocomplete_dto.freezed.dart';

part 'place_autocomplete_dto.g.dart';

@Freezed(toJson: false)
class PlaceAutocompleteDto with _$PlaceAutocompleteDto {
  const PlaceAutocompleteDto._();

  const factory PlaceAutocompleteDto({
    @JsonKey(name: 'place_id') required String placeId,
    @JsonKey(name: 'description') required String description,
    @JsonKey(readValue: _readMainText) required String mainText,
    @JsonKey(readValue: _readSecondaryText) required String secondaryText,
  }) = _PlaceAutocompleteDto;

  factory PlaceAutocompleteDto.fromJson(Map<String, dynamic> json) =>
      _$PlaceAutocompleteDtoFromJson(json);

  static List<PlaceAutocompleteDto> parseListOfMap(List<dynamic> data) {
    return List<PlaceAutocompleteDto>.from(
      data.map(
        (place) => (PlaceAutocompleteDto.fromJson(place)),
      ),
    );
  }

  factory PlaceAutocompleteDto.fromDomain(PlaceAutocomplete autocomplete) {
    return PlaceAutocompleteDto(
      placeId: autocomplete.placeId,
      description: autocomplete.description,
      mainText: autocomplete.mainText,
      secondaryText: autocomplete.secondaryText,
    );
  }

  PlaceAutocomplete toDomain() {
    return PlaceAutocomplete(
      placeId: placeId,
      description: description,
      mainText: mainText,
      secondaryText: secondaryText,
    );
  }
}

String _readMainText(Map json, String key) =>
    json['structured_formatting']['main_text'];

String _readSecondaryText(Map json, String key) =>
    json['structured_formatting']['secondary_text'];

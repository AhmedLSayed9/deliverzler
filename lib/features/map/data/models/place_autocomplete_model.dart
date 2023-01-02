import 'package:deliverzler/features/map/domain/entities/place_autocomplete.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'place_autocomplete_model.freezed.dart';

part 'place_autocomplete_model.g.dart';

@Freezed(toJson: false)
class PlaceAutocompleteModel with _$PlaceAutocompleteModel {
  const PlaceAutocompleteModel._();

  const factory PlaceAutocompleteModel({
    @JsonKey(name: 'place_id') required String placeId,
    @JsonKey(name: 'description') required String description,
    @JsonKey(readValue: _readMainText) required String mainText,
    @JsonKey(readValue: _readSecondaryText) required String secondaryText,
  }) = _PlaceAutocompleteModel;

  factory PlaceAutocompleteModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceAutocompleteModelFromJson(json);

  static List<PlaceAutocompleteModel> parseListOfMap(List<dynamic> data) {
    return List<PlaceAutocompleteModel>.from(
      data.map(
        (place) => (PlaceAutocompleteModel.fromJson(place)),
      ),
    );
  }

  factory PlaceAutocompleteModel.fromEntity(PlaceAutocomplete autocomplete) {
    return PlaceAutocompleteModel(
      placeId: autocomplete.placeId,
      description: autocomplete.description,
      mainText: autocomplete.mainText,
      secondaryText: autocomplete.secondaryText,
    );
  }

  PlaceAutocomplete toEntity() {
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

import 'package:deliverzler/features/map/domain/entities/place_autocomplete.dart';

class PlaceAutocompleteModel extends PlaceAutocomplete {
  const PlaceAutocompleteModel({
    required super.placeId,
    required super.description,
    required super.mainText,
    required super.secondaryText,
  });

  factory PlaceAutocompleteModel.fromMap(Map<String, dynamic> map) {
    return PlaceAutocompleteModel(
      placeId: map['place_id'],
      description: map['description'],
      mainText: map['structured_formatting']['main_text'],
      secondaryText: map['structured_formatting']['secondary_text'],
    );
  }

  static List<PlaceAutocompleteModel> parseListOfMap(List<dynamic> data) {
    return List<PlaceAutocompleteModel>.from(
      data.map(
        (place) => (PlaceAutocompleteModel.fromMap(place)),
      ),
    );
  }
}

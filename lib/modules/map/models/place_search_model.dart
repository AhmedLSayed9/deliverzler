class PlaceSearchModel {
  final String placeId;
  final String description;
  final String mainText;
  final String secondaryText;

  PlaceSearchModel({
    required this.placeId,
    required this.description,
    required this.mainText,
    required this.secondaryText,
  });

  Map<String, dynamic> toMap() {
    return {
      'placeId': placeId,
      'description': description,
      'mainText': mainText,
      'secondaryText': secondaryText,
    };
  }

  factory PlaceSearchModel.fromMap(Map<String, dynamic> map) {
    return PlaceSearchModel(
      placeId: map['place_id'] as String,
      description: map['description'] as String,
      mainText: map['structured_formatting']['main_text'] as String,
      secondaryText: map['structured_formatting']['secondary_text'] as String,
    );
  }
}

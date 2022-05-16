import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:deliverzler/core/errors/failures.dart';
import 'package:deliverzler/modules/map/models/place_details_model.dart';
import 'package:deliverzler/modules/map/models/place_directions_model.dart';
import 'package:deliverzler/modules/map/models/place_search_model.dart';
import 'package:geolocator/geolocator.dart';

abstract class IMapRepo {
  Future<Either<Failure?, List<PlaceSearchModel>>> getPlaceSearchSuggestions({
    required String placeName,
    required String sessionToken,
  });

  Future<Either<Failure?, PlaceDetailsModel>> getPlaceDetails({
    required String placeId,
    required String sessionToken,
  });

  Future<Either<Failure?, PlaceDirectionsModel>> getPlaceDirections({
    required Position origin,
    required GeoPoint destination,
  });
}

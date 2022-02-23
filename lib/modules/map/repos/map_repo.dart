import 'package:dartz/dartz.dart';
import 'package:deliverzler/core/errors/failures.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:deliverzler/core/services/apis_services/apis_caller.dart';
import 'package:deliverzler/core/services/apis_services/apis_paths.dart';
import 'package:deliverzler/modules/map/models/place_directions_model.dart';
import 'package:deliverzler/modules/map/utils/constants.dart';
import 'package:deliverzler/modules/map/models/place_search_model.dart';
import 'package:deliverzler/modules/map/models/place_details_model.dart';

class MapRepo {
  MapRepo._();

  static final MapRepo instance = MapRepo._();

  final ApisCaller _apiCaller = ApisCaller.instance;

  Future<Either<Failure?, List<PlaceSearchModel>>> getPlaceSearchSuggestions({
    required String placeName,
    required String sessionToken,
  }) async {
    return await _apiCaller.getData(
      path: ApisPaths.googleMapAutoCompletePath(),
      queryParameters: {
        'input': placeName,
        'types': '(cities)',
        'components': 'country:eg',
        'key': googleMapAPIKey,
        'sessiontoken': sessionToken,
      },
      builder: (data) {
        if (data != null && data is! ServerFailure && data['status'] == 'OK') {
          return Right(List<PlaceSearchModel>.from(
            data['predictions'].map(
              (e) => PlaceSearchModel.fromMap(e),
            ),
          ));
        } else {
          return Left(data);
        }
      },
    );
  }

  Future<PlaceDetailsModel?> getPlaceGeometry({
    required String placeId,
    required String sessionToken,
  }) async {
    return await _apiCaller.getData(
        path: ApisPaths.googleMapPlaceDetailsPath(),
        queryParameters: {
          'place_id': placeId,
          'fields': 'geometry',
          'key': googleMapAPIKey,
          'sessiontoken': sessionToken,
        },
        builder: (data) {
          if (data != null && data['status'] == 'OK') {
            return PlaceDetailsModel.fromMap(data['result']);
          }
          return null;
        });
  }

  Future<PlaceDirectionsModel?> getPlaceDirections({
    required LatLng origin,
    required LatLng destination,
  }) async {
    return await _apiCaller.getData(
        path: ApisPaths.googleMapDirectionsPath(),
        queryParameters: {
          'origin': '${origin.latitude},${origin.longitude}',
          'destination': '${destination.latitude},${destination.longitude}',
          'key': googleMapAPIKey,
        },
        builder: (data) {
          if (data != null && data['status'] == 'OK') {
            return PlaceDirectionsModel.fromMap(data);
          }
          return null;
        });
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverzler/core/domain/use_cases/use_case_base.dart';
import 'package:deliverzler/features/map/data/repos/map_repo.dart';
import 'package:deliverzler/features/map/domain/entities/place_directions.dart';
import 'package:deliverzler/features/map/domain/repos/i_map_repo.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getPlaceDirectionsUCProvider = Provider(
  (ref) => GetPlaceDirectionsUC(
    ref,
    mapRepo: ref.watch(mapRepoProvider),
  ),
);

class GetPlaceDirectionsUC
    implements UseCaseBase<PlaceDirections, GetPlaceDirectionsParams> {
  GetPlaceDirectionsUC(this.ref, {required this.mapRepo});

  final Ref ref;
  final IMapRepo mapRepo;

  @override
  Future<PlaceDirections> call(GetPlaceDirectionsParams params) async {
    return await mapRepo.getPlaceDirections(params);
  }
}

class GetPlaceDirectionsParams extends Equatable {
  final CancelToken cancelToken;
  final Position origin;
  final GeoPoint destination;

  const GetPlaceDirectionsParams({
    required this.cancelToken,
    required this.origin,
    required this.destination,
  });

  Map<String, String> toMap() {
    return {
      'origin': '${origin.latitude},${origin.longitude}',
      'destination': '${destination.latitude},${destination.longitude}',
    };
  }

  @override
  List<Object> get props => [origin, destination];
}

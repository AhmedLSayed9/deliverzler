import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/domain/use_cases/use_case_base.dart';
import '../../data/repos/map_repo.dart';
import '../entities/place_directions.dart';
import '../repos/i_map_repo.dart';

part 'get_place_directions_uc.freezed.dart';

part 'get_place_directions_uc.g.dart';

@Riverpod(keepAlive: true)
GetPlaceDirectionsUC getPlaceDirectionsUC(GetPlaceDirectionsUCRef ref) {
  return GetPlaceDirectionsUC(
    mapRepo: ref.watch(mapRepoProvider),
  );
}

class GetPlaceDirectionsUC
    implements UseCaseBase<PlaceDirections, GetPlaceDirectionsParams> {
  GetPlaceDirectionsUC({required this.mapRepo});

  final IMapRepo mapRepo;

  @override
  Future<PlaceDirections> call(GetPlaceDirectionsParams params) async {
    return await mapRepo.getPlaceDirections(params);
  }
}

@Freezed(toJson: true)
class GetPlaceDirectionsParams with _$GetPlaceDirectionsParams {
  const factory GetPlaceDirectionsParams({
    @JsonKey(ignore: true) required CancelToken cancelToken,
    @JsonKey(toJson: _toJsonOrigin) required Position origin,
    @JsonKey(toJson: _toJsonDestination) required GeoPoint destination,
  }) = _GetPlaceDirectionsParams;
}

String _toJsonOrigin(Position p) => '${p.latitude},${p.longitude}';

String _toJsonDestination(GeoPoint d) => '${d.latitude},${d.longitude}';

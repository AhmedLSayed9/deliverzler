import 'dart:async';

import 'package:deliverzler/features/map/data/data_sources/map_remote_data_source.dart';
import 'package:deliverzler/features/map/domain/entities/place_autocomplete.dart';
import 'package:deliverzler/features/map/domain/entities/place_details.dart';
import 'package:deliverzler/features/map/domain/entities/place_directions.dart';
import 'package:deliverzler/features/map/domain/repos/i_map_repo.dart';
import 'package:deliverzler/features/map/domain/use_cases/get_place_autocomplete_uc.dart';
import 'package:deliverzler/features/map/domain/use_cases/get_place_details_uc.dart';
import 'package:deliverzler/features/map/domain/use_cases/get_place_directions_uc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_repo.g.dart';

@Riverpod(keepAlive: true)
IMapRepo mapRepo(MapRepoRef ref) {
  return MapRepo(
    remoteDataSource: ref.watch(mapRemoteDataSourceProvider),
  );
}

class MapRepo implements IMapRepo {
  MapRepo({
    required this.remoteDataSource,
  });

  final IMapRemoteDataSource remoteDataSource;

  @override
  Future<List<PlaceAutocomplete>> getPlaceAutocomplete(
      GetPlaceAutocompleteParams params) async {
    final autocomplete = await remoteDataSource.getPlaceAutocomplete(params);
    return autocomplete.map((item) => item.toEntity()).toList();
  }

  @override
  Future<PlaceDetails> getPlaceDetails(GetPlaceDetailsParams params) async {
    final placeDetails = await remoteDataSource.getPlaceDetails(params);
    return placeDetails.toEntity();
  }

  @override
  Future<PlaceDirections> getPlaceDirections(
      GetPlaceDirectionsParams params) async {
    final directions = await remoteDataSource.getPlaceDirections(params);
    return directions.toEntity();
  }
}

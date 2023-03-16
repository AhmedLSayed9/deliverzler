import 'dart:async';

import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/entities/place_autocomplete.dart';
import '../../domain/entities/place_details.dart';
import '../../domain/entities/place_directions.dart';
import '../../domain/repos/i_map_repo.dart';
import '../../domain/use_cases/get_place_autocomplete_uc.dart';
import '../../domain/use_cases/get_place_details_uc.dart';
import '../../domain/use_cases/get_place_directions_uc.dart';
import '../data_sources/map_remote_data_source.dart';

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

import 'dart:async';

import 'package:dio/dio.dart';

import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/place_autocomplete.dart';
import '../../domain/place_details.dart';
import '../../domain/place_directions.dart';
import '../data_sources/map_remote_data_source.dart';
import '../dtos/place_directions_dto.dart';

part 'map_repo.g.dart';

@Riverpod(keepAlive: true)
MapRepo mapRepo(MapRepoRef ref) {
  return MapRepo(
    remoteDataSource: ref.watch(mapRemoteDataSourceProvider),
  );
}

class MapRepo {
  MapRepo({
    required this.remoteDataSource,
  });

  final MapRemoteDataSource remoteDataSource;

  Future<List<PlaceAutocomplete>> getPlaceAutocomplete(
    String placeName, {
    CancelToken? cancelToken,
  }) async {
    final autocomplete =
        await remoteDataSource.getPlaceAutocomplete(placeName, cancelToken: cancelToken);
    return autocomplete.map((item) => item.toDomain()).toList();
  }

  Future<PlaceDetails> getPlaceDetails(
    String placeId, {
    CancelToken? cancelToken,
  }) async {
    final placeDetails = await remoteDataSource.getPlaceDetails(placeId, cancelToken: cancelToken);
    return placeDetails.toDomain();
  }

  Future<PlaceDirections> getPlaceDirections(
    PlaceDirectionsQuery query, {
    CancelToken? cancelToken,
  }) async {
    final dto = PlaceDirectionsQueryDto.fromDomain(query);
    final directions = await remoteDataSource.getPlaceDirections(dto, cancelToken: cancelToken);
    return directions.toDomain();
  }
}

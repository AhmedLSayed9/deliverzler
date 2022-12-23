import 'package:deliverzler/core/domain/use_cases/use_case_base.dart';
import 'package:deliverzler/features/map/data/repos/map_repo.dart';
import 'package:deliverzler/features/map/domain/entities/place_autocomplete.dart';
import 'package:deliverzler/features/map/domain/repos/i_map_repo.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_place_autocomplete_uc.g.dart';

@Riverpod(keepAlive: true)
GetPlaceAutocompleteUC getPlaceAutocompleteUC(GetPlaceAutocompleteUCRef ref) {
  return GetPlaceAutocompleteUC(
    mapRepo: ref.watch(mapRepoProvider),
  );
}

class GetPlaceAutocompleteUC
    implements
        UseCaseBase<List<PlaceAutocomplete>, GetPlaceAutocompleteParams> {
  GetPlaceAutocompleteUC({required this.mapRepo});

  final IMapRepo mapRepo;

  @override
  Future<List<PlaceAutocomplete>> call(
      GetPlaceAutocompleteParams params) async {
    return await mapRepo.getPlaceAutocomplete(params);
  }
}

class GetPlaceAutocompleteParams extends Equatable {
  final CancelToken cancelToken;
  final String placeName;

  const GetPlaceAutocompleteParams({
    required this.cancelToken,
    required this.placeName,
  });

  Map<String, String> toMap() {
    return {
      'input': placeName,
    };
  }

  @override
  List<Object> get props => [placeName];
}

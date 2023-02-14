import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/domain/use_cases/use_case_base.dart';
import '../../data/repos/map_repo.dart';
import '../entities/place_autocomplete.dart';
import '../repos/i_map_repo.dart';

part 'get_place_autocomplete_uc.freezed.dart';

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

@Freezed(toJson: true)
class GetPlaceAutocompleteParams with _$GetPlaceAutocompleteParams {
  const factory GetPlaceAutocompleteParams({
    @JsonKey(ignore: true) required CancelToken cancelToken,
    @JsonKey(name: 'input') required String placeName,
  }) = _GetPlaceAutocompleteParams;
}

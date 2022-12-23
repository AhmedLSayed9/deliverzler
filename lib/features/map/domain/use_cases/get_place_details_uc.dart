import 'package:deliverzler/core/domain/use_cases/use_case_base.dart';
import 'package:deliverzler/features/map/data/repos/map_repo.dart';
import 'package:deliverzler/features/map/domain/entities/place_details.dart';
import 'package:deliverzler/features/map/domain/repos/i_map_repo.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getPlaceDetailsUCProvider = Provider(
  (ref) => GetPlaceDetailsUC(
    ref,
    mapRepo: ref.watch(mapRepoProvider),
  ),
);

class GetPlaceDetailsUC
    implements UseCaseBase<PlaceDetails, GetPlaceDetailsParams> {
  GetPlaceDetailsUC(this.ref, {required this.mapRepo});

  final Ref ref;
  final IMapRepo mapRepo;

  @override
  Future<PlaceDetails> call(GetPlaceDetailsParams params) async {
    return await mapRepo.getPlaceDetails(params);
  }
}

class GetPlaceDetailsParams extends Equatable {
  final CancelToken cancelToken;
  final String placeId;

  const GetPlaceDetailsParams({
    required this.cancelToken,
    required this.placeId,
  });

  Map<String, String> toMap() {
    return {
      'place_id': placeId,
    };
  }

  @override
  List<Object> get props => [placeId];
}

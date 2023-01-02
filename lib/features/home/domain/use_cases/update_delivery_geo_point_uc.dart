import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverzler/core/domain/entities/json_converters/geo_point_converter.dart';
import 'package:deliverzler/core/domain/use_cases/use_case_base.dart';
import 'package:deliverzler/features/home/data/repos/home_repo.dart';
import 'package:deliverzler/features/home/domain/repos/i_home_repo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_delivery_geo_point_uc.freezed.dart';

part 'update_delivery_geo_point_uc.g.dart';

@Riverpod(keepAlive: true)
UpdateDeliveryGeoPointUC updateDeliveryGeoPointUC(
    UpdateDeliveryGeoPointUCRef ref) {
  return UpdateDeliveryGeoPointUC(
    ref,
    homeRepo: ref.watch(homeRepoProvider),
  );
}

class UpdateDeliveryGeoPointUC
    implements UseCaseBase<void, UpdateDeliveryGeoPointParams> {
  UpdateDeliveryGeoPointUC(this.ref, {required this.homeRepo});

  final UpdateDeliveryGeoPointUCRef ref;
  final IHomeRepo homeRepo;

  @override
  Future<void> call(UpdateDeliveryGeoPointParams params) async {
    return await homeRepo.updateDeliveryGeoPoint(params);
  }
}

@Freezed(toJson: true)
class UpdateDeliveryGeoPointParams with _$UpdateDeliveryGeoPointParams {
  const factory UpdateDeliveryGeoPointParams({
    @JsonKey(ignore: true) required String orderId,
    @GeoPointConverter() required GeoPoint deliveryGeoPoint,
  }) = _UpdateDeliveryGeoPointParams;
}

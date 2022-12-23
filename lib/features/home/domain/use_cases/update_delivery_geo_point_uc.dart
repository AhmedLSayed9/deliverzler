import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverzler/core/domain/use_cases/use_case_base.dart';
import 'package:deliverzler/features/home/data/repos/home_repo.dart';
import 'package:deliverzler/features/home/domain/repos/i_home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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

class UpdateDeliveryGeoPointParams extends Equatable {
  final String orderId;
  final GeoPoint deliveryGeoPoint;

  const UpdateDeliveryGeoPointParams({
    required this.orderId,
    required this.deliveryGeoPoint,
  });

  Map<String, dynamic> toMap() {
    return {
      'deliveryGeoPoint': deliveryGeoPoint,
    };
  }

  @override
  List<Object> get props => [orderId, deliveryGeoPoint];
}

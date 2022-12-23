import 'package:deliverzler/core/domain/use_cases/use_case_base.dart';
import 'package:deliverzler/features/home/data/repos/home_repo.dart';
import 'package:deliverzler/features/home/domain/repos/i_home_repo.dart';
import 'package:deliverzler/features/home/presentation/utils/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final updateDeliveryStatusUCProvider = Provider(
  (ref) => UpdateDeliveryStatusUC(
    ref,
    homeRepo: ref.watch(homeRepoProvider),
  ),
);

class UpdateDeliveryStatusUC
    implements UseCaseBase<void, UpdateDeliveryStatusParams> {
  UpdateDeliveryStatusUC(this.ref, {required this.homeRepo});

  final Ref ref;
  final IHomeRepo homeRepo;

  @override
  Future<void> call(UpdateDeliveryStatusParams params) async {
    return await homeRepo.updateDeliveryStatus(params);
  }
}

class UpdateDeliveryStatusParams extends Equatable {
  final String orderId;
  final DeliveryStatus deliveryStatus;
  final String? deliveryId;
  final String? employeeCancelNote;

  const UpdateDeliveryStatusParams({
    required this.orderId,
    required this.deliveryStatus,
    this.deliveryId,
    this.employeeCancelNote,
  });

  Map<String, dynamic> toMap() {
    return {
      'deliveryStatus': deliveryStatus.name,
      if (deliveryId != null) 'deliveryId': deliveryId,
      if (employeeCancelNote != null) 'employeeCancelNote': employeeCancelNote,
    };
  }

  @override
  List<Object> get props => [orderId, deliveryStatus];
}

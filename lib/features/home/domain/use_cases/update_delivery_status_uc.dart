import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/domain/use_cases/use_case_base.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../data/repos/home_repo.dart';
import '../../presentation/utils/enums.dart';
import '../repos/i_home_repo.dart';

part 'update_delivery_status_uc.freezed.dart';

part 'update_delivery_status_uc.g.dart';

@Riverpod(keepAlive: true)
UpdateDeliveryStatusUC updateDeliveryStatusUC(UpdateDeliveryStatusUCRef ref) {
  return UpdateDeliveryStatusUC(
    ref,
    homeRepo: ref.watch(homeRepoProvider),
  );
}

class UpdateDeliveryStatusUC
    implements UseCaseBase<void, UpdateDeliveryStatusParams> {
  UpdateDeliveryStatusUC(this.ref, {required this.homeRepo});

  final UpdateDeliveryStatusUCRef ref;
  final IHomeRepo homeRepo;

  @override
  Future<void> call(UpdateDeliveryStatusParams params) async {
    return await homeRepo.updateDeliveryStatus(params);
  }
}

@Freezed(toJson: true)
class UpdateDeliveryStatusParams with _$UpdateDeliveryStatusParams {
  const factory UpdateDeliveryStatusParams({
    @JsonKey(ignore: true) required String orderId,
    required DeliveryStatus deliveryStatus,
    @JsonKey(disallowNullValue: true) String? deliveryId,
    @JsonKey(disallowNullValue: true) String? employeeCancelNote,
  }) = _UpdateDeliveryStatusParams;
}

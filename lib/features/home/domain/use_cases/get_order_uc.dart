import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/domain/use_cases/use_case_base.dart';
import '../../data/repos/home_repo.dart';
import '../entities/order.dart';
import '../repos/i_home_repo.dart';

part 'get_order_uc.g.dart';

@Riverpod(keepAlive: true)
GetOrderUC getOrderUC(GetOrderUCRef ref) {
  return GetOrderUC(
    ref,
    homeRepo: ref.watch(homeRepoProvider),
  );
}

class GetOrderUC implements UseCaseBase<AppOrder, String> {
  GetOrderUC(this.ref, {required this.homeRepo});

  final GetOrderUCRef ref;
  final IHomeRepo homeRepo;

  @override
  Future<AppOrder> call(String orderId) async {
    return await homeRepo.getOrder(orderId);
  }
}

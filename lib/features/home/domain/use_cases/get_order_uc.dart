import 'package:deliverzler/core/domain/use_cases/use_case_base.dart';
import 'package:deliverzler/features/home/data/repos/home_repo.dart';
import 'package:deliverzler/features/home/domain/entities/order.dart';
import 'package:deliverzler/features/home/domain/repos/i_home_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getOrderUCProvider = Provider(
  (ref) => GetOrderUC(
    ref,
    homeRepo: ref.watch(homeRepoProvider),
  ),
);

class GetOrderUC implements UseCaseBase<Order, String> {
  GetOrderUC(this.ref, {required this.homeRepo});

  final Ref ref;
  final IHomeRepo homeRepo;

  @override
  Future<Order> call(String orderId) async {
    return await homeRepo.getOrder(orderId);
  }
}

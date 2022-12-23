import 'package:deliverzler/core/domain/use_cases/use_case_base.dart';
import 'package:deliverzler/features/home/data/repos/home_repo.dart';
import 'package:deliverzler/features/home/domain/entities/order.dart';
import 'package:deliverzler/features/home/domain/repos/i_home_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_upcoming_orders_uc.g.dart';

@Riverpod(keepAlive: true)
GetUpcomingOrdersUC getUpcomingOrdersUC(GetUpcomingOrdersUCRef ref) {
  return GetUpcomingOrdersUC(
    ref,
    homeRepo: ref.watch(homeRepoProvider),
  );
}

class GetUpcomingOrdersUC
    implements UseCaseNoParamsBase<Stream<List<AppOrder>>> {
  GetUpcomingOrdersUC(this.ref, {required this.homeRepo});

  final GetUpcomingOrdersUCRef ref;
  final IHomeRepo homeRepo;

  @override
  Stream<List<AppOrder>> call() {
    return homeRepo.getUpcomingOrders();
  }
}

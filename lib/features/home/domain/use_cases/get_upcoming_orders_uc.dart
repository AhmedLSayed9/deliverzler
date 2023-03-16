

import '../../../../core/domain/use_cases/use_case_base.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../data/repos/home_repo.dart';
import '../entities/order.dart';
import '../repos/i_home_repo.dart';

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

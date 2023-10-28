import 'package:flutter/material.dart';

import '../../../../core/presentation/extensions/future_extensions.dart';
import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/routing/app_router.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/widgets/loading_widgets.dart';
import '../../../../core/presentation/widgets/platform_widgets/platform_refresh_indicator.dart';
import '../../../../core/presentation/widgets/seperated_sliver_child_builder_delegate.dart';
import '../../domain/value_objects.dart';
import '../providers/selected_order_provider.dart';
import '../providers/upcoming_orders_provider.dart';
import '../providers/update_delivery_status_provider/update_delivery_status_provider.dart';
import 'card_item_component.dart';

class UpcomingOrdersComponent extends ConsumerWidget {
  const UpcomingOrdersComponent({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.easyListen(
      updateDeliveryStatusControllerProvider,
      whenData: (state) {
        state.whenOrNull(
          success: (orderId, deliveryStatus) async {
            if (deliveryStatus != DeliveryStatus.onTheWay) return;
            ref.read(selectedOrderIdProvider.notifier).update((_) => Some(orderId));
            const MapRoute().go(context);
          },
        );
      },
    );

    final upcomingOrdersAsync = ref.watch(upcomingOrdersProvider);

    Future<void> refresh() async {
      return ref.refresh(upcomingOrdersProvider.future).suppressError();
    }

    return upcomingOrdersAsync.when(
      skipLoadingOnReload: true,
      skipLoadingOnRefresh: !upcomingOrdersAsync.hasError,
      data: (upcomingOrders) {
        return PlatformRefreshIndicator(
          onRefresh: refresh,
          slivers: [
            if (upcomingOrders.isNotEmpty)
              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  vertical: Sizes.screenPaddingV16,
                  horizontal: Sizes.screenPaddingH28,
                ),
                sliver: SliverList(
                  delegate: SeparatedSliverChildBuilderDelegate(
                    itemBuilder: (BuildContext context, int index) {
                      return CardItemComponent(
                        key: ValueKey(upcomingOrders[index].id),
                        order: upcomingOrders[index],
                      );
                    },
                    itemCount: upcomingOrders.length,
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: Sizes.marginV28,
                      );
                    },
                  ),
                ),
              )
            else
              SliverFillRemaining(
                child: Center(
                  child: Text(
                    tr(context).thereAreNoOrders,
                    style: TextStyles.f18(context),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        );
      },
      error: (error, st) => PlatformRefreshIndicator(
        onRefresh: refresh,
        slivers: [
          SliverFillRemaining(
            child: Center(
              child: Text(
                '${tr(context).somethingWentWrong}\n${tr(context).pleaseTryAgain}',
                style: TextStyles.f18(context),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
      loading: () => const DeliveryLoadingAnimation(),
    );
  }
}

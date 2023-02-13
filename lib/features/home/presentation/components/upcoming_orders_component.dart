import 'package:deliverzler/core/presentation/extensions/app_error_extension.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/routing/navigation_service.dart';
import 'package:deliverzler/core/presentation/routing/route_paths.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/utils/dialogs.dart';
import 'package:deliverzler/core/presentation/utils/scroll_behaviors.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';
import 'package:deliverzler/core/presentation/widgets/loading_indicators.dart';
import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_refresh_indicator.dart';
import 'package:deliverzler/core/presentation/widgets/seperated_sliver_child_builder_delegate.dart';
import 'package:deliverzler/features/home/presentation/components/card_item_component.dart';
import 'package:deliverzler/features/home/presentation/utils/enums.dart';
import 'package:deliverzler/features/home/presentation/providers/selected_order_provider.dart';
import 'package:deliverzler/features/home/presentation/providers/upcoming_orders_provider.dart';
import 'package:deliverzler/features/home/presentation/providers/update_delivery_status_provider/update_delivery_status_provider.dart';
import 'package:deliverzler/features/home/presentation/providers/update_delivery_status_provider/update_delivery_status_state.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/utils/functional.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UpcomingOrdersComponent extends ConsumerWidget {
  const UpcomingOrdersComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    ref.listen<AsyncValue<UpdateDeliveryStatusState>>(
      updateDeliveryStatusStateProvider,
      (prevState, newState) {
        prevState?.unwrapPrevious().whenOrNull(
          loading: () {
            NavigationService.dismissDialog(context);
          },
        );
        newState.unwrapPrevious().whenOrNull(
              loading: () => Dialogs.showLoadingDialog(context),
              error: (err, st) {
                Dialogs.showErrorDialog(
                  context,
                  message: err.errorMessage(context),
                );
              },
              data: (state) {
                state.whenOrNull(
                  success: (orderId, deliveryStatus) async {
                    if (deliveryStatus != DeliveryStatus.onTheWay) return;
                    final container = ProviderScope.containerOf(context);
                    final sub = container.listen(
                        selectedOrderIdProvider, (prev, value) {});
                    ref
                        .read(selectedOrderIdProvider.notifier)
                        .update((_) => Some(orderId));

                    await NavigationService.push(
                      context,
                      isNamed: true,
                      page: RoutePaths.map,
                    );
                    sub.close();
                  },
                );
              },
            );
      },
    );

    final upcomingOrdersAsync = ref.watch(upcomingOrdersProvider);

    return ScrollConfiguration(
      behavior: MainScrollBehavior(),
      child: upcomingOrdersAsync.when(
        skipLoadingOnReload: true,
        skipLoadingOnRefresh: !upcomingOrdersAsync.hasError,
        data: (upcomingOrders) {
          return PlatformRefreshIndicator(
            onRefresh: () => ref.refresh(upcomingOrdersProvider.future),
            slivers: [
              upcomingOrders.isNotEmpty
                  ? SliverPadding(
                      padding: const EdgeInsets.symmetric(
                        vertical: Sizes.screenMarginV16,
                        horizontal: Sizes.screenMarginH28,
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
                  : SliverFillRemaining(
                      child: CustomText.f18(
                        context,
                        tr(context).thereAreNoOrders,
                        //alignment: Alignment.center,
                      ),
                    ),
            ],
          );
        },
        error: (error, st) => PlatformRefreshIndicator(
          onRefresh: () => ref.refresh(upcomingOrdersProvider.future),
          slivers: [
            SliverFillRemaining(
              child: CustomText.f18(
                context,
                '${tr(context).somethingWentWrong}\n${tr(context).pleaseTryAgain}',
                //alignment: Alignment.center,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        loading: () => const SmallLoadingAnimation(),
      ),
    );
  }
}

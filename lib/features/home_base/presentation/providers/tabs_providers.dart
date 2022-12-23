import 'package:deliverzler/features/home_base/presentation/utils/tab_item.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedTabProvider = StateProvider.autoDispose<TabItem>(
  (ref) {
    return TabItem.home;
  },
);

final tabCurrentRouteProvider =
    StateProvider.autoDispose.family<String, TabItem>(
  (ref, tabItem) {
    return tabItem.initialRoute;
  },
);

final currentRouteHasAppbarProvider = StateProvider.autoDispose<bool>(
  (ref) {
    final selectedTab = ref.watch(selectedTabProvider);
    final currentRoute = ref.watch(tabCurrentRouteProvider(selectedTab));
    if (selectedTab.noAppBarRoutes.contains(currentRoute)) {
      return false;
    }
    return true;
  },
);

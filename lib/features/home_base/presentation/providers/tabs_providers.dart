import 'package:deliverzler/core/presentation/providers/provider_utils.dart';
import 'package:deliverzler/features/home_base/presentation/utils/tab_item.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tabs_providers.g.dart';

@riverpod
class SelectedTab extends _$SelectedTab with NotifierUpdate {
  @override
  TabItem build() => TabItem.home;
}

@riverpod
class TabCurrentRoute extends _$TabCurrentRoute with NotifierUpdate {
  @override
  String build(TabItem tabItem) => tabItem.initialRoute;
}


@riverpod
bool currentRouteHasAppbar(CurrentRouteHasAppbarRef ref) {
  final selectedTab = ref.watch(selectedTabProvider);
  final currentRoute = ref.watch(tabCurrentRouteProvider(selectedTab));
  if (selectedTab.noAppBarRoutes.contains(currentRoute)) {
    return false;
  }
  return true;
}
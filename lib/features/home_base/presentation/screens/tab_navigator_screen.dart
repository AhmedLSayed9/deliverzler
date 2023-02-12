import 'package:deliverzler/core/presentation/routing/navigator_route_observer.dart';
import 'package:deliverzler/features/home_base/presentation/utils/tab_item.dart';
import 'package:deliverzler/features/home_base/presentation/providers/tabs_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TabNavigatorScreen extends HookConsumerWidget {
  const TabNavigatorScreen({
    required this.tabItem,
    required this.navigatorKey,
    Key? key,
  }) : super(key: key);

  final TabItem tabItem;
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  Widget build(BuildContext context, ref) {
    useAutomaticKeepAlive();
    //This prevent disposing current route provider when switching between tabs
    //Also using autoDispose provider is necessary to reset providers when home is popped
    ref.listen(tabCurrentRouteProvider(tabItem), (previous, next) {});
    //Cache the instance of NavigatorRouteObserver to prevent re-creating it
    final navRouteObserver = useMemoized(() => NavigatorRouteObserver(
          routesStackCallBack: (List<Route> routes) {
            ref.read(tabCurrentRouteProvider(tabItem).notifier).state =
                routes.last.routeName;
          },
        ));

    return Navigator(
      key: navigatorKey,
      initialRoute: tabItem.initialRoute,
      onGenerateRoute: tabItem.onGenerateRoute,
      observers: [
        navRouteObserver,
      ],
    );
  }
}

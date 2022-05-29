import 'package:deliverzler/modules/home/utils/home_nav_screens_utils.dart';
import 'package:deliverzler/modules/home/viewmodels/home_nav_providers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NestedNavigatorScreen extends ConsumerWidget {
  final int index;
  final String screenPath;
  final Route<dynamic>? Function(RouteSettings)? onGenerateRoute;

  const NestedNavigatorScreen({
    required this.index,
    required this.screenPath,
    required this.onGenerateRoute,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _navRouteObserver = ref.watch(HomeNavProviders.routeObservers[index]);

    return Navigator(
      key: HomeNavScreensUtils.homeNavScreensKeys[index],
      initialRoute: screenPath,
      onGenerateRoute: onGenerateRoute,
      observers: [
        _navRouteObserver,
      ],
    );
  }
}

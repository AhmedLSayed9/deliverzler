import 'package:flutter/material.dart';

import '../../../data/network/network_info.dart';
import '../../routing/navigation_service.dart';
import '../../routing/route_paths.dart';
import '../../utils/riverpod_framework.dart';
import '../../widgets/responsive_widgets/widget_builders.dart';
import 'no_internet_screen_compact.dart';

class NoInternetScreen extends HookConsumerWidget {
  const NoInternetScreen({
    this.offAll = false,
    Key? key,
  }) : super(key: key);
  final bool offAll;

  @override
  Widget build(BuildContext context, ref) {
    final networkInfo = ref.watch(networkInfoProvider);
    final isLoading = useState<bool>(false);

    Future<void> retryOnPressed() async {
      if (isLoading.value) return;

      isLoading.value = true;
      await networkInfo.hasInternetConnection.then(
        (value) {
          if (value) {
            if (offAll) {
              NavigationService.pushReplacementAll(
                context,
                isNamed: true,
                page: RoutePaths.coreSplash,
              );
            } else {
              //Use pop instead of maybePop to be able to back to nested navigator from this screen
              NavigationService.goBack(context, maybePop: false);
            }
          }
        },
      );
      isLoading.value = false;
    }

    return WillPopScope(
      onWillPop: () {
        NavigationService.pushReplacementAll(
          context,
          isNamed: true,
          page: RoutePaths.coreSplash,
        );
        return Future.value(true);
      },
      child: WindowClassLayout(
        compact: (_) => OrientationLayout(
          portrait: (_) => NoInternetScreenCompact(
            retryOnPressed: retryOnPressed,
          ),
        ),
      ),
    );
  }
}

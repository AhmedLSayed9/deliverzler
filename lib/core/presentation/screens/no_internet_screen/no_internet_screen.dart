import 'package:flutter/material.dart';

import '../../../infrastructure/network/network_info.dart';
import '../../routing/app_router.dart';
import '../../utils/riverpod_framework.dart';
import '../../widgets/responsive_widgets/widget_builders.dart';
import 'no_internet_screen_compact.dart';

class NoInternetScreen extends HookConsumerWidget {
  const NoInternetScreen({Key? key}) : super(key: key);

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
            const SplashRoute().go(context);
          }
        },
      );
      isLoading.value = false;
    }

    return WillPopScope(
      onWillPop: () {
        const SplashRoute().go(context);
        return Future.value(false);
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

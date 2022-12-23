import 'package:deliverzler/core/data/network/network_info.dart';
import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/components/data_error_component.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/routing/navigation_service.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/routing/route_paths.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class NoInternetConnectionScreen extends HookConsumerWidget {
  final bool offAll;

  const NoInternetConnectionScreen({
    this.offAll = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final networkInfo = ref.watch(networkInfoProvider);
    final isLoading = useState<bool>(false);

    return WillPopScope(
      onWillPop: () {
        NavigationService.pushReplacementAll(
          context,
          isNamed: true,
          page: RoutePaths.coreSplash,
        );
        return Future.value(true);
      },
      child: PlatformScaffold(
        body: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: Sizes.screenPaddingH40(context)),
          child: DataErrorComponent(
            title: tr(context).noInternetConnection,
            description: tr(context).pleaseCheckYourDeviceNetwork,
            onPressed: isLoading.value
                ? () {}
                : () async {
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
                  },
          ),
        ),
      ),
    );
  }
}

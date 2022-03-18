import 'package:deliverzler/core/components/data_error_component.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/screens/popup_page.dart';
import 'package:deliverzler/core/services/init_services/connectivity_service.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/routing/route_paths.dart';
import 'package:flutter/material.dart';

class NoInternetConnection extends StatelessWidget {
  final bool offAll;

  const NoInternetConnection({
    this.offAll = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopUpPage(
      onWillPop: () {
        NavigationService.pushReplacementAll(
          isNamed: true,
          page: RoutePaths.coreSplash,
        );
        return Future.value(true);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Sizes.screenHPaddingDefault(context)),
        child: DataErrorComponent(
          title: tr(context).noInternetConnection,
          description: tr(context).pleaseCheckYourDeviceNetwork,
          onPressed: () {
            ConnectivityService.instance.checkIfConnected().then((value) {
              if (value) {
                if (offAll) {
                  NavigationService.pushReplacementAll(
                    isNamed: true,
                    page: RoutePaths.coreSplash,
                  );
                } else {
                  NavigationService.goBack();
                }
              }
            });
          },
        ),
      ),
    );
  }
}

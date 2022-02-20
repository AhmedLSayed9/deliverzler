import 'package:deliverzler/core/services/init_services/localization_service.dart';
import 'package:deliverzler/core/screens/popup_page.dart';
import 'package:deliverzler/core/services/init_services/connectivity_service.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/routing/route_paths.dart';
import 'package:deliverzler/core/widgets/custom_button.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/core/widgets/loading_indicators.dart';
import 'package:flutter/material.dart';

class NoInternetConnection extends StatelessWidget {
  final bool fromSplash;

  const NoInternetConnection({
    this.fromSplash = false,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingIndicators.instance.smallLoadingAnimation(context),
          SizedBox(
            height: Sizes.vMarginHigh,
          ),
          CustomText.h2(
            context,
            tr(context).noInternetConnection,
            alignment: Alignment.center,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Sizes.vMarginSmallest,
          ),
          CustomText.h5(
            context,
            tr(context).pleaseCheckYourDeviceNetwork,
            alignment: Alignment.center,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: Sizes.vMarginHigh,
          ),
          CustomButton(
            child: CustomText.h5(
              context,
              tr(context).retry,
              color: Colors.white,
              weight: FontStyles.fontWeightMedium,
              alignment: Alignment.center,
            ),
            onPressed: () {
              ConnectivityService.instance.checkIfConnected().then((value) {
                if (value) {
                  if (fromSplash) {
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
            buttonColor: AppColors.primaryColor,
          ),
        ],
      ),
    );
  }
}

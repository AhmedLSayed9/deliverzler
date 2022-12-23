import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';
import 'package:deliverzler/core/presentation/services/connection_stream_service.dart';
import 'package:deliverzler/core/presentation/helpers/localization_helper.dart';
import 'package:deliverzler/core/presentation/widgets/custom_toast.dart';
import 'package:flutter/material.dart';

abstract class Toasts {
  static showTitledToast(
    BuildContext context, {
    required String title,
    required String description,
  }) {
    CustomToast.showToast(
      context,
      positionedToastBuilder: (context, child) {
        return Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: child,
        );
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomText.f18(
            context,
            title,
            weight: FontStyles.fontWeightSemiBold,
            color: AppStaticColors.lightBlack,
          ),
          SizedBox(
            height: Sizes.marginV4(context),
          ),
          CustomText.f14(
            context,
            description,
            color: AppStaticColors.lightBlack,
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(
        horizontal: Sizes.marginH22(context),
      ),
    );
  }

  static showConnectionToast(
    BuildContext context, {
    required ConnectionStatus connectionStatus,
  }) {
    CustomToast.showToast(
      context,
      child: Row(
        children: <Widget>[
          connectionStatus == ConnectionStatus.disconnected
              ? Icon(
                  Icons.wifi_off,
                  size: Sizes.icon24(context),
                )
              : Icon(
                  Icons.wifi,
                  size: Sizes.icon24(context),
                  color: customColors(context).greenColor,
                ),
          CustomText.f18(
            context,
            connectionStatus == ConnectionStatus.disconnected
                ? tr(context).youAreCurrentlyOffline
                : tr(context).youAreBackOnline,
            weight: FontStyles.fontWeightSemiBold,
            color: AppStaticColors.lightBlack,
            padding: EdgeInsetsDirectional.only(
              start: Sizes.paddingH16(context),
            ),
          ),
        ],
      ),
    );
  }

  static Future showBackgroundMessageToast(
    BuildContext context, {
    required String message,
  }) async {
    await CustomToast.showBackgroundToast(
      context,
      msg: message,
    );
  }
}

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
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CustomText.f16(
            context,
            title,
            weight: FontStyles.fontWeightSemiBold,
            color: AppStaticColors.lightBlack,
          ),
          const SizedBox(
            height: Sizes.marginV2,
          ),
          CustomText.f14(
            context,
            description,
            color: AppStaticColors.lightBlack,
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: Sizes.marginH20,
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
              ? const Icon(
                  Icons.wifi_off,
                  size: Sizes.icon24,
                )
              : Icon(
                  Icons.wifi,
                  size: Sizes.icon24,
                  color: customColors(context).greenColor,
                ),
          const SizedBox(
            width: Sizes.marginH12,
          ),
          CustomText.f16(
            context,
            connectionStatus == ConnectionStatus.disconnected
                ? tr(context).youAreCurrentlyOffline
                : tr(context).youAreBackOnline,
            weight: FontStyles.fontWeightSemiBold,
            color: AppStaticColors.lightBlack,
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

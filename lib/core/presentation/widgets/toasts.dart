import 'package:flutter/material.dart';

import '../../core_features/theme/presentation/utils/app_static_colors.dart';
import '../../core_features/theme/presentation/utils/custom_colors.dart';
import '../helpers/localization_helper.dart';
import '../../infrastructure/services/connection_stream_service.dart';
import '../styles/styles.dart';
import 'custom_toast.dart';

abstract class Toasts {
  static void showTitledToast(
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
          Text(
            title,
            style: TextStyles.f16SemiBold(context).copyWith(color: AppStaticColors.lightBlack),
          ),
          const SizedBox(
            height: Sizes.marginV2,
          ),
          Text(
            description,
            style: TextStyles.f14(context).copyWith(color: AppStaticColors.lightBlack),
          ),
        ],
      ),
      margin: const EdgeInsets.symmetric(
        horizontal: Sizes.marginH20,
      ),
    );
  }

  static void showConnectionToast(
    BuildContext context, {
    required ConnectionStatus connectionStatus,
  }) {
    CustomToast.showToast(
      context,
      child: Row(
        children: <Widget>[
          if (connectionStatus == ConnectionStatus.disconnected)
            const Icon(
              Icons.wifi_off,
              size: Sizes.icon24,
            )
          else
            Icon(
              Icons.wifi,
              size: Sizes.icon24,
              color: customColors(context).greenColor,
            ),
          const SizedBox(
            width: Sizes.marginH12,
          ),
          Text(
            connectionStatus == ConnectionStatus.disconnected
                ? tr(context).youAreCurrentlyOffline
                : tr(context).youAreBackOnline,
            style: TextStyles.f16SemiBold(context).copyWith(color: AppStaticColors.lightBlack),
          ),
        ],
      ),
    );
  }

  static Future<void> showBackgroundMessageToast(
    BuildContext context, {
    required String message,
  }) async {
    await CustomToast.showBackgroundToast(
      context,
      msg: message,
    );
  }
}

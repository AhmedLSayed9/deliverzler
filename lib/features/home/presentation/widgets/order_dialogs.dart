import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/routing/navigation_service.dart';
import '../../../../core/presentation/styles/font_styles.dart';
import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/widgets/dialogs.dart';
import '../../../../core/presentation/widgets/toasts.dart';
import '../../../../core/presentation/widgets/custom_elevated_button.dart';
import '../../../../core/presentation/widgets/custom_text.dart';
import '../../domain/order.dart';
import '../components/dialogs/cancel_order_dialog.dart';
import '../components/dialogs/order_details_dialog.dart';

abstract class OrderDialogs {
  static void showOrderDetailsDialog(
    BuildContext context, {
    required AppOrder order,
  }) {
    Dialogs.showGeneralDialog(
      context,
      content: OrderDetailsDialog(
        order: order,
      ),
      materialActions: [
        CustomElevatedButton(
          enableGradient: true,
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.buttonPaddingV12,
            horizontal: Sizes.buttonPaddingH80,
          ),
          onPressed: () => NavigationService.popDialog(context),
          child: CustomText.f16(
            context,
            tr(context).back,
            color: const Color(0xffffffff),
            weight: FontStyles.fontWeightSemiBold,
          ),
        ),
      ],
      cupertinoActions: [
        CupertinoDialogAction(
          onPressed: () => NavigationService.popDialog(context),
          child: CustomText.f16(
            context,
            tr(context).back,
            weight: FontStyles.fontWeightSemiBold,
          ),
        ),
      ],
    );
  }

  static Future<String?> showCancelOrderDialog(BuildContext context) async {
    return Dialogs.showGeneralDialog(
      context,
      content: const CancelOrderDialog(),
      materialActions: _confirmButtonsMaterial(context),
      cupertinoActions: _confirmButtonsCupertino(context),
    ).then((result) {
      return result as String?;
    });
  }

  static bool confirmDeliveryId(
    BuildContext context, {
    required String deliveryId,
    required String? orderDeliveryId,
  }) {
    if (deliveryId == orderDeliveryId) {
      return true;
    } else {
      Toasts.showTitledToast(
        context,
        title: tr(context).youCanNotProceedThisOrder,
        description: tr(context).youCanOnlyProceedOrdersYouDelivering,
      );
      return false;
    }
  }

  static Future<bool> confirmChoiceDialog(
    BuildContext context,
    String message,
  ) async {
    return Dialogs.showGeneralDialog(
      context,
      title: Text(
        tr(context).areYouSure,
        style: Theme.of(context).dialogTheme.titleTextStyle,
      ),
      content: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Text(
          message,
          style: Theme.of(context).dialogTheme.contentTextStyle,
        ),
      ),
      materialActions: _confirmButtonsMaterial(context),
      cupertinoActions: _confirmButtonsCupertino(context),
    ).then((result) {
      final res = result as bool?;
      return res ?? false;
    });
  }

  static List<Widget> _confirmButtonsMaterial(BuildContext context) {
    return [
      CustomElevatedButton(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.buttonPaddingV12,
          horizontal: Sizes.buttonPaddingH34,
        ),
        buttonColor: customColors(context).greyColor,
        onPressed: () => NavigationService.popDialog(context),
        child: CustomText.f16(
          context,
          tr(context).cancel,
          color: const Color(0xffffffff),
          weight: FontStyles.fontWeightSemiBold,
        ),
      ),
      CustomElevatedButton(
        enableGradient: true,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.buttonPaddingV12,
          horizontal: Sizes.buttonPaddingH34,
        ),
        onPressed: () => NavigationService.popDialog(context, result: true),
        child: CustomText.f16(
          context,
          tr(context).confirm,
          color: const Color(0xffffffff),
          weight: FontStyles.fontWeightSemiBold,
        ),
      ),
    ];
  }

  static List<CupertinoDialogAction> _confirmButtonsCupertino(BuildContext context) {
    return [
      CupertinoDialogAction(
        onPressed: () => NavigationService.popDialog(context),
        child: CustomText.f16(
          context,
          tr(context).cancel,
          weight: FontStyles.fontWeightSemiBold,
        ),
      ),
      CupertinoDialogAction(
        onPressed: () => NavigationService.popDialog(context, result: true),
        child: CustomText.f16(
          context,
          tr(context).confirm,
          weight: FontStyles.fontWeightSemiBold,
        ),
      ),
    ];
  }
}

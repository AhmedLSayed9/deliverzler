import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/core_features/theme/presentation/utils/colors/custom_colors.dart';
import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/routing/navigation_service.dart';
import '../../../../core/presentation/styles/styles.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/widgets/dialogs.dart';
import '../../../../core/presentation/widgets/toasts.dart';
import '../../../../core/presentation/widgets/custom_elevated_button.dart';
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
          child: Text(
            tr(context).back,
            style: TextStyles.coloredElevatedButton(context),
          ),
        ),
      ],
      cupertinoActions: [
        CupertinoDialogAction(
          onPressed: () => NavigationService.popDialog(context),
          child: Text(
            tr(context).back,
            style: TextStyles.cupertinoDialogAction(context),
          ),
        ),
      ],
    );
  }

  static Future<String?> showCancelOrderDialog(BuildContext context) async {
    late final TextEditingController cancelNoteController;
    return Dialogs.showGeneralDialog(
      context,
      content: HookBuilder(
        builder: (context) {
          cancelNoteController = useTextEditingController(text: '');
          return CancelOrderDialog(
            cancelNoteController: cancelNoteController,
          );
        },
      ),
      materialActions: _confirmButtonsMaterial(
        context,
        confirmCallback: () =>
            NavigationService.popDialog(context, result: cancelNoteController.text),
      ),
      cupertinoActions: _confirmButtonsCupertino(
        context,
        confirmCallback: () =>
            NavigationService.popDialog(context, result: cancelNoteController.text),
      ),
    ).then((result) {
      return result as String?;
    });
  }

  static void showCanNotProceedDialog(BuildContext context) {
    return Toasts.showTitledToast(
      context,
      title: tr(context).youCanNotProceedThisOrder,
      description: tr(context).youCanOnlyProceedOrdersYouDelivering,
    );
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
      materialActions: _confirmButtonsMaterial(
        context,
        confirmCallback: () => NavigationService.popDialog(context, result: true),
      ),
      cupertinoActions: _confirmButtonsCupertino(
        context,
        confirmCallback: () => NavigationService.popDialog(context),
      ),
    ).then((result) {
      final res = result as bool?;
      return res ?? false;
    });
  }

  static List<Widget> _confirmButtonsMaterial(
    BuildContext context, {
    required VoidCallback confirmCallback,
  }) {
    return [
      CustomElevatedButton(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.buttonPaddingV12,
          horizontal: Sizes.buttonPaddingH34,
        ),
        buttonColor: customColors(context).greyColor,
        onPressed: () => NavigationService.popDialog(context),
        child: Text(
          tr(context).cancel,
          style: TextStyles.coloredElevatedButton(context),
        ),
      ),
      CustomElevatedButton(
        enableGradient: true,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.buttonPaddingV12,
          horizontal: Sizes.buttonPaddingH34,
        ),
        onPressed: confirmCallback,
        child: Text(
          tr(context).confirm,
          style: TextStyles.coloredElevatedButton(context),
        ),
      ),
    ];
  }

  static List<CupertinoDialogAction> _confirmButtonsCupertino(
    BuildContext context, {
    required VoidCallback confirmCallback,
  }) {
    return [
      CupertinoDialogAction(
        onPressed: () => NavigationService.popDialog(context),
        child: Text(
          tr(context).cancel,
          style: TextStyles.cupertinoDialogAction(context),
        ),
      ),
      CupertinoDialogAction(
        onPressed: confirmCallback,
        child: Text(
          tr(context).confirm,
          style: TextStyles.cupertinoDialogAction(context),
        ),
      ),
    ];
  }
}

import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/utils/dialog_message_state.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/widgets/dialog_widget.dart';
import 'package:flutter/material.dart';

class AppDialogs {
  static Future showErrorDialog(BuildContext context, {String? message}) async {
    await DialogWidget.showCustomDialog(
      context: context,
      dialogWidgetState: DialogWidgetState.error,
      title: tr(context).oops,
      description: tr(context).somethingWentWrong +
          '\n' +
          (message ?? tr(context).pleaseTryAgainLater),
      textButton: tr(context).oK,
      onPressed: () {
        NavigationService.goBack(context);
      },
    );
  }
}

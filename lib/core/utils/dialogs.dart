import 'package:get/get.dart';
import 'package:deliverzler/core/localization/app_localization.dart';
import 'package:deliverzler/core/utils/dialog_message_state.dart';
import 'package:deliverzler/core/services/navigation_service.dart';
import 'package:deliverzler/core/widgets/dialog_widget.dart';

class AppDialogs {
  static Future showDefaultErrorDialog() async {
    await DialogWidget.showCustomDialog(
      context: Get.context!,
      dialogWidgetState: DialogWidgetState.error,
      title: tr('oops'),
      description: tr('somethingWentWrong') + '\n' + tr('pleaseTryAgainLater'),
      textButton: tr('OK'),
      onPressed: () {
        NavigationService.goBack();
      },
    );
  }

  static Future showOperationCanceledDialog() async {
    await DialogWidget.showCustomDialog(
      context: Get.context!,
      dialogWidgetState: DialogWidgetState.error,
      title: tr('operationCanceledByUser'),
      textButton: tr('OK'),
      onPressed: () {
        NavigationService.goBack();
      },
    );
  }

  static Future showEmailOrPassIncorrectDialog() async {
    DialogWidget.showCustomDialog(
      context: Get.context!,
      dialogWidgetState: DialogWidgetState.error,
      title: tr('emailOrPasswordIsInCorrect'),
      textButton: tr('OK'),
      onPressed: () {
        NavigationService.goBack();
      },
    );
  }
}

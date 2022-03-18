import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/utils/dialog_message_state.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/widgets/dialog_widget.dart';

class AppDialogs {
  static Future showErrorDialog({String? message}) async {
    await DialogWidget.showCustomDialog(
      context: NavigationService.context,
      dialogWidgetState: DialogWidgetState.error,
      title: tr(NavigationService.context).oops,
      description: tr(NavigationService.context).somethingWentWrong +
          '\n' +
          (message ?? tr(NavigationService.context).pleaseTryAgainLater),
      textButton: tr(NavigationService.context).oK,
      onPressed: () {
        NavigationService.goBack();
      },
    );
  }

  static Future showOperationCanceledDialog() async {
    await DialogWidget.showCustomDialog(
      context: NavigationService.context,
      dialogWidgetState: DialogWidgetState.error,
      title: tr(NavigationService.context).operationCanceledByUser,
      textButton: tr(NavigationService.context).oK,
      onPressed: () {
        NavigationService.goBack();
      },
    );
  }
}

import 'package:deliverzler/core/utils/dialog_message_state.dart';
import 'package:deliverzler/core/styles/app_images.dart';

Map<DialogWidgetState, dynamic> dialogMessageData = {
  DialogWidgetState.error: {"icon": AppImages.error},
  DialogWidgetState.noHeader: {"icon": AppImages.noHeader},
  DialogWidgetState.info: {"icon": AppImages.info},
  DialogWidgetState.infoReversed: {"icon": AppImages.infoReverse},
  DialogWidgetState.question: {"icon": AppImages.ask},
  DialogWidgetState.success: {"icon": AppImages.success},
  DialogWidgetState.warning: {"icon": AppImages.warning},
  DialogWidgetState.confirmation: {"icon": AppImages.confirmation},
  DialogWidgetState.location: {"icon": AppImages.location},
};

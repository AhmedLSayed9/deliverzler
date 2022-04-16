import 'package:deliverzler/core/widgets/custom_toast.dart';
import 'package:flutter/cupertino.dart';

class Toasts {
  static showForegroundToast(
    BuildContext context, {
    required String title,
    required String description,
  }) {
    CustomToast.instance.showDefaultToast(
      context,
      title: title,
      description: description,
    );
  }

  static Future showBackgroundToast({required String message}) async {
    await CustomToast.instance.showBackgroundToast(
      msg: message,
    );
  }
}

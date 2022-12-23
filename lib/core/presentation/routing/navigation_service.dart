import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';

abstract class NavigationService {
  static _removeAllFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static _removeOverlays() {
    FToast().removeQueuedCustomToasts();
  }

  static Future<void> pop<T>(
    BuildContext context, {
    T? result,
    bool closeOverlays = false,
  }) async {
    _removeAllFocus();
    if (closeOverlays) {
      _removeOverlays();
    }
    if (!context.mounted && context.canPop()) {
      // Note: GoRouter logging will wrongly log that it's popping current route
      // when popping a dialog: https://github.com/flutter/flutter/issues/119237
      return context.pop(result);
    }
  }
}

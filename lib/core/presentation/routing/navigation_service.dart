import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_page_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

abstract class NavigationService {
  static removeAllFocus(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static removeOverlays() {
    FToast().removeQueuedCustomToasts();
  }

  static Future<dynamic> dismissDialog(BuildContext context) async {
    //If the application has multiple Navigator objects, it may be necessary
    //to call Navigator.of(context, rootNavigator: true).pop(result)
    //to close the dialog rather just Navigator.pop(context, result).
    return await goBack(context, rootNavigator: true, maybePop: false);
  }

  static Future<dynamic> push(
    BuildContext context, {
    bool isNamed = false,
    required dynamic page,
    dynamic arguments,
    bool preventDuplicates = true,
    bool closeOverlays = false,
    bool rootNavigator = false,
  }) async {
    removeAllFocus(context);
    if (closeOverlays) {
      removeOverlays();
    }
    if (isNamed) {
      if (preventDuplicates) {
        final isDuplicate = checkDuplicateRoute(context, page, arguments);
        if (isDuplicate) return;
      }
      return await Navigator.of(context, rootNavigator: rootNavigator)
          .pushNamed(page, arguments: arguments);
    } else {
      return await Navigator.of(context, rootNavigator: rootNavigator).push(
        platformPageRoute(builder: (context) => page),
      );
    }
  }

  static Future<dynamic> pushReplacement(
    BuildContext context, {
    bool isNamed = false,
    required dynamic page,
    dynamic arguments,
    bool preventDuplicates = true,
    bool closeOverlays = false,
    bool rootNavigator = false,
  }) async {
    removeAllFocus(context);
    if (closeOverlays) {
      removeOverlays();
    }
    if (isNamed) {
      if (preventDuplicates) {
        final isDuplicate = checkDuplicateRoute(context, page, arguments);
        if (isDuplicate) return;
      }
      return await Navigator.of(context, rootNavigator: rootNavigator)
          .pushReplacementNamed(page, arguments: arguments);
    } else {
      return await Navigator.of(context, rootNavigator: rootNavigator)
          .pushReplacement(page);
    }
  }

  static Future<dynamic> goBack<T>(
    BuildContext context, {
    T? result,
    bool maybePop = true,
    bool closeOverlays = false,
    bool rootNavigator = false,
  }) async {
    removeAllFocus(context);
    if (closeOverlays) {
      removeOverlays();
    }
    if (maybePop) {
      return await Navigator.of(context, rootNavigator: rootNavigator)
          .maybePop(result);
    } else {
      Navigator.of(context, rootNavigator: rootNavigator).pop(result);
    }
  }

  static popUntil(
    BuildContext context, {
    required RoutePredicate predicate,
    bool closeOverlays = false,
    bool rootNavigator = false,
  }) {
    removeAllFocus(context);
    if (closeOverlays) {
      removeOverlays();
    }
    Navigator.of(context, rootNavigator: rootNavigator).popUntil(predicate);
  }

  static Future<T?>? pushReplacementAll<T>(
    BuildContext context, {
    bool isNamed = false,
    required dynamic page,
    dynamic arguments,
    bool closeOverlays = false,
    bool rootNavigator = false,
  }) async {
    removeAllFocus(context);
    if (closeOverlays) {
      removeOverlays();
    }
    if (isNamed) {
      return await Navigator.of(context, rootNavigator: rootNavigator)
          .pushNamedAndRemoveUntil(
        page,
        (route) => false,
        arguments: arguments,
      );
    } else {
      return await Navigator.of(context, rootNavigator: rootNavigator)
          .pushAndRemoveUntil(page, (route) => false);
    }
  }

  static Future<T?>? pushAndRemoveUntil<T>(
    BuildContext context, {
    bool isNamed = false,
    required dynamic page,
    required bool Function(Route<dynamic>) predicate,
    dynamic arguments,
    bool closeOverlays = false,
    bool rootNavigator = false,
  }) async {
    removeAllFocus(context);
    if (closeOverlays) {
      removeOverlays();
    }
    if (isNamed) {
      return await Navigator.of(context, rootNavigator: rootNavigator)
          .pushNamedAndRemoveUntil(page, predicate, arguments: arguments);
    } else {
      return await Navigator.of(context, rootNavigator: rootNavigator)
          .pushAndRemoveUntil(page, predicate);
    }
  }

  static bool checkDuplicateRoute(
    BuildContext context,
    String page,
    dynamic arguments,
  ) {
    bool isNewRouteSameAsCurrent = false;
    popUntil(
      context,
      predicate: (route) {
        if (route.settings.name == page &&
            route.settings.arguments == arguments) {
          isNewRouteSameAsCurrent = true;
        }
        return true;
      },
    );
    return isNewRouteSameAsCurrent;
  }
}

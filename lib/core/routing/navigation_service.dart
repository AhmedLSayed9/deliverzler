import 'package:deliverzler/core/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class NavigationService {
  static final GlobalKey<NavigatorState> navigationKey =
      GlobalKey<NavigatorState>();

  static get context => navigationKey.currentState?.context;

  static removeAllFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static removeOverlays() {
    CustomToast.instance.fToast.removeQueuedCustomToasts();
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
        final _isDuplicate = checkDuplicateRoute(context, page, arguments);
        if (_isDuplicate) return;
      }
      return await Navigator.of(context, rootNavigator: rootNavigator)
          .pushNamed(page, arguments: arguments);
    } else {
      return await Navigator.of(context, rootNavigator: rootNavigator).push(
        platformPageRoute(context: context, builder: (context) => page),
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
        final _isDuplicate = checkDuplicateRoute(context, page, arguments);
        if (_isDuplicate) return;
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
    bool _isNewRouteSameAsCurrent = false;
    popUntil(
      context,
      predicate: (route) {
        if (route.settings.name == page &&
            route.settings.arguments == arguments) {
          _isNewRouteSameAsCurrent = true;
        }
        return true;
      },
    );
    return _isNewRouteSameAsCurrent;
  }
}

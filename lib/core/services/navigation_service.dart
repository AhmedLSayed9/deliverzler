import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum NavigationMethod {
  push,
  pushReplacement,
  pushReplacementAll,
  offUntil,
  pop,
}

class NavigationService {
  static Future<dynamic> navigateTo({
    bool isNamed = false,
    required NavigationMethod navigationMethod,
    required dynamic page,
    Transition? transition,
    Curve? curve,
    Duration? duration,
    dynamic arguments,
    bool preventDuplicates = true,
    bool? popGesture,
    Map<String, String>? parameters,
  }) async {
    assert(navigationMethod != NavigationMethod.pop);
    assert(navigationMethod != NavigationMethod.pushReplacementAll);
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (isNamed) {
      return await _getNavigationMethod(
        navigationMethod: navigationMethod,
        isNamed: true,
      )(
        page.toString(),
        preventDuplicates: preventDuplicates,
        arguments: arguments,
        parameters: parameters,
      );
    } else {
      return await _getNavigationMethod(
        navigationMethod: navigationMethod,
        isNamed: false,
      )(
        page,
        preventDuplicates: preventDuplicates,
        arguments: arguments,
        popGesture: popGesture,
        curve: curve,
        transition: transition,
        duration: duration,
      );
    }
  }

  static goBack<T>({
    T? result,
    bool closeOverlays = false,
    bool canPop = true,
    int? id,
  }) {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    Get.back<T>(
      canPop: canPop,
      id: id,
      closeOverlays: closeOverlays,
      result: result,
    );
  }

  static void popUntil({
    required RoutePredicate predicate,
  }) {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    Get.until(predicate);
  }

  static Future<T?>? offAll<T>({
    bool isNamed = false,
    required dynamic page,
    dynamic arguments,
    bool Function(Route<dynamic>)? predicate,
    int? id,
    Transition? transition,
    Curve? curve,
    Duration? duration,
  }) {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
    if (isNamed) {
      _getNavigationMethod(
        navigationMethod: NavigationMethod.pushReplacementAll,
        isNamed: true,
      )(
        page.toString(),
        arguments: arguments,
      );
    } else {
      _getNavigationMethod(
        navigationMethod: NavigationMethod.pushReplacementAll,
        isNamed: false,
      )(
        page,
        arguments: arguments,
        predicate: predicate ?? (_) => false,
        transition: transition,
        curve: curve,
        duration: duration,
      );
    }
  }

  static _getNavigationMethod(
      {bool isNamed = false, required NavigationMethod navigationMethod}) {
    switch (navigationMethod) {
      case NavigationMethod.push:
        {
          return isNamed ? Get.toNamed : Get.to;
        }
      case NavigationMethod.pushReplacement:
        {
          return isNamed ? Get.offNamed : Get.off;
        }

      case NavigationMethod.pushReplacementAll:
        {
          return isNamed ? Get.offAllNamed : Get.offAll;
        }
      default:
        {
          throw 'No navigation method selected, navigation method is required';
        }
    }
  }
}

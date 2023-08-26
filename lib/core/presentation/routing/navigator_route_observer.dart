import 'package:flutter/material.dart';

import 'package:logging/logging.dart';

typedef OnRouteChange<T> = void Function(Route<T>? route, Route<T>? previousRoute);

typedef RoutesStackCallBack<T> = void Function(List<Route<T>> routes);

// This is no longer needed.
//Tutorial
//https://medium.com/flutter-community/flutter-navigator-middleware-part1-9ebc47cea2f2
//https://medium.com/flutter-community/flutter-navigator-middleware-part-2-middleware-service-class-c9035f4fff68
class NavigatorRouteObserver<T> extends RouteObserver<PageRoute<T>> {
  NavigatorRouteObserver({
    this.enableLogger = true,
    this.routesStackCallBack,
    this.onPush,
    this.onPop,
    this.onReplace,
    this.onRemove,
  }) : _stack = [];

  static final log = Logger('RouteLogger');

  final bool enableLogger;
  final List<Route<dynamic>> _stack;

  final RoutesStackCallBack<dynamic>? routesStackCallBack;
  final OnRouteChange<dynamic>? onPush;
  final OnRouteChange<dynamic>? onPop;
  final OnRouteChange<dynamic>? onReplace;
  final OnRouteChange<dynamic>? onRemove;

  //create clone list from stack
  List<Route<dynamic>> get stack => List<Route<dynamic>>.from(_stack);

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logIt('{didPush} \n route: $route \n previousRoute: $previousRoute');
    _stack.add(route);
    _logStack();
    routesStackCallBack?.call(_stack);
    onPush?.call(route, previousRoute);
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logIt('{didPop} \n route: $route \n previousRoute: $previousRoute');
    _stack.remove(route);
    _logStack();
    routesStackCallBack?.call(_stack);
    onPop?.call(route, previousRoute);
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    _logIt('{didReplace} \n newRoute: $newRoute \n oldRoute: $oldRoute');
    if (oldRoute != null && _stack.contains(oldRoute)) {
      final oldItemIndex = _stack.indexOf(oldRoute);
      _stack[oldItemIndex] = newRoute!;
    }
    _logStack();
    routesStackCallBack?.call(_stack);
    onReplace?.call(newRoute, oldRoute);
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    _logIt('{didRemove} \n route: $route \n previousRoute: $previousRoute');
    _stack.remove(route);
    //_logStack();
    routesStackCallBack?.call(_stack);
    onRemove?.call(route, previousRoute);
    super.didRemove(route, previousRoute);
  }

/*@override
  void didStartUserGesture(Route route, Route? previousRoute) {
    _logIt(
        '{didStartUserGesture} \n route: $route \n previousRoute: $previousRoute');
    super.didStartUserGesture(route, previousRoute);
  }*/

/*@override
  void didStopUserGesture() {
    _logIt('{didStopUserGesture}');
    super.didStopUserGesture();
  }*/

  void _logIt(String content) {
    if (enableLogger) {
      log.fine(content);
    }
  }

  void _logStack() {
    if (enableLogger) {
      final mappedStack = _stack.map((Route<dynamic> route) => route.routeName).toList();
      log.fine('Navigator stack: $mappedStack');
    }
  }
}

extension RouteExtension on Route<dynamic> {
  String get routeName => settings.name ?? settings.runtimeType.toString();
}

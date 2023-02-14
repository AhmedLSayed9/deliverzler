import 'dart:developer';

import 'package:flutter/material.dart';

import 'navigator_route_observer.dart';

export 'package:deliverzler/core/presentation/extensions/route_extension.dart';

typedef OnRouteChange = void Function(Route? route, Route? previousRoute);

typedef RoutesStackCallBack = void Function(List<Route> routes);

//Tutorial
//https://medium.com/flutter-community/flutter-navigator-middleware-part1-9ebc47cea2f2
//https://medium.com/flutter-community/flutter-navigator-middleware-part-2-middleware-service-class-c9035f4fff68
class NavigatorRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  NavigatorRouteObserver({
    this.enableLogger = false,
    this.routesStackCallBack,
    this.onPush,
    this.onPop,
    this.onReplace,
    this.onRemove,
  }) : _stack = [];

  final bool enableLogger;
  final List<Route> _stack;

  final RoutesStackCallBack? routesStackCallBack;
  final OnRouteChange? onPush;
  final OnRouteChange? onPop;
  final OnRouteChange? onReplace;
  final OnRouteChange? onRemove;

  //create clone list from stack
  List<Route> get stack => List<Route>.from(_stack);

  @override
  void didPush(Route route, Route? previousRoute) {
    _logIt('{didPush} \n route: $route \n previousRoute: $previousRoute');
    _stack.add(route);
    _logStack();
    routesStackCallBack?.call(_stack);
    onPush?.call(route, previousRoute);
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    _logIt('{didPop} \n route: $route \n previousRoute: $previousRoute');
    _stack.remove(route);
    _logStack();
    routesStackCallBack?.call(_stack);
    onPop?.call(route, previousRoute);
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
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
  void didRemove(Route route, Route? previousRoute) {
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
      log(content);
    }
  }

  void _logStack() {
    if (enableLogger) {
      final mappedStack = _stack.map((Route route) => route.routeName).toList();
      log('Navigator stack: $mappedStack');
    }
  }
}

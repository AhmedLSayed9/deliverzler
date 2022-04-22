import 'package:flutter/material.dart';

typedef OnRouteChange = void Function(Route? route, Route? previousRoute);

//Tutorial
//https://medium.com/flutter-community/flutter-navigator-middleware-part1-9ebc47cea2f2
//https://medium.com/flutter-community/flutter-navigator-middleware-part-2-middleware-service-class-c9035f4fff68
class NavigatorRouteObserver extends RouteObserver<PageRoute<dynamic>> {
  NavigatorRouteObserver({
    this.enableLogger = true,
    this.onPush,
    this.onPop,
    this.onReplace,
    this.onRemove,
  }) : _stack = [];

  final bool enableLogger;
  final List<Route> _stack;

  final OnRouteChange? onPush;
  final OnRouteChange? onPop;
  final OnRouteChange? onReplace;
  final OnRouteChange? onRemove;

  //create clone list from stack
  List<Route> get stack => List<Route>.from(_stack);

  @override
  void didPush(Route route, Route? previousRoute) {
    //_logIt('{didPush} \n route: $route \n previousRoute: $previousRoute');
    /*_stack.add(route);
    _logStack();*/
    if (onPush != null) {
      onPush!(route, previousRoute);
    }
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    //_logIt('{didPop} \n route: $route \n previousRoute: $previousRoute');
    /*_stack.remove(route);
    _logStack();*/
    if (onPop != null) {
      onPop!(route, previousRoute);
    }
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    //_logIt('{didReplace} \n newRoute: $newRoute \n oldRoute: $oldRoute');
    /*if (_stack.contains(oldRoute!)) {
      final oldItemIndex = _stack.indexOf(oldRoute);
      _stack[oldItemIndex] = newRoute!;
    }
    _logStack();*/
    if (onReplace != null) {
      onReplace!(newRoute, oldRoute);
    }
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    //_logIt('{didRemove} \n route: $route \n previousRoute: $previousRoute');
    /*stack.remove(route);
    _logStack();*/
    if (onPop != null) {
      onPop!(route, previousRoute);
    }
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

  /*void _logIt(String content) {
    if (enableLogger) {
      log(content);
    }
  }*/

  /*void _logStack() {
    final mappedStack =
        _stack.map((Route route) => route.settings.name).toList();

    _logIt('Navigator stack: $mappedStack');
  }*/
}

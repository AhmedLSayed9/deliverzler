import 'package:deliverzler/core/presentation/routing/navigator_route_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'navigator_route_observer_test.mocks.dart';

abstract class NavigatorObserverFns {
  void routesStackCallBack(List<Route> routes);

  void onPush(Route? route, Route? previousRoute);

  void onPop(Route? route, Route? previousRoute);

  void onReplace(Route? route, Route? previousRoute);

  void onRemove(Route? route, Route? previousRoute);
}

@GenerateMocks([Route, NavigatorObserverFns])
void main() {
  late MockRoute mockRoute;
  late MockRoute mockPreviousRoute;
  late MockNavigatorObserverFns mockNavigatorObserverFns;
  late NavigatorRouteObserver navigatorRouteObserver;

  setUp(() {
    mockRoute = MockRoute();
    mockPreviousRoute = MockRoute();
    mockNavigatorObserverFns = MockNavigatorObserverFns();
    navigatorRouteObserver = NavigatorRouteObserver(
      enableLogger: false,
      routesStackCallBack: mockNavigatorObserverFns.routesStackCallBack,
      onPush: mockNavigatorObserverFns.onPush,
      onPop: mockNavigatorObserverFns.onPop,
      onReplace: mockNavigatorObserverFns.onReplace,
      onRemove: mockNavigatorObserverFns.onRemove,
    );
  });

  group('didPush', () {
    test(
      'should add the pushed route to routes stack',
      () {
        // WHEN
        navigatorRouteObserver.didPush(mockPreviousRoute, null);
        navigatorRouteObserver.didPush(mockRoute, mockPreviousRoute);
        // THEN
        final expectedFirstRoute = navigatorRouteObserver.stack[0];
        final expectedLastRoute = navigatorRouteObserver.stack[1];
        final expectedStackLength = navigatorRouteObserver.stack.length;
        expect(mockPreviousRoute, expectedFirstRoute);
        expect(mockRoute, expectedLastRoute);
        expect(expectedStackLength, 2);
      },
    );
    test(
      'should call routesStackCallBack with the proper routes stack'
      'should call onPush with the proper route/previousRoute',
      () {
        // GIVEN
        when(mockNavigatorObserverFns.routesStackCallBack(any))
            .thenAnswer((_) {});
        when(mockNavigatorObserverFns.onPush(any, any)).thenAnswer((_) {});
        // WHEN
        navigatorRouteObserver.didPush(mockRoute, mockPreviousRoute);
        // THEN
        verify(
          mockNavigatorObserverFns
              .routesStackCallBack(navigatorRouteObserver.stack),
        ).called(1);
        verify(
          mockNavigatorObserverFns.onPush(mockRoute, mockPreviousRoute),
        ).called(1);
        verifyNoMoreInteractions(mockNavigatorObserverFns);
      },
    );
  });

  group('didPop', () {
    test(
      'should remove the popped route from routes stack',
      () {
        // WHEN
        navigatorRouteObserver.didPush(mockPreviousRoute, null);
        navigatorRouteObserver.didPop(mockRoute, mockPreviousRoute);
        // THEN
        final expectedFirstRoute = navigatorRouteObserver.stack[0];
        final expectedStackLength = navigatorRouteObserver.stack.length;
        expect(mockPreviousRoute, expectedFirstRoute);
        expect(expectedStackLength, 1);
      },
    );
    test(
      'should call routesStackCallBack with the proper routes stack'
      'should call onPop with the proper route/previousRoute',
      () {
        // GIVEN
        when(mockNavigatorObserverFns.routesStackCallBack(any))
            .thenAnswer((_) {});
        when(mockNavigatorObserverFns.onPop(any, any)).thenAnswer((_) {});
        // WHEN
        navigatorRouteObserver.didPop(mockRoute, mockPreviousRoute);
        // THEN
        verify(
          mockNavigatorObserverFns
              .routesStackCallBack(navigatorRouteObserver.stack),
        ).called(1);
        verify(
          mockNavigatorObserverFns.onPop(mockRoute, mockPreviousRoute),
        ).called(1);
        verifyNoMoreInteractions(mockNavigatorObserverFns);
      },
    );
  });

  group('didReplace', () {
    test(
      'if routes stack has the old route, should replace it with the new route',
      () {
        // WHEN
        navigatorRouteObserver.didPush(mockPreviousRoute, null);
        navigatorRouteObserver.didReplace(
            newRoute: mockRoute, oldRoute: mockPreviousRoute);
        // THEN
        final expectedFirstRoute = navigatorRouteObserver.stack[0];
        final expectedStackLength = navigatorRouteObserver.stack.length;
        expect(mockRoute, expectedFirstRoute);
        expect(expectedStackLength, 1);
      },
    );
    test(
      'if routes stack does not have the old route, should not add the new route',
      () {
        // WHEN
        navigatorRouteObserver.didReplace(
            newRoute: mockRoute, oldRoute: mockPreviousRoute);
        // THEN
        final expectedStackLength = navigatorRouteObserver.stack.length;
        expect(expectedStackLength, 0);
      },
    );
    test(
      'should call routesStackCallBack with the proper routes stack'
      'should call onReplace with the proper route/previousRoute',
      () {
        // GIVEN
        when(mockNavigatorObserverFns.routesStackCallBack(any))
            .thenAnswer((_) {});
        when(mockNavigatorObserverFns.onReplace(any, any)).thenAnswer((_) {});
        // WHEN
        navigatorRouteObserver.didReplace(
            newRoute: mockRoute, oldRoute: mockPreviousRoute);
        // THEN
        verify(
          mockNavigatorObserverFns
              .routesStackCallBack(navigatorRouteObserver.stack),
        ).called(1);
        verify(
          mockNavigatorObserverFns.onReplace(mockRoute, mockPreviousRoute),
        ).called(1);
        verifyNoMoreInteractions(mockNavigatorObserverFns);
      },
    );
  });

  group('didRemove', () {
    test(
      'should remove the route from routes stack',
      () {
        // WHEN
        navigatorRouteObserver.didPush(mockRoute, null);
        navigatorRouteObserver.didRemove(mockRoute, null);
        // THEN
        final expectedStackLength = navigatorRouteObserver.stack.length;
        expect(expectedStackLength, 0);
      },
    );
    test(
      'should call routesStackCallBack with the proper routes stack'
      'should call onRemove with the proper route/previousRoute',
      () {
        // GIVEN
        when(mockNavigatorObserverFns.routesStackCallBack(any))
            .thenAnswer((_) {});
        when(mockNavigatorObserverFns.onRemove(any, any)).thenAnswer((_) {});
        // WHEN
        navigatorRouteObserver.didRemove(mockRoute, mockPreviousRoute);
        // THEN
        verify(
          mockNavigatorObserverFns
              .routesStackCallBack(navigatorRouteObserver.stack),
        ).called(1);
        verify(
          mockNavigatorObserverFns.onRemove(mockRoute, mockPreviousRoute),
        ).called(1);
        verifyNoMoreInteractions(mockNavigatorObserverFns);
      },
    );
  });
}

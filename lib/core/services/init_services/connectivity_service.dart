import 'package:deliverzler/core/services/navigation_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:deliverzler/core/utils/routes.dart';

class ConnectivityService {
  ConnectivityService._();

  static final instance = ConnectivityService._();

  /// `_isInitialized` is used to ensure that the listeners are only called once
  bool _isInitialized = false;

  /// Start listening to connectivity stream
  /// Connectivity stream is triggered whenever app connection to the internet method changed
  initializeConnectivityListeners() {
    if (_isInitialized) return;

    //connectivity_plus: check for cellular and wifi connection "Does not guarantee connection to Internet".
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      debugPrint("Connection status changed : " + result.toString());
      if (result == ConnectivityResult.none) {
        NavigationService.navigateTo(
          navigationMethod: NavigationMethod.push,
          isNamed: true,
          page: RoutePaths.coreNoInternet,
          arguments: {'fromSplash': false},
        );
      }
    });

    //internet_connection_checker: checks for an internet (data) connection, by opening a socket to a list of addresses. DEFAULT_INTERVAL is 10 seconds which is the time between automatic checks.
    InternetConnectionChecker().onStatusChange.listen((status) {
      debugPrint("Connection status changed : " + status.toString());
      checkIfConnectedByConnectivity().then((value) {
        //If no connection from Connectivity plugin "value=false" then no need to check here. Also this fix the exception happening if the app started with no connection as the InternetConnectionChecker doesn't wait till Flutter is ready to navigate "till it renders its first frames" (unlike the Connectivity plugin).
        if (value == true) {
          if (status == InternetConnectionStatus.disconnected) {
            NavigationService.navigateTo(
              navigationMethod: NavigationMethod.push,
              isNamed: true,
              page: RoutePaths.coreNoInternet,
              arguments: {'fromSplash': false},
            );
          }
        }
      });
    });

    debugPrint("Connectivity stream has been initialized!!");
    _isInitialized = true;
  }

  /// Getting current connectivity status/method
  Future<bool> checkIfConnected() async {
    if (await InternetConnectionChecker().hasConnection) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkIfConnectedByConnectivity() async {
    ConnectivityResult connectivityResult =
        (await Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}

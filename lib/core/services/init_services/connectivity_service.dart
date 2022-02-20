import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:deliverzler/core/routing/route_paths.dart';

class ConnectivityService {
  ConnectivityService._();

  static final instance = ConnectivityService._();

  /// `_isInitialized` is used to ensure that the listeners are only called once
  bool _isInitialized = false;

  initializeConnectivityListeners() {
    if (_isInitialized) return;
    _initConnectivityStream();
    _initInternetCheckerStream();
    debugPrint("Connectivity stream has been initialized!!");
    _isInitialized = true;
  }

  //connectivity_plus: check for cellular and wifi connection "Does not guarantee connection to Internet".
  _initConnectivityStream() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      debugPrint("Connection status changed: " + result.toString());
      if (result == ConnectivityResult.none) {
        _navigateToNoInternetScreen();
      }
    });
  }

  //internet_connection_checker: checks for an internet (data) connection, by opening a socket to a list of addresses. DEFAULT_INTERVAL is 10 seconds which is the time between automatic checks.
  _initInternetCheckerStream() {
    InternetConnectionChecker().onStatusChange.listen((status) {
      debugPrint("Connection status changed : " + status.toString());
      checkIfConnectedByConnectivity().then((value) {
        //If no connection from Connectivity plugin "value=false" then no need to check here. Also this fix the exception happening if the app started with no connection as the InternetConnectionChecker doesn't wait till Flutter is ready to navigate "till it renders its first frames" (unlike the Connectivity plugin).
        if (value == true) {
          if (status == InternetConnectionStatus.disconnected) {
            _navigateToNoInternetScreen();
          }
        }
      });
    });
  }

  _navigateToNoInternetScreen() {
    NavigationService.push(
      isNamed: true,
      page: RoutePaths.coreNoInternet,
      arguments: {'fromSplash': false},
    );
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

  Future<bool> checkIfConnected() async {
    return await InternetConnectionChecker().hasConnection;
  }
}

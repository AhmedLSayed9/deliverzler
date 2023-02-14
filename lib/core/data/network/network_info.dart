import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'data_connection_checker.dart';

abstract class INetworkInfo {
  Future<bool> get hasInternetConnection;

  Future<ConnectivityResult> get hasNetworkConnectivity;
}

final networkInfoProvider = Provider<INetworkInfo>(
      (ref) => NetworkInfo(
    DataConnectionChecker(),
    Connectivity(),
  ),
);

class NetworkInfo implements INetworkInfo {
  NetworkInfo(this.dataConnectionChecker, this.connectivity);

  final DataConnectionChecker dataConnectionChecker;
  final Connectivity connectivity;

  @override
  Future<bool> get hasInternetConnection => dataConnectionChecker.hasConnection;

  @override
  Future<ConnectivityResult> get hasNetworkConnectivity =>
      connectivity.checkConnectivity();
}

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'data_connection_checker.dart';

part 'network_info.g.dart';

abstract class INetworkInfo {
  Future<bool> get hasInternetConnection;

  Future<ConnectivityResult> get hasNetworkConnectivity;
}

@Riverpod(keepAlive: true)
INetworkInfo networkInfo(NetworkInfoRef ref) {
  return NetworkInfo(
    DataConnectionChecker(),
    Connectivity(),
  );
}

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

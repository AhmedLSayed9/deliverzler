import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

import '../network/data_connection_checker.dart';
import '../../presentation/utils/riverpod_framework.dart';

part 'connection_stream_service.g.dart';

enum ConnectionStatus { connected, disconnected }

final _log = Logger('ConnectionLogger');

@riverpod
Stream<ConnectionStatus> connectionStream(ConnectionStreamRef ref) {
  final controller = StreamController<ConnectionStatus>();

  //connectivity_plus: check for cellular and wifi connection "Does not guarantee connection to Internet".
  //debounceTime temporary fixes an open issue: https://github.com/fluttercommunity/plus_plugins/issues/790
  final connectivitySub =
      Connectivity().onConnectivityChanged.debounceTime(const Duration(milliseconds: 300)).listen(
    (status) {
      _log.fine('NetworkConnectivity status changed: $status');
      if (status == ConnectivityResult.none) {
        controller.sink.add(ConnectionStatus.disconnected);
      }
    },
  );
  //Checks for an internet (data) connection, by opening a socket to a list of addresses
  //DEFAULT_INTERVAL is 10 seconds which is the time between automatic checks.
  //Add <uses-permission android:name="android.permission.INTERNET"/> in AndroidManifest to work.
  final dataConnectionSub = DataConnectionChecker().onStatusChange.listen(
    (status) {
      _log.fine('InternetConnection status changed: $status');
      if (status == DataConnectionStatus.disconnected) {
        controller.sink.add(ConnectionStatus.disconnected);
      } else {
        controller.sink.add(ConnectionStatus.connected);
      }
    },
  );

  ref.onDispose(() {
    controller.close();
    connectivitySub.cancel();
    dataConnectionSub.cancel();
  });

  return controller.stream.distinct().skip(1);
}

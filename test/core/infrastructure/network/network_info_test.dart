import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/core/infrastructure/network/data_connection_checker.dart';
import 'package:deliverzler/core/infrastructure/network/network_info.dart';

class MockDataConnectionChecker extends Mock implements DataConnectionChecker {}

class MockConnectivity extends Mock implements Connectivity {}

void main() {
  late MockDataConnectionChecker mockDataConnectionChecker;
  late MockConnectivity mockConnectivity;
  late NetworkInfo networkInfo;

  setUp(() {
    mockDataConnectionChecker = MockDataConnectionChecker();
    mockConnectivity = MockConnectivity();
    networkInfo = NetworkInfo(mockDataConnectionChecker, mockConnectivity);
  });

  group('hasInternetConnection', () {
    test(
      'should return same result from DataConnectionChecker.hasConnection',
      () async {
        // GIVEN
        //we use tHasConnectionFuture as a reference and compare it with "result" reference
        //(Dart's default referential equality: Only references to the same object are equal.)
        //When both are equal then we assured that hasConnection method from the package has been returned.
        //So, we assure we don't return true/false from networkInfo and ignore hasConnection returned value.
        final tHasConnectionFuture = Future.value(true);
        when(() => mockDataConnectionChecker.hasConnection).thenAnswer((_) => tHasConnectionFuture);
        // WHEN
        final result = networkInfo.hasInternetConnection;
        // THEN
        verify(() => mockDataConnectionChecker.hasConnection).called(1);
        expect(result, tHasConnectionFuture);
      },
    );
  });

  group('hasNetworkConnectivity', () {
    test(
      'should return same result from checkConnectivity()',
      () async {
        // GIVEN
        final kCheckConnectivityResult = Future.value(ConnectivityResult.wifi);
        when(() => mockConnectivity.checkConnectivity())
            .thenAnswer((_) => kCheckConnectivityResult);
        // WHEN
        final result = networkInfo.hasNetworkConnectivity;
        // THEN
        verify(() => mockConnectivity.checkConnectivity()).called(1);
        expect(result, kCheckConnectivityResult);
      },
    );
  });
}

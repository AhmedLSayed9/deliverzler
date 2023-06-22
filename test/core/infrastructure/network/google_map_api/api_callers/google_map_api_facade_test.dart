// ignore_for_file: inference_failure_on_function_invocation

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/core/infrastructure/network/google_map_api/api_callers/google_map_api_facade.dart';
import 'package:deliverzler/core/infrastructure/network/google_map_api/extensions/google_map_error_extension.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late GoogleMapApiFacade googleMapApiFacade;

  setUp(() {
    mockDio = MockDio();
    googleMapApiFacade = GoogleMapApiFacade(dio: mockDio);
  });

  const tPath = 'tPath';
  const tQueryParameters = <String, String>{'tQueryKey': 'tQueryValue'};
  final tData = FormData.fromMap({'tDataKey': 'tDataValue'});
  final tOptions = Options(
    headers: {'tHeaderKey': 'tHeaderValue'},
  );
  final tResponse = Response(
    requestOptions: RequestOptions(),
    data: {'tResponseKey': 'tResponseValue'},
    statusCode: 200,
  );

  final tError = DioError(
    error: 'error',
    requestOptions: RequestOptions(),
    type: DioErrorType.badResponse,
  );

  group('getData', () {
    test(
      'should call Dio.get with the proper path/params/options',
      () async {
        // GIVEN
        when(
          () => mockDio.get(
            tPath,
            queryParameters: tQueryParameters,
            options: tOptions,
          ),
        ).thenAnswer((_) async => tResponse);
        // WHEN
        await googleMapApiFacade.getData(
          path: tPath,
          queryParameters: tQueryParameters,
          options: tOptions,
        );
        // THEN
        verify(
          () => mockDio.get(
            tPath,
            queryParameters: tQueryParameters,
            options: tOptions,
          ),
        ).called(1);
        verifyNoMoreInteractions(mockDio);
      },
    );

    test(
      'should return same result from Dio.get when the response is successful',
      () async {
        // GIVEN
        when(() => mockDio.get(any())).thenAnswer((_) async => tResponse);
        // WHEN
        final result = await googleMapApiFacade.getData(path: tPath);
        // THEN
        expect(result, tResponse);
      },
    );

    test(
      'should throw error.googleMapErrorToServerException '
      'when the response is unsuccessful',
      () async {
        // GIVEN
        when(() => mockDio.get(any())).thenThrow(tError);
        // WHEN
        final call = googleMapApiFacade.getData(path: tPath);
        // THEN
        await expectLater(
          call,
          throwsA(tError.googleMapErrorToServerException()),
        );
      },
    );
  });

  group('postData', () {
    test(
      'should call Dio.post with the proper path/data/options',
      () async {
        // GIVEN
        when(
          () => mockDio.post(tPath, data: tData, options: tOptions),
        ).thenAnswer((_) async => tResponse);
        // WHEN
        await googleMapApiFacade.postData(
          path: tPath,
          data: tData,
          options: tOptions,
        );
        // THEN
        verify(() => mockDio.post(tPath, data: tData, options: tOptions)).called(1);
        verifyNoMoreInteractions(mockDio);
      },
    );

    test(
      'should return same result from Dio.post when the response is successful',
      () async {
        // GIVEN
        when(() => mockDio.post(any())).thenAnswer((_) async => tResponse);
        // WHEN
        final result = await googleMapApiFacade.postData(path: tPath);
        // THEN
        expect(result, tResponse);
      },
    );

    test(
      'should throw error.googleMapErrorToServerException '
      'when the response is unsuccessful',
      () async {
        // GIVEN
        when(() => mockDio.post(any())).thenThrow(tError);
        // WHEN
        final call = googleMapApiFacade.postData(path: tPath);
        // THEN
        await expectLater(
          call,
          throwsA(tError.googleMapErrorToServerException()),
        );
      },
    );
  });

  group('patchData', () {
    test(
      'should call Dio.patch with the proper path/data/options',
      () async {
        // GIVEN
        when(
          () => mockDio.patch(tPath, data: tData, options: tOptions),
        ).thenAnswer((_) async => tResponse);
        // WHEN
        await googleMapApiFacade.patchData(
          path: tPath,
          data: tData,
          options: tOptions,
        );
        // THEN
        verify(() => mockDio.patch(tPath, data: tData, options: tOptions)).called(1);
        verifyNoMoreInteractions(mockDio);
      },
    );

    test(
      'should return same result from Dio.patch when the response is successful',
      () async {
        // GIVEN
        when(() => mockDio.patch(any())).thenAnswer((_) async => tResponse);
        // WHEN
        final result = await googleMapApiFacade.patchData(path: tPath);
        // THEN
        expect(result, tResponse);
      },
    );

    test(
      'should throw error.googleMapErrorToServerException '
      'when the response is unsuccessful',
      () async {
        // GIVEN
        when(() => mockDio.patch(any())).thenThrow(tError);
        // WHEN
        final call = googleMapApiFacade.patchData(path: tPath);
        // THEN
        await expectLater(
          call,
          throwsA(tError.googleMapErrorToServerException()),
        );
      },
    );
  });

  group('putData', () {
    test(
      'should call Dio.put with the proper path/data/options',
      () async {
        // GIVEN
        when(
          () => mockDio.put(tPath, data: tData, options: tOptions),
        ).thenAnswer((_) async => tResponse);
        // WHEN
        await googleMapApiFacade.putData(
          path: tPath,
          data: tData,
          options: tOptions,
        );
        // THEN
        verify(() => mockDio.put(tPath, data: tData, options: tOptions)).called(1);
        verifyNoMoreInteractions(mockDio);
      },
    );

    test(
      'should return same result from Dio.put when the response is successful',
      () async {
        // GIVEN
        when(() => mockDio.put(any())).thenAnswer((_) async => tResponse);
        // WHEN
        final result = await googleMapApiFacade.putData(path: tPath);
        // THEN
        expect(result, tResponse);
      },
    );

    test(
      'should throw error.googleMapErrorToServerException '
      'when the response is unsuccessful',
      () async {
        // GIVEN
        when(() => mockDio.put(any())).thenThrow(tError);
        // WHEN
        final call = googleMapApiFacade.putData(path: tPath);
        // THEN
        await expectLater(
          call,
          throwsA(tError.googleMapErrorToServerException()),
        );
      },
    );
  });

  group('deleteData', () {
    test(
      'should call Dio.delete with the proper path/data/options',
      () async {
        // GIVEN
        when(
          () => mockDio.delete(tPath, data: tData, options: tOptions),
        ).thenAnswer((_) async => tResponse);
        // WHEN
        await googleMapApiFacade.deleteData(
          path: tPath,
          data: tData,
          options: tOptions,
        );
        // THEN
        verify(() => mockDio.delete(tPath, data: tData, options: tOptions)).called(1);
        verifyNoMoreInteractions(mockDio);
      },
    );

    test(
      'should return same result from Dio.delete when the response is successful',
      () async {
        // GIVEN
        when(() => mockDio.delete(any())).thenAnswer((_) async => tResponse);
        // WHEN
        final result = await googleMapApiFacade.deleteData(path: tPath);
        // THEN
        expect(result, tResponse);
      },
    );

    test(
      'should throw error.googleMapErrorToServerException '
      'when the response is unsuccessful',
      () async {
        // GIVEN
        when(() => mockDio.delete(any())).thenThrow(tError);
        // WHEN
        final call = googleMapApiFacade.deleteData(path: tPath);
        // THEN
        await expectLater(
          call,
          throwsA(tError.googleMapErrorToServerException()),
        );
      },
    );
  });
}

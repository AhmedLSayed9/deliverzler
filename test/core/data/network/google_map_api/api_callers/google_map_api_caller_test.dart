import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/core/data/network/google_map_api/api_callers/google_map_api_caller.dart';
import 'package:deliverzler/core/data/network/google_map_api/extensions/google_map_error_extension.dart';

class MockDio extends Mock implements Dio {}

void main() {
  late MockDio mockDio;
  late GoogleMapApiCaller googleMapApiCaller;

  setUp(() {
    mockDio = MockDio();
    googleMapApiCaller = GoogleMapApiCaller(dio: mockDio);
  });

  const String tPath = 'tPath';
  const Map<String, String> tQueryParameters = {'tQueryKey': 'tQueryValue'};
  final FormData tData = FormData.fromMap({'tDataKey': 'tDataValue'});
  final Options tOptions = Options(
    headers: {'tHeaderKey': 'tHeaderValue'},
  );
  final Response tResponse = Response(
    requestOptions: RequestOptions(path: ''),
    data: {'tResponseKey': 'tResponseValue'},
    statusCode: 200,
  );

  final tError = DioError(
    error: 'error',
    requestOptions: RequestOptions(path: ''),
    type: DioErrorType.response,
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
        await googleMapApiCaller.getData(
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
        final result = await googleMapApiCaller.getData(path: tPath);
        // THEN
        expect(result, tResponse);
      },
    );

    test(
      'should throw error.googleMapErrorToServerException'
      'when the response is unsuccessful',
      () async {
        // GIVEN
        when(() => mockDio.get(any())).thenThrow(tError);
        // WHEN
        final call = googleMapApiCaller.getData(path: tPath);
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
        await googleMapApiCaller.postData(
          path: tPath,
          data: tData,
          options: tOptions,
        );
        // THEN
        verify(() => mockDio.post(tPath, data: tData, options: tOptions))
            .called(1);
        verifyNoMoreInteractions(mockDio);
      },
    );

    test(
      'should return same result from Dio.post when the response is successful',
      () async {
        // GIVEN
        when(() => mockDio.post(any())).thenAnswer((_) async => tResponse);
        // WHEN
        final result = await googleMapApiCaller.postData(path: tPath);
        // THEN
        expect(result, tResponse);
      },
    );

    test(
      'should throw error.googleMapErrorToServerException'
      'when the response is unsuccessful',
      () async {
        // GIVEN
        when(() => mockDio.post(any())).thenThrow(tError);
        // WHEN
        final call = googleMapApiCaller.postData(path: tPath);
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
        await googleMapApiCaller.patchData(
          path: tPath,
          data: tData,
          options: tOptions,
        );
        // THEN
        verify(() => mockDio.patch(tPath, data: tData, options: tOptions))
            .called(1);
        verifyNoMoreInteractions(mockDio);
      },
    );

    test(
      'should return same result from Dio.patch when the response is successful',
      () async {
        // GIVEN
        when(() => mockDio.patch(any())).thenAnswer((_) async => tResponse);
        // WHEN
        final result = await googleMapApiCaller.patchData(path: tPath);
        // THEN
        expect(result, tResponse);
      },
    );

    test(
      'should throw error.googleMapErrorToServerException'
      'when the response is unsuccessful',
      () async {
        // GIVEN
        when(() => mockDio.patch(any())).thenThrow(tError);
        // WHEN
        final call = googleMapApiCaller.patchData(path: tPath);
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
        await googleMapApiCaller.putData(
          path: tPath,
          data: tData,
          options: tOptions,
        );
        // THEN
        verify(() => mockDio.put(tPath, data: tData, options: tOptions))
            .called(1);
        verifyNoMoreInteractions(mockDio);
      },
    );

    test(
      'should return same result from Dio.put when the response is successful',
      () async {
        // GIVEN
        when(() => mockDio.put(any())).thenAnswer((_) async => tResponse);
        // WHEN
        final result = await googleMapApiCaller.putData(path: tPath);
        // THEN
        expect(result, tResponse);
      },
    );

    test(
      'should throw error.googleMapErrorToServerException'
      'when the response is unsuccessful',
      () async {
        // GIVEN
        when(() => mockDio.put(any())).thenThrow(tError);
        // WHEN
        final call = googleMapApiCaller.putData(path: tPath);
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
        await googleMapApiCaller.deleteData(
          path: tPath,
          data: tData,
          options: tOptions,
        );
        // THEN
        verify(() => mockDio.delete(tPath, data: tData, options: tOptions))
            .called(1);
        verifyNoMoreInteractions(mockDio);
      },
    );

    test(
      'should return same result from Dio.delete when the response is successful',
      () async {
        // GIVEN
        when(() => mockDio.delete(any())).thenAnswer((_) async => tResponse);
        // WHEN
        final result = await googleMapApiCaller.deleteData(path: tPath);
        // THEN
        expect(result, tResponse);
      },
    );

    test(
      'should throw error.googleMapErrorToServerException'
      'when the response is unsuccessful',
      () async {
        // GIVEN
        when(() => mockDio.delete(any())).thenThrow(tError);
        // WHEN
        final call = googleMapApiCaller.deleteData(path: tPath);
        // THEN
        await expectLater(
          call,
          throwsA(tError.googleMapErrorToServerException()),
        );
      },
    );
  });
}

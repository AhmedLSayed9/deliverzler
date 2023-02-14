import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:deliverzler/core/data/network/google_map_api/interceptors/content_type_interceptor.dart';
import 'package:deliverzler/core/data/network/i_api_config.dart';

class MockRequestInterceptorHandler extends Mock
    implements RequestInterceptorHandler {}

void main() {
  late MockRequestInterceptorHandler mockRequestInterceptorHandler;
  late ContentTypeInterceptor contentTypeInterceptor;

  setUp(() {
    mockRequestInterceptorHandler = MockRequestInterceptorHandler();
    contentTypeInterceptor = ContentTypeInterceptor();
  });

  group('onRequest', () {
    test(
      'should add multipartFormDataContentType header if the data is FormData'
      'then call handler.next',
      () async {
        // GIVEN
        final tOptions = RequestOptions(
          path: '',
          data: FormData.fromMap({}),
        );
        // WHEN
        contentTypeInterceptor.onRequest(
          tOptions,
          mockRequestInterceptorHandler,
        );
        // THEN
        expect(
          tOptions.headers[IApiConfig.contentTypeHeaderKey],
          IApiConfig.multipartFormDataContentType,
        );
        verify(() => mockRequestInterceptorHandler.next(tOptions)).called(1);
        verifyNoMoreInteractions(mockRequestInterceptorHandler);
      },
    );

    test(
      'should add emptyContentType header if the data is not FormData'
      'then call handler.next',
      () async {
        // GIVEN
        final tOptions = RequestOptions(
          path: '',
          data: {},
        );
        // WHEN
        contentTypeInterceptor.onRequest(
          tOptions,
          mockRequestInterceptorHandler,
        );
        // THEN
        expect(
          tOptions.headers[IApiConfig.contentTypeHeaderKey],
          IApiConfig.emptyContentType,
        );
        verify(() => mockRequestInterceptorHandler.next(tOptions)).called(1);
        verifyNoMoreInteractions(mockRequestInterceptorHandler);
      },
    );
  });
}

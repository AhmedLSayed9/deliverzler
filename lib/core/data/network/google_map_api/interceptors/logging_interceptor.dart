import 'dart:developer';

import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log('LogInterceptor: REQUEST[${options.method}] => PATH: ${options.path} => DATA: ${options.data}');
    return handler.next(options);
  }

  String getFormDataFields(dynamic formData) {
    return (formData as FormData).fields.toString();
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    log('LogInterceptor: RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path} => DATA: ${response.data}');
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log('LogInterceptor: ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path} MESSAGE: ${err.message}');
    return handler.next(err);
  }
}

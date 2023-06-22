import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

class LoggingInterceptor extends Interceptor {
  static final log = Logger('InterceptorLogger');

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    log.fine('REQUEST[${options.method}] => PATH: ${options.path} => DATA: ${options.data}');
    return handler.next(options);
  }

  String getFormDataFields(dynamic formData) {
    return (formData as FormData).fields.toString();
  }

  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    log.fine(
      'RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path} => DATA: ${response.data}',
    );
    return handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    log.fine(
      'ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path} MESSAGE: ${err.message}',
    );
    return handler.next(err);
  }
}

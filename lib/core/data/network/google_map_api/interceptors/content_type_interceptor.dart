import 'package:deliverzler/core/data/network/i_api_config.dart';
import 'package:dio/dio.dart';

class ContentTypeInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (options.data is FormData) {
      options.headers[IApiConfig.contentTypeHeaderKey] =
          IApiConfig.multipartFormDataContentType;
    } else {
      options.headers[IApiConfig.contentTypeHeaderKey] =
          IApiConfig.emptyContentType;
    }

    return handler.next(options);
  }
}

import 'package:dio/dio.dart';

import '../google_map_api_config.dart';

class ApiKeyInterceptor extends QueuedInterceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters[GoogleMapApiConfig.googleMapAPIParamKey] =
        GoogleMapApiConfig.googleMapAPIKey;
    return handler.next(options);
  }
}

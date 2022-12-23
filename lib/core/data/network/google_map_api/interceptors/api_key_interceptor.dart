import 'package:deliverzler/core/data/network/google_map_api/google_map_api_config.dart';
import 'package:dio/dio.dart';

class ApiKeyInterceptor extends QueuedInterceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.queryParameters[GoogleMapApiConfig.googleMapAPIParamKey] =
        GoogleMapApiConfig.googleMapAPIKey;
    return handler.next(options);
  }
}

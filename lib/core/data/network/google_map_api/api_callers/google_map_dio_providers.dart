import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../i_api_config.dart';
import '../google_map_api_config.dart';
import '../interceptors/api_key_interceptor.dart';
import '../interceptors/content_type_interceptor.dart';
import '../interceptors/error_interceptor.dart';
import '../interceptors/logging_interceptor.dart';
import '../interceptors/session_token_interceptor.dart';

part 'google_map_dio_providers.g.dart';

//Note: If you've different subdomains of an API (need same interceptors and other options but different baseUrl),
//then you can use one instance of dio and override the base URL dynamically
@Riverpod(keepAlive: true)
Dio googleMapDio(GoogleMapDioRef ref) {
  return Dio()
    ..options = BaseOptions(
      baseUrl: GoogleMapApiConfig.googleMapBaseUrl,
      connectTimeout: IApiConfig.connectTimeout,
      receiveTimeout: IApiConfig.receiveTimeout,
    )
    ..interceptors.addAll([
      //order is necessary.
      LoggingInterceptor(),
      ContentTypeInterceptor(),
      ApiKeyInterceptor(),
      ref.watch(sessionTokenInterceptorProvider),
      ErrorInterceptor(),
    ]);
}

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

import '../../../services/logger.dart';
import '../../../../presentation/utils/riverpod_framework.dart';
import '../../main_api/main_api_config.dart';
import '../google_map_api_config.dart';
import '../interceptors/api_key_interceptor.dart';
import '../interceptors/content_type_interceptor.dart';
import '../interceptors/error_interceptor.dart';
import '../interceptors/session_token_interceptor.dart';

part 'google_map_dio_providers.g.dart';

//Note: If you've different subdomains of an API (need same interceptors and other options but different baseUrl),
//then you can use one instance of dio and override the base URL dynamically
@Riverpod(keepAlive: true)
Dio googleMapDio(GoogleMapDioRef ref) {
  final logger = Logger('Dio')..level = Level.FINEST;
  final sub = logger.onRecord.listen(loggerOnDataCallback(logColor: LogColor.cyan));
  ref.onDispose(sub.cancel);

  return Dio()
    ..options = BaseOptions(
      baseUrl: GoogleMapApiConfig.googleMapBaseUrl,
      connectTimeout: MainApiConfig.connectTimeout,
      receiveTimeout: MainApiConfig.receiveTimeout,
    )
    ..interceptors.addAll([
      //order is necessary.
      ContentTypeInterceptor(),
      ApiKeyInterceptor(),
      ref.watch(sessionTokenInterceptorProvider),
      ErrorInterceptor(),
      LogInterceptor(logPrint: logger.finest),
    ]);
}

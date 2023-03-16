import 'package:dio/dio.dart';

import '../../../../../features/map/presentation/providers/session_token_provider.dart';
import '../../../../presentation/utils/riverpod_framework.dart';
import '../google_map_api_config.dart';

part 'session_token_interceptor.g.dart';

@Riverpod(keepAlive: true)
SessionTokenInterceptor sessionTokenInterceptor(
    SessionTokenInterceptorRef ref) {
  return SessionTokenInterceptor(ref);
}

class SessionTokenInterceptor extends QueuedInterceptor {
  SessionTokenInterceptor(this.ref);

  final SessionTokenInterceptorRef ref;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final withSessionToken =
        options.extra[GoogleMapApiConfig.withSessionTokenExtraKey];
    if (withSessionToken != null) {
      options.headers[GoogleMapApiConfig.sessionTokenHeaderKey] =
          ref.read(sessionTokenProvider);
    }
    return handler.next(options);
  }
}

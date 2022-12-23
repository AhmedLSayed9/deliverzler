import 'package:deliverzler/core/data/network/google_map_api/google_map_api_config.dart';
import 'package:deliverzler/features/map/presentation/providers/session_token_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final sessionTokenInterceptorProvider =
    Provider<SessionTokenInterceptor>((ref) => SessionTokenInterceptor(ref));

class SessionTokenInterceptor extends QueuedInterceptor {
  SessionTokenInterceptor(this.ref);

  final Ref ref;

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

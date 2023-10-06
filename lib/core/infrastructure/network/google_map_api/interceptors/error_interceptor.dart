// ignore_for_file: avoid_dynamic_calls

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

@visibleForTesting
class RejectError implements Exception {}

class ErrorInterceptor extends Interceptor {
  //This is needed if your api use statusCode 200 for business errors.
  @override
  void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    final data = response.data as Map<dynamic, dynamic>;

    if (data['status'] != 'OK') {
      final error = DioError(
        response: response,
        requestOptions: response.requestOptions,
        error: RejectError(),
      );
      return handler.reject(error, true);
    }

    return handler.next(response);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    // If your api throws custom statusCode i.e 400 for business errors, you can do:
    // `if (statusCode == 400 || err.error is _RejectError)`
    // Note: statusCode is 400 when thrown from backend, error is _RejectError when thrown from onResponse.

    if (err.error is RejectError) {
      final response = err.response!;
      final data = response.data as Map<dynamic, dynamic>;
      final error = data['status'];
      final newErr = err.copyWith(
        response: Response(
          statusCode: 400,
          requestOptions: response.requestOptions,
          statusMessage: response.statusMessage,
          isRedirect: response.isRedirect,
          redirects: response.redirects,
          extra: response.extra,
          headers: response.headers,
        ),
        error: error,
        type: DioErrorType.badResponse,
      );
      return handler.reject(newErr);
    }

    return handler.next(err);
  }
}

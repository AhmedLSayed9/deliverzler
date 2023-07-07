import 'package:dio/dio.dart';

import '../../../error/app_exception.dart';

extension GoogleMapErrorExtension on Object {
  ServerException googleMapErrorToServerException() {
    final error = this;

    if (error is DioError) {
      return error.dioToServerException();
    }

    return ServerException(
      type: ServerExceptionType.unknown,
      message: error.toString(),
    );
  }
}

extension _DioErrorExtension on DioError {
  ServerException dioToServerException() {
    final statusCode = response?.statusCode;
    final message = error?.toString() ?? '';

    return switch (type) {
      DioErrorType.badResponse => switch (statusCode) {
          //400 is our business logic errors code.
          //It's handled by error interceptors of each API.
          400 => ServerException(
              type: ServerExceptionType.general,
              message: message,
              code: statusCode,
            ),
          401 => ServerException(
              type: ServerExceptionType.unauthorized,
              message: message,
              code: statusCode,
            ),
          403 => ServerException(
              type: ServerExceptionType.forbidden,
              message: message,
              code: statusCode,
            ),
          404 || 405 || 501 => ServerException(
              type: ServerExceptionType.notFound,
              message: message,
              code: statusCode,
            ),
          409 => ServerException(
              type: ServerExceptionType.conflict,
              message: message,
              code: statusCode,
            ),
          500 || 502 => ServerException(
              type: ServerExceptionType.internal,
              message: message,
              code: statusCode,
            ),
          503 => ServerException(
              type: ServerExceptionType.serviceUnavailable,
              message: message,
              code: statusCode,
            ),
          _ => ServerException(
              type: ServerExceptionType.unknown,
              message: message,
              code: statusCode,
            ),
        },
      DioErrorType.connectionTimeout ||
      DioErrorType.sendTimeout ||
      DioErrorType.receiveTimeout =>
        ServerException(
          type: ServerExceptionType.timeOut,
          message: message,
          code: 408,
        ),
      DioErrorType.connectionError => ServerException(
          type: ServerExceptionType.noInternet,
          message: message,
          code: 101,
        ),
      DioErrorType.badCertificate => ServerException(
          type: ServerExceptionType.unknown,
          message: message,
          code: statusCode,
        ),
      DioErrorType.cancel || DioErrorType.unknown => ServerException(
          type: ServerExceptionType.unknown,
          message: message,
          code: statusCode,
        ),
    };
  }
}

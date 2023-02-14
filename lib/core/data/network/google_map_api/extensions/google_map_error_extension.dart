import 'dart:io';

import 'package:dio/dio.dart';

import '../../../error/app_exception.dart';

extension GoogleMapErrorExtension on Exception {
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

    switch (type) {
      case DioErrorType.response:
        switch (statusCode) {
          //400 is our business logic errors code.
          //It's handled by error interceptors of each API.
          case 400:
            return ServerException(
              type: ServerExceptionType.general,
              message: message,
              code: statusCode,
            );
          case 401:
            return ServerException(
              type: ServerExceptionType.unauthorized,
              message: message,
              code: statusCode,
            );
          case 403:
            return ServerException(
              type: ServerExceptionType.forbidden,
              message: message,
              code: statusCode,
            );
          case 404:
          case 405:
          case 501:
            return ServerException(
              type: ServerExceptionType.notFound,
              message: message,
              code: statusCode,
            );
          case 409:
            return ServerException(
              type: ServerExceptionType.conflict,
              message: message,
              code: statusCode,
            );
          case 500:
          case 502:
            return ServerException(
              type: ServerExceptionType.internal,
              message: message,
              code: statusCode,
            );
          case 503:
            return ServerException(
              type: ServerExceptionType.serviceUnavailable,
              message: message,
              code: statusCode,
            );
          default:
            return ServerException(
              type: ServerExceptionType.unknown,
              message: message,
              code: statusCode,
            );
        }

      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        return ServerException(
          type: ServerExceptionType.timeOut,
          message: message,
          code: 408,
        );

      case DioErrorType.cancel:
      case DioErrorType.other:
        if (error is SocketException) {
          return ServerException(
            type: ServerExceptionType.noInternet,
            message: message,
            code: 101,
          );
        } else {
          return ServerException(
            type: ServerExceptionType.unknown,
            message: message,
            code: statusCode,
          );
        }
    }
  }
}

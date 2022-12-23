import 'dart:async';

import 'package:deliverzler/core/data/error/app_exception.dart';
import 'package:deliverzler/core/data/error/server_exception_type.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseErrorExtension on Exception {
  ServerException firebaseErrorToServerException() {
    final exception = this;

    if (exception is FirebaseAuthException) {
      return exception.firebaseAuthToServerException();
    }
    if (exception is TimeoutException) {
      return ServerException(
        type: ServerExceptionType.timeOut,
        message: exception.message ??
            'Connecting timed out [${exception.duration}ms]',
        code: 408,
      );
    }
    return ServerException(
      type: ServerExceptionType.unknown,
      message: exception.toString(),
    );
  }
}

extension _FirebaseAuthErrorExtension on FirebaseAuthException {
  //TODO: Handle all auth exception cases and add unit tests
  ServerException firebaseAuthToServerException() {
    switch (code) {
      case "invalid-email":
        return ServerException(
          type: ServerExceptionType.authInvalidEmail,
          message: message ?? code,
        );
      case "wrong-password":
        return ServerException(
          type: ServerExceptionType.authWrongPassword,
          message: message ?? code,
        );
      case "user-not-found":
        return ServerException(
          type: ServerExceptionType.authUserNotFound,
          message: message ?? code,
        );
      case "user-disabled":
        return ServerException(
          type: ServerExceptionType.authUserDisabled,
          message: message ?? code,
        );
      default:
        return ServerException(
          type: ServerExceptionType.unknown,
          message: message ?? code,
        );
    }
  }
}

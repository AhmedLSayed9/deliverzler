import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

import '../../../error/app_exception.dart';

extension FirebaseErrorExtension on Object {
  ServerException firebaseErrorToServerException() {
    final exception = this;

    if (exception is FirebaseAuthException) {
      return exception.firebaseAuthToServerException();
    }
    if (exception is TimeoutException) {
      return ServerException(
        type: ServerExceptionType.timeOut,
        message: exception.message ?? 'Connecting timed out [${exception.duration}ms]',
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
  // TODO(Ahmed): Handle all auth exception cases and add unit tests
  ServerException firebaseAuthToServerException() {
    return switch (code) {
      'invalid-email' => ServerException(
          type: ServerExceptionType.authInvalidEmail,
          message: message ?? code,
        ),
      'wrong-password' => ServerException(
          type: ServerExceptionType.authWrongPassword,
          message: message ?? code,
        ),
      'user-not-found' => ServerException(
          type: ServerExceptionType.authUserNotFound,
          message: message ?? code,
        ),
      'user-disabled' => ServerException(
          type: ServerExceptionType.authUserDisabled,
          message: message ?? code,
        ),
      _ => ServerException(
          type: ServerExceptionType.unknown,
          message: message ?? code,
        ),
    };
  }
}

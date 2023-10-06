import 'package:flutter/material.dart';

import '../../infrastructure/error/app_exception.dart';
import '../helpers/localization_helper.dart';

extension AppErrorExtension on Object {
  String errorMessage(BuildContext context) {
    final error = this;
    if (error is AppException) {
      return error.map(
        serverException: (ex) => ex.serverErrorMessage(context),
        cacheException: (ex) => ex.cacheErrorMessage(context),
      );
    }
    return tr(context).unknownError;
  }
}

extension _ServerErrorExtension on ServerException {
  String serverErrorMessage(BuildContext context) {
    return switch (type) {
      ServerExceptionType.general => message, //Business logic error message from the backend
      ServerExceptionType.unauthorized => tr(context).unauthorizedError,
      ServerExceptionType.forbidden => tr(context).forbiddenError,
      ServerExceptionType.notFound => tr(context).notFoundError,
      ServerExceptionType.conflict => tr(context).conflictError,
      ServerExceptionType.internal => tr(context).internalError,
      ServerExceptionType.serviceUnavailable => tr(context).serviceUnavailableError,
      ServerExceptionType.timeOut => tr(context).timeoutError,
      ServerExceptionType.noInternet => tr(context).noInternetError,
      ServerExceptionType.authInvalidEmail => tr(context).authInvalidEmailError,
      ServerExceptionType.authWrongPassword => tr(context).authWrongPasswordError,
      ServerExceptionType.authUserNotFound => tr(context).authUserNotFoundError,
      ServerExceptionType.authUserDisabled => tr(context).authUserDisabledError,
      ServerExceptionType.unknown => tr(context).unknownError,
    };
  }
}

extension _CacheErrorExtension on CacheException {
  String cacheErrorMessage(BuildContext context) {
    return switch (type) {
      CacheExceptionType.general => message,
      _ => tr(context).unknownError,
    };
  }
}

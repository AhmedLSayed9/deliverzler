import 'dart:async';
import 'dart:io';

import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/services/init_services/localization_service.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class Exceptions {
  static String errorMessage(dynamic e, {String? server}) {
    if (e is TimeoutException) {
      return 'Looks like the server is taking to long to respond.';
    }

    if (e is DioError) {
      if (e.error is SocketException) {
        return e.error.toString().replaceAll("SocketException: ", "");
      }

      final statusCode = e.response?.statusCode;

      switch (statusCode) {
        case 400:
          return 'Looks like you have an unstable network at the moment';
        case 403:
          return 'Forbidden';
        case 404:
          return 'Request page not found';
        default:
          return 'Cannot connect to server' +
              (server ??
                  e.toString().substring(
                      0, e.toString().length < 30 ? e.toString().length : 30));
      }
    } else {
      return e
          .toString()
          .substring(0, e.toString().length < 30 ? e.toString().length : 30);
    }
  }

  static int? statusCode(dynamic e) {
    return e is DioError ? e.response?.statusCode : null;
  }

  static String firebaseAuthErrorMessage(FirebaseAuthException e) {
    if (e.code == 'network-request-failed') {
      return tr(NavigationService.context).pleaseTryAgainLater;
    } else if (e.code == 'auth/invalid-email' || e.code == 'invalid-password') {
      return tr(NavigationService.context).emailOrPasswordIsInCorrect;
    } else {
      return tr(NavigationService.context).pleaseTryAgainLater;
    }
  }
}

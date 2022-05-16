import 'dart:async';
import 'dart:io';

import 'package:deliverzler/core/services/localization_service.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

abstract class Exceptions {
  static String errorMessage(
    dynamic error, {
    String? server,
  }) {
    if (error is TimeoutException) {
      return 'Looks like the server is taking to long to respond.';
    }

    if (error is DioError) {
      if (error.error is SocketException) {
        return error.error.toString().replaceAll("SocketException: ", "");
      }

      final statusCode = error.response?.statusCode;

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
                  error.toString().substring(
                      0,
                      error.toString().length < 30
                          ? error.toString().length
                          : 30));
      }
    } else {
      return error.toString().substring(
          0, error.toString().length < 30 ? error.toString().length : 30);
    }
  }

  static int? statusCode(dynamic e) {
    return e is DioError ? e.response?.statusCode : null;
  }

  static String firebaseAuthErrorMessage(
      BuildContext context, FirebaseAuthException e) {
    if (e.code == 'network-request-failed') {
      return tr(context).pleaseTryAgainLater;
    } else if (e.code == 'auth/invalid-email' || e.code == 'invalid-password') {
      return tr(context).emailOrPasswordIsInCorrect;
    } else {
      return tr(context).pleaseTryAgainLater;
    }
  }
}

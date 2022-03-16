import 'package:deliverzler/core/errors/exceptions.dart';
import 'package:deliverzler/core/errors/failures.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApisCaller {
  ApisCaller._() {
    dio = Dio(
      BaseOptions(
        connectTimeout: 20000,
        receiveTimeout: 20000,
      ),
    );
  }

  static final instance = ApisCaller._();

  late Dio dio;

  Future<T> getData<T>({
    required String path,
    required Map<String, String>? queryParameters,
    required T Function(dynamic data) builder,
  }) async {
    try {
      Response response = await dio.get(path, queryParameters: queryParameters);
      return builder(response.data);
    } catch (e) {
      debugPrint(e.toString());
      final _failure = ServerFailure(
        message: Exceptions.errorMessage(e),
        statusCode: Exceptions.statusCode(e),
      );
      return builder(_failure);
    }
  }
}

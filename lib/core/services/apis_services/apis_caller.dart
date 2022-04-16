import 'dart:developer';

import 'package:deliverzler/core/errors/exceptions.dart';
import 'package:deliverzler/core/errors/failures.dart';
import 'package:dio/dio.dart';

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
    Map<String, dynamic>? headers,
    required Map<String, String>? queryParameters,
    required T Function(dynamic data) builder,
  }) async {
    try {
      dio.options.headers = headers;
      Response response = await dio.get(path, queryParameters: queryParameters);
      return builder(response.data);
    } catch (e) {
      log(e.toString());
      final _failure = ServerFailure(
        message: Exceptions.errorMessage(e),
        statusCode: Exceptions.statusCode(e),
      );
      return builder(_failure);
    }
  }

  Future<T> postData<T>({
    required String path,
    required Map<String, dynamic>? headers,
    dynamic data,
    required T Function(dynamic data) builder,
  }) async {
    try {
      dio.options.headers = headers;
      Response response = await dio.post(path, data: data);
      return builder(response.data);
    } catch (e) {
      log(e.toString());
      final _failure = ServerFailure(
        message: Exceptions.errorMessage(e),
        statusCode: Exceptions.statusCode(e),
      );
      return builder(_failure);
    }
  }

  Future<T> patchData<T>({
    required String path,
    required Map<String, dynamic>? headers,
    dynamic data,
    required T Function(dynamic data) builder,
  }) async {
    try {
      dio.options.headers = headers;
      Response response = await dio.patch(path, data: data);
      return builder(response.data);
    } catch (e) {
      log(e.toString());
      final _failure = ServerFailure(
        message: Exceptions.errorMessage(e),
        statusCode: Exceptions.statusCode(e),
      );
      return builder(_failure);
    }
  }

  Future<T> putData<T>({
    required String path,
    required Map<String, dynamic>? headers,
    dynamic data,
    required T Function(dynamic data) builder,
  }) async {
    try {
      dio.options.headers = headers;
      Response response = await dio.put(path, data: data);
      return builder(response.data);
    } catch (e) {
      log(e.toString());
      final _failure = ServerFailure(
        message: Exceptions.errorMessage(e),
        statusCode: Exceptions.statusCode(e),
      );
      return builder(_failure);
    }
  }

  Future<T> deleteData<T>({
    required String path,
    required Map<String, dynamic>? headers,
    dynamic data,
    required T Function(dynamic data) builder,
  }) async {
    try {
      dio.options.headers = headers;
      Response response = await dio.delete(path, data: data);
      return builder(response.data);
    } catch (e) {
      log(e.toString());
      final _failure = ServerFailure(
        message: Exceptions.errorMessage(e),
        statusCode: Exceptions.statusCode(e),
      );
      return builder(_failure);
    }
  }
}

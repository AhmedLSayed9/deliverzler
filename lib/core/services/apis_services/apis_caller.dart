import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/utils/dialogs.dart';

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
    required T Function(Map<String, dynamic>? data) builder,
  }) async {
    try {
      Response response = await dio.get(path, queryParameters: queryParameters);
      if (response.statusCode == 200) {
        return builder(response.data);
      }
      return builder(null);
    } catch (e) {
      debugPrint(e.toString());
      AppDialogs.showDefaultErrorDialog();
      return builder(null);
    }
  }
}

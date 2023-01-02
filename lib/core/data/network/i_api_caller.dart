import 'package:dio/dio.dart';

abstract class IApiCaller {
  Future<Response> getData({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  });

  Future<Response> postData({
    required String path,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  });

  Future<Response> patchData({
    required String path,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  });

  Future<Response> putData({
    required String path,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  });

  Future<Response> deleteData({
    required String path,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  });
}

import 'package:deliverzler/core/data/network/google_map_api/api_callers/google_map_dio_providers.dart';
import 'package:deliverzler/core/data/network/google_map_api/extensions/google_map_error_extension.dart';
import 'package:deliverzler/core/data/network/i_api_caller.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final googleMapApiCallerProvider = Provider<IApiCaller>(
  (ref) => GoogleMapApiCaller(
    dio: ref.watch(googleMapDioProvider),
  ),
);

class GoogleMapApiCaller implements IApiCaller {
  GoogleMapApiCaller({required this.dio});

  final Dio dio;

  @override
  Future<Response> getData({
    required String path,
    Map<String, String>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await _tryCatchWrapper(
      () async {
        return await dio.get(
          path,
          queryParameters: queryParameters,
          //Every request can pass an Options object which will be merged with Dio.options
          options: options,
          cancelToken: cancelToken,
        );
      },
    );
  }

  @override
  Future<Response> postData({
    required String path,
    Map<String, String>? queryParameters,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await _tryCatchWrapper(
      () async {
        return await dio.post(
          path,
          queryParameters: queryParameters,
          data: data,
          options: options,
          cancelToken: cancelToken,
        );
      },
    );
  }

  @override
  Future<Response> patchData({
    required String path,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await _tryCatchWrapper(
      () async {
        return await dio.patch(
          path,
          data: data,
          options: options,
          cancelToken: cancelToken,
        );
      },
    );
  }

  @override
  Future<Response> putData({
    required String path,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await _tryCatchWrapper(
      () async {
        return await dio.put(
          path,
          data: data,
          options: options,
          cancelToken: cancelToken,
        );
      },
    );
  }

  @override
  Future<Response> deleteData({
    required String path,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return await _tryCatchWrapper(
      () async {
        return await dio.delete(
          path,
          data: data,
          options: options,
          cancelToken: cancelToken,
        );
      },
    );
  }

  Future<T> _tryCatchWrapper<T>(Future<T> Function() body) async {
    try {
      return await body();
    } on Exception catch (e) {
      throw e.googleMapErrorToServerException();
    }
  }
}

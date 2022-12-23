import 'package:dio/dio.dart';

import '../../../../presentation/utils/riverpod_framework.dart';
import '../extensions/google_map_error_extension.dart';
import 'google_map_dio_providers.dart';

part 'google_map_api_facade.g.dart';

@Riverpod(keepAlive: true)
GoogleMapApiFacade googleMapApiFacade(GoogleMapApiFacadeRef ref) {
  return GoogleMapApiFacade(
    dio: ref.watch(googleMapDioProvider),
  );
}

class GoogleMapApiFacade {
  GoogleMapApiFacade({required this.dio});

  final Dio dio;

  Future<Response> getData({
    required String path,
    Map<String, dynamic>? queryParameters,
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

  Future<Response> postData({
    required String path,
    Map<String, dynamic>? queryParameters,
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

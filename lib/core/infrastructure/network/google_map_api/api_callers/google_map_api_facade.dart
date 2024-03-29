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

  Future<Response<T>> getData<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _errorHandler(
      () async {
        return dio.get(
          path,
          queryParameters: queryParameters,
          //Every request can pass an Options object which will be merged with Dio.options
          options: options,
          cancelToken: cancelToken,
        );
      },
    );
  }

  Future<Response<T>> postData<T>({
    required String path,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _errorHandler(
      () async {
        return dio.post(
          path,
          queryParameters: queryParameters,
          data: data,
          options: options,
          cancelToken: cancelToken,
        );
      },
    );
  }

  Future<Response<T>> patchData<T>({
    required String path,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _errorHandler(
      () async {
        return dio.patch(
          path,
          data: data,
          options: options,
          cancelToken: cancelToken,
        );
      },
    );
  }

  Future<Response<T>> putData<T>({
    required String path,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _errorHandler(
      () async {
        return dio.put(
          path,
          data: data,
          options: options,
          cancelToken: cancelToken,
        );
      },
    );
  }

  Future<Response<T>> deleteData<T>({
    required String path,
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    return _errorHandler(
      () async {
        return dio.delete(
          path,
          data: data,
          options: options,
          cancelToken: cancelToken,
        );
      },
    );
  }

  Future<T> _errorHandler<T>(Future<T> Function() body) async {
    try {
      return await body();
    } catch (e, st) {
      final error = e.googleMapErrorToServerException();
      throw Error.throwWithStackTrace(error, st);
    }
  }
}

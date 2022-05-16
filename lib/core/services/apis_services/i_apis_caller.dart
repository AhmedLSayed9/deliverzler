abstract class IApisCaller {
  Future<T> getData<T>({
    required String path,
    Map<String, dynamic>? headers,
    Map<String, String>? queryParameters,
    required T Function(dynamic data) builder,
  });

  Future<T> postData<T>({
    required String path,
    required Map<String, dynamic>? headers,
    dynamic data,
    required T Function(dynamic data) builder,
  });

  Future<T> patchData<T>({
    required String path,
    required Map<String, dynamic>? headers,
    dynamic data,
    required T Function(dynamic data) builder,
  });

  Future<T> putData<T>({
    required String path,
    required Map<String, dynamic>? headers,
    dynamic data,
    required T Function(dynamic data) builder,
  });

  Future<T> deleteData<T>({
    required String path,
    required Map<String, dynamic>? headers,
    dynamic data,
    required T Function(dynamic data) builder,
  });
}

import 'package:dio/dio.dart';

class ErrorInterceptor extends Interceptor {
  //This needed if your api use statusCode 200 for business errors..
  //If has error, we reject with proper DioError: [error message from backend / statusCode 400 / DioErrorType.response]
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.data?['status'] != 'OK') {
      final tError = DioError(
        error: response.data?['status'],
        response: Response(
          requestOptions: RequestOptions(path: response.requestOptions.path),
          statusCode: 400,
        ),
        requestOptions: RequestOptions(path: response.requestOptions.path),
        type: DioErrorType.response,
      );
      return handler.reject(tError);
    }
    return handler.next(response);
  }

//This needed if your api throw custom statusCode for business errors..
//We override DioError message with error message from backend and DioError type with DioErrorType.response
/*
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    final statusCode = err.response?.statusCode;

    if (statusCode == 400 || statusCode == 424) {
      err.error = err.response!.data['error_description'];
      err.type = DioErrorType.response;
      return handler.reject(err);
    }

    return handler.next(err);
  }*/
}

abstract class IApiConfig {
  static const int connectTimeout = 10 * 1000;
  static const int receiveTimeout = 20 * 1000;

  static const contentTypeHeaderKey = 'content-type';
  static const applicationJsonContentType = 'application/json';
  static const multipartFormDataContentType = 'multipart/form-data';
  static const emptyContentType = '';
}

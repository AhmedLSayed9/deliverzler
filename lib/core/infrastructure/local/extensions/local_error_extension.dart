import '../../error/app_exception.dart';

extension LocaleErrorExtension on Object {
  CacheException localErrorToCacheException() {
    final error = this;

    if (error is CacheException && error.type == CacheExceptionType.general) {
      return error;
    }

    return CacheException(
      type: CacheExceptionType.unknown,
      message: error.toString(),
    );
  }
}

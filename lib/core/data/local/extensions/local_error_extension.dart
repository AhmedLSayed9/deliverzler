import '../../error/app_exception.dart';

extension LocaleErrorExtension on Exception {
  CacheException localErrorToCacheException() {
    final error = this;

    return CacheException(
      type: CacheExceptionType.general,
      message: error.toString(),
    );
  }
}

import 'package:deliverzler/core/data/error/cache_exception_type.dart';
import 'package:deliverzler/core/data/error/server_exception_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException implements Exception {
  const factory AppException.serverException({
    required ServerExceptionType type,
    required String message,
    int? code,
  }) = ServerException;

  const factory AppException.cacheException({
    required CacheExceptionType type,
    required String message,
    int? code,
  }) = CacheException;
}

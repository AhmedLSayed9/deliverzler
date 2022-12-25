part of 'app_exception.dart';

enum CacheExceptionType {
  unknown,
  general,
  notFound, //Thrown when cache is empty or not found
  expired; //Thrown when cache is expired
}

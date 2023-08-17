import 'dart:async' as dart_async;

extension FutureErrorX<T> on Future<T> {
  Future<void> suppressError({bool Function(Object e)? shouldSuppressError}) async {
    try {
      await this;
    } catch (e) {
      if (shouldSuppressError?.call(e) ?? true) return;
      rethrow;
    }
  }
}

extension FutureIterableErrorX<R, T extends Iterable<R>> on Future<T> {
  Future<T> throwAllErrors() async {
    try {
      return await this;
    } catch (e) {
      if (e is ParallelWaitError<Iterable<Object?>, List<dart_async.AsyncError?>>) {
        final errorsWithStackTrace =
            e.errors.map((e) => '\nError: ${e?.error}\nStackTrace: ${e?.stackTrace}').toList();
        throw Error.throwWithStackTrace(errorsWithStackTrace.toString(), StackTrace.current);
      }
      rethrow;
    }
  }

  Future<T> throwFirstError() async {
    try {
      return await this;
    } catch (e) {
      if (e is ParallelWaitError<Iterable<Object?>, List<dart_async.AsyncError?>>) {
        final error = e.errors.firstWhere((e) => e != null);
        throw Error.throwWithStackTrace(error.toString(), error?.stackTrace ?? StackTrace.current);
      }
      rethrow;
    }
  }
}

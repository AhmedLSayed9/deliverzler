part of '../providers/provider_utils.dart';

extension AutoDisposeRefExtension<T> on AutoDisposeRef<T> {
  /// When invoked keeps your provider alive for [duration]
  void cacheFor(Duration duration) {
    final link = keepAlive();
    final timer = Timer(duration, link.close);
    onDispose(timer.cancel);
  }

  /// Configures the amount of time before a provider is disposed when it is not listened.
  void disposeDelay(Duration duration) {
    final link = keepAlive();
    Timer? timer;

    onCancel(() {
      timer = Timer(duration, link.close);
    });

    onDispose(() {
      timer?.cancel();
    });

    onResume(() {
      timer?.cancel();
    });
  }

  CancelToken cancelToken() {
    // An object from package:dio that allows cancelling pending network requests
    // if they are no-longer needed.
    final cancelToken = CancelToken();
    onDispose(cancelToken.cancel);
    return cancelToken;
  }

  /// Keep listening to an autoDispose provider until last listener is removed.
  ///
  /// This is primarily used to initialize and preserve the state of the provider
  /// when navigating to a route until that route is popped off.
  ///
  /// see: https://github.com/rrousselGit/riverpod/issues/1329
  void keepAliveUntilNoListeners() {
    keepAlive();
    onCancel(invalidateSelf);
  }
}

import 'package:logging/logging.dart';

import '../utils/riverpod_framework.dart';

class ProviderLogger extends ProviderObserver {
  static final log = Logger('ProviderLogger');

  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log.fine(
        '[DidUpdateProvider: ${provider.name ?? provider.runtimeType}] newValue: $newValue');
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    log.fine('[DidDisposeProvider: ${provider.name ?? provider.runtimeType}]');
  }

  @override
  void providerDidFail(
    ProviderBase provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    log.severe(
      '[ProviderDidFail: ${provider.name ?? provider.runtimeType}]',
      error,
      stackTrace,
    );
  }
}

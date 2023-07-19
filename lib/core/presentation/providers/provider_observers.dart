import 'package:logging/logging.dart';

import '../utils/logger.dart';
import '../utils/riverpod_framework.dart';

const _riverpodEmoji = '🏞️ ';

class ProviderLogger extends ProviderObserver {
  ProviderLogger() : _logger = Logger('Riverpod') {
    _logger.level = Level.FINER; //Turn off logging for messages whose level is under this level.
    _logger.onRecord.listen(loggerOnDataCallback(prefix: _riverpodEmoji));
  }

  final Logger _logger;

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    _logger.fine(
      '➕ DidAddProvider: ${provider.name ?? provider.runtimeType}\n'
      '=> value: $value',
    );
  }

  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (newValue is AsyncError) return;

    _logger.finer(
      '🔄 DidUpdateProvider: ${provider.name ?? provider.runtimeType}\n'
      '=> oldValue: $previousValue\n'
      '=> newValue: $newValue',
    );
  }

  @override
  void didDisposeProvider(ProviderBase<dynamic> provider, ProviderContainer container) {
    _logger.fine('🗑️ DidDisposeProvider: ${provider.name ?? provider.runtimeType}');
  }
}

class ProviderCrashlytics extends ProviderObserver {
  ProviderCrashlytics() : _logger = Logger('Riverpod-Crashlytics') {
    _logger.level = Level.SEVERE;
    _logger.onRecord.listen(loggerOnDataCallback(prefix: _riverpodEmoji, logColor: LogColor.red));
  }

  final Logger _logger;

  //This is temporary until https://github.com/rrousselGit/riverpod/issues/1580 is fixed.
  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    if (newValue is! AsyncError) return;

    _logger.severe(
      '⛔️ ProviderDidFail: ${provider.name ?? provider.runtimeType}\n'
      '=> oldValue: $previousValue\n'
      '=> error: ${newValue.error}\n'
      '=> stackTrace: ${newValue.stackTrace}',
    );
  }

  @override
  void providerDidFail(
    ProviderBase<dynamic> provider,
    Object error,
    StackTrace stackTrace,
    ProviderContainer container,
  ) {
    _logger.severe(
      '⛔️ ProviderDidFail: ${provider.name ?? provider.runtimeType}\n'
      '=> error: $error\n'
      '=> stackTrace: $stackTrace',
    );
  }
}

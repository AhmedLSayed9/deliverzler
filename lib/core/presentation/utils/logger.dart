import 'dart:developer' as dev;

import 'package:logging/logging.dart';

void Function(LogRecord)? loggerOnDataCallback({String prefix = '', LogColor? logColor}) {
  return (record) {
    final message = logColor?.colorize(record.message) ?? record.message;
    dev.log(
      '$prefix$message',
      time: record.time,
      sequenceNumber: record.sequenceNumber,
      level: record.level.value,
      name: record.loggerName,
      zone: record.zone,
      error: record.error,
      stackTrace: record.stackTrace,
    );
  };
}

enum LogColor {
  black('\x1B[30m'),
  white('\x1B[37m'),
  red('\x1B[31m'),
  green('\x1B[32m'),
  yellow('\x1B[33m'),
  blue('\x1B[34m'),
  cyan('\x1B[36m');

  const LogColor(this._code);

  final String _code;
  static const _resetCode = '\x1B[0m';

  String colorize(String msg) => _multiLineColor(msg);

  String _multiLineColor(String msg) {
    final pattern = RegExp(r'(^.*$)', multiLine: true);
    return msg.replaceAllMapped(pattern, (match) => '$_code${match.group(0)}$_resetCode');
  }
}

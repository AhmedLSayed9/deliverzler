// ignore: depend_on_referenced_packages, implementation_imports
import 'package:riverpod/src/notifier.dart' as notifier;

export 'package:deliverzler/core/presentation/extensions/auto_dispose_ref_extension.dart';
export 'package:deliverzler/core/domain/entities/event.dart';

class AbortedException implements Exception {}

// ignore: invalid_use_of_internal_member
mixin NotifierUpdate<T> on notifier.NotifierBase<T> {
  void update(T Function(T state) cb) => state = cb(state);
}

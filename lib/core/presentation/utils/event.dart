import 'package:flutter/foundation.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'event.freezed.dart';

/// This class is used by Event providers to be able to execute same event again.
/// If you want to disable re-executing same event (when arg has not changed), pass null key.
@freezed
class Event<T> with _$Event<T> {
  const factory Event({
    required T arg, Key? key,
  }) = _Event<T>;

  factory Event.unique(T arg) => Event(
        key: UniqueKey(),
        arg: arg,
      );
}

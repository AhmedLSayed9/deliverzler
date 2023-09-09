// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Event<T> {
  T get arg => throw _privateConstructorUsedError;
  Key? get key => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EventCopyWith<T, Event<T>> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EventCopyWith<T, $Res> {
  factory $EventCopyWith(Event<T> value, $Res Function(Event<T>) then) =
      _$EventCopyWithImpl<T, $Res, Event<T>>;
  @useResult
  $Res call({T arg, Key? key});
}

/// @nodoc
class _$EventCopyWithImpl<T, $Res, $Val extends Event<T>> implements $EventCopyWith<T, $Res> {
  _$EventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arg = freezed,
    Object? key = freezed,
  }) {
    return _then(_value.copyWith(
      arg: freezed == arg
          ? _value.arg
          : arg // ignore: cast_nullable_to_non_nullable
              as T,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Key?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EventCopyWith<T, $Res> implements $EventCopyWith<T, $Res> {
  factory _$$_EventCopyWith(_$_Event<T> value, $Res Function(_$_Event<T>) then) =
      __$$_EventCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({T arg, Key? key});
}

/// @nodoc
class __$$_EventCopyWithImpl<T, $Res> extends _$EventCopyWithImpl<T, $Res, _$_Event<T>>
    implements _$$_EventCopyWith<T, $Res> {
  __$$_EventCopyWithImpl(_$_Event<T> _value, $Res Function(_$_Event<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? arg = freezed,
    Object? key = freezed,
  }) {
    return _then(_$_Event<T>(
      arg: freezed == arg
          ? _value.arg
          : arg // ignore: cast_nullable_to_non_nullable
              as T,
      key: freezed == key
          ? _value.key
          : key // ignore: cast_nullable_to_non_nullable
              as Key?,
    ));
  }
}

/// @nodoc

class _$_Event<T> with DiagnosticableTreeMixin implements _Event<T> {
  const _$_Event({required this.arg, this.key});

  @override
  final T arg;
  @override
  final Key? key;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Event<$T>(arg: $arg, key: $key)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Event<$T>'))
      ..add(DiagnosticsProperty('arg', arg))
      ..add(DiagnosticsProperty('key', key));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Event<T> &&
            const DeepCollectionEquality().equals(other.arg, arg) &&
            (identical(other.key, key) || other.key == key));
  }

  @override
  int get hashCode => Object.hash(runtimeType, const DeepCollectionEquality().hash(arg), key);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EventCopyWith<T, _$_Event<T>> get copyWith =>
      __$$_EventCopyWithImpl<T, _$_Event<T>>(this, _$identity);
}

abstract class _Event<T> implements Event<T> {
  const factory _Event({required final T arg, final Key? key}) = _$_Event<T>;

  @override
  T get arg;
  @override
  Key? get key;
  @override
  @JsonKey(ignore: true)
  _$$_EventCopyWith<T, _$_Event<T>> get copyWith => throw _privateConstructorUsedError;
}

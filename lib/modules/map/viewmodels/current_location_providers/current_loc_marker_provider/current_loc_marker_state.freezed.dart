// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'current_loc_marker_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CurrentLocMarkerStateTearOff {
  const _$CurrentLocMarkerStateTearOff();

  _Loading loading() {
    return const _Loading();
  }

  _Available available(Marker marker, Circle circle) {
    return _Available(
      marker,
      circle,
    );
  }
}

/// @nodoc
const $CurrentLocMarkerState = _$CurrentLocMarkerStateTearOff();

/// @nodoc
mixin _$CurrentLocMarkerState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Marker marker, Circle circle) available,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Marker marker, Circle circle)? available,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Marker marker, Circle circle)? available,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Available value) available,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Available value)? available,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Available value)? available,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrentLocMarkerStateCopyWith<$Res> {
  factory $CurrentLocMarkerStateCopyWith(CurrentLocMarkerState value,
          $Res Function(CurrentLocMarkerState) then) =
      _$CurrentLocMarkerStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$CurrentLocMarkerStateCopyWithImpl<$Res>
    implements $CurrentLocMarkerStateCopyWith<$Res> {
  _$CurrentLocMarkerStateCopyWithImpl(this._value, this._then);

  final CurrentLocMarkerState _value;
  // ignore: unused_field
  final $Res Function(CurrentLocMarkerState) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$CurrentLocMarkerStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'CurrentLocMarkerState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Marker marker, Circle circle) available,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Marker marker, Circle circle)? available,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Marker marker, Circle circle)? available,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Available value) available,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Available value)? available,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Available value)? available,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CurrentLocMarkerState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$AvailableCopyWith<$Res> {
  factory _$AvailableCopyWith(
          _Available value, $Res Function(_Available) then) =
      __$AvailableCopyWithImpl<$Res>;
  $Res call({Marker marker, Circle circle});
}

/// @nodoc
class __$AvailableCopyWithImpl<$Res>
    extends _$CurrentLocMarkerStateCopyWithImpl<$Res>
    implements _$AvailableCopyWith<$Res> {
  __$AvailableCopyWithImpl(_Available _value, $Res Function(_Available) _then)
      : super(_value, (v) => _then(v as _Available));

  @override
  _Available get _value => super._value as _Available;

  @override
  $Res call({
    Object? marker = freezed,
    Object? circle = freezed,
  }) {
    return _then(_Available(
      marker == freezed
          ? _value.marker
          : marker // ignore: cast_nullable_to_non_nullable
              as Marker,
      circle == freezed
          ? _value.circle
          : circle // ignore: cast_nullable_to_non_nullable
              as Circle,
    ));
  }
}

/// @nodoc

class _$_Available implements _Available {
  const _$_Available(this.marker, this.circle);

  @override
  final Marker marker;
  @override
  final Circle circle;

  @override
  String toString() {
    return 'CurrentLocMarkerState.available(marker: $marker, circle: $circle)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Available &&
            const DeepCollectionEquality().equals(other.marker, marker) &&
            const DeepCollectionEquality().equals(other.circle, circle));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(marker),
      const DeepCollectionEquality().hash(circle));

  @JsonKey(ignore: true)
  @override
  _$AvailableCopyWith<_Available> get copyWith =>
      __$AvailableCopyWithImpl<_Available>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(Marker marker, Circle circle) available,
  }) {
    return available(marker, circle);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Marker marker, Circle circle)? available,
  }) {
    return available?.call(marker, circle);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(Marker marker, Circle circle)? available,
    required TResult orElse(),
  }) {
    if (available != null) {
      return available(marker, circle);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Available value) available,
  }) {
    return available(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Available value)? available,
  }) {
    return available?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Available value)? available,
    required TResult orElse(),
  }) {
    if (available != null) {
      return available(this);
    }
    return orElse();
  }
}

abstract class _Available implements CurrentLocMarkerState {
  const factory _Available(Marker marker, Circle circle) = _$_Available;

  Marker get marker;
  Circle get circle;
  @JsonKey(ignore: true)
  _$AvailableCopyWith<_Available> get copyWith =>
      throw _privateConstructorUsedError;
}

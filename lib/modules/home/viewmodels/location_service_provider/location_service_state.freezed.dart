// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'location_service_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$LocationServiceStateTearOff {
  const _$LocationServiceStateTearOff();

  _Loading loading() {
    return const _Loading();
  }

  _LoadingLocation loadingLocation() {
    return const _LoadingLocation();
  }

  _Error error(String errorText) {
    return _Error(
      errorText,
    );
  }

  _Available available() {
    return const _Available();
  }
}

/// @nodoc
const $LocationServiceState = _$LocationServiceStateTearOff();

/// @nodoc
mixin _$LocationServiceState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loadingLocation,
    required TResult Function(String errorText) error,
    required TResult Function() available,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadingLocation,
    TResult Function(String errorText)? error,
    TResult Function()? available,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadingLocation,
    TResult Function(String errorText)? error,
    TResult Function()? available,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingLocation value) loadingLocation,
    required TResult Function(_Error value) error,
    required TResult Function(_Available value) available,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingLocation value)? loadingLocation,
    TResult Function(_Error value)? error,
    TResult Function(_Available value)? available,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingLocation value)? loadingLocation,
    TResult Function(_Error value)? error,
    TResult Function(_Available value)? available,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationServiceStateCopyWith<$Res> {
  factory $LocationServiceStateCopyWith(LocationServiceState value,
          $Res Function(LocationServiceState) then) =
      _$LocationServiceStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$LocationServiceStateCopyWithImpl<$Res>
    implements $LocationServiceStateCopyWith<$Res> {
  _$LocationServiceStateCopyWithImpl(this._value, this._then);

  final LocationServiceState _value;
  // ignore: unused_field
  final $Res Function(LocationServiceState) _then;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$LocationServiceStateCopyWithImpl<$Res>
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
    return 'LocationServiceState.loading()';
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
    required TResult Function() loadingLocation,
    required TResult Function(String errorText) error,
    required TResult Function() available,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadingLocation,
    TResult Function(String errorText)? error,
    TResult Function()? available,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadingLocation,
    TResult Function(String errorText)? error,
    TResult Function()? available,
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
    required TResult Function(_LoadingLocation value) loadingLocation,
    required TResult Function(_Error value) error,
    required TResult Function(_Available value) available,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingLocation value)? loadingLocation,
    TResult Function(_Error value)? error,
    TResult Function(_Available value)? available,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingLocation value)? loadingLocation,
    TResult Function(_Error value)? error,
    TResult Function(_Available value)? available,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements LocationServiceState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$LoadingLocationCopyWith<$Res> {
  factory _$LoadingLocationCopyWith(
          _LoadingLocation value, $Res Function(_LoadingLocation) then) =
      __$LoadingLocationCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingLocationCopyWithImpl<$Res>
    extends _$LocationServiceStateCopyWithImpl<$Res>
    implements _$LoadingLocationCopyWith<$Res> {
  __$LoadingLocationCopyWithImpl(
      _LoadingLocation _value, $Res Function(_LoadingLocation) _then)
      : super(_value, (v) => _then(v as _LoadingLocation));

  @override
  _LoadingLocation get _value => super._value as _LoadingLocation;
}

/// @nodoc

class _$_LoadingLocation implements _LoadingLocation {
  const _$_LoadingLocation();

  @override
  String toString() {
    return 'LocationServiceState.loadingLocation()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadingLocation);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loadingLocation,
    required TResult Function(String errorText) error,
    required TResult Function() available,
  }) {
    return loadingLocation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadingLocation,
    TResult Function(String errorText)? error,
    TResult Function()? available,
  }) {
    return loadingLocation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadingLocation,
    TResult Function(String errorText)? error,
    TResult Function()? available,
    required TResult orElse(),
  }) {
    if (loadingLocation != null) {
      return loadingLocation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingLocation value) loadingLocation,
    required TResult Function(_Error value) error,
    required TResult Function(_Available value) available,
  }) {
    return loadingLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingLocation value)? loadingLocation,
    TResult Function(_Error value)? error,
    TResult Function(_Available value)? available,
  }) {
    return loadingLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingLocation value)? loadingLocation,
    TResult Function(_Error value)? error,
    TResult Function(_Available value)? available,
    required TResult orElse(),
  }) {
    if (loadingLocation != null) {
      return loadingLocation(this);
    }
    return orElse();
  }
}

abstract class _LoadingLocation implements LocationServiceState {
  const factory _LoadingLocation() = _$_LoadingLocation;
}

/// @nodoc
abstract class _$ErrorCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) then) =
      __$ErrorCopyWithImpl<$Res>;
  $Res call({String errorText});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res>
    extends _$LocationServiceStateCopyWithImpl<$Res>
    implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(_Error _value, $Res Function(_Error) _then)
      : super(_value, (v) => _then(v as _Error));

  @override
  _Error get _value => super._value as _Error;

  @override
  $Res call({
    Object? errorText = freezed,
  }) {
    return _then(_Error(
      errorText == freezed
          ? _value.errorText
          : errorText // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.errorText);

  @override
  final String errorText;

  @override
  String toString() {
    return 'LocationServiceState.error(errorText: $errorText)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            const DeepCollectionEquality().equals(other.errorText, errorText));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(errorText));

  @JsonKey(ignore: true)
  @override
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loadingLocation,
    required TResult Function(String errorText) error,
    required TResult Function() available,
  }) {
    return error(errorText);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadingLocation,
    TResult Function(String errorText)? error,
    TResult Function()? available,
  }) {
    return error?.call(errorText);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadingLocation,
    TResult Function(String errorText)? error,
    TResult Function()? available,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(errorText);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingLocation value) loadingLocation,
    required TResult Function(_Error value) error,
    required TResult Function(_Available value) available,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingLocation value)? loadingLocation,
    TResult Function(_Error value)? error,
    TResult Function(_Available value)? available,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingLocation value)? loadingLocation,
    TResult Function(_Error value)? error,
    TResult Function(_Available value)? available,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements LocationServiceState {
  const factory _Error(String errorText) = _$_Error;

  String get errorText;
  @JsonKey(ignore: true)
  _$ErrorCopyWith<_Error> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$AvailableCopyWith<$Res> {
  factory _$AvailableCopyWith(
          _Available value, $Res Function(_Available) then) =
      __$AvailableCopyWithImpl<$Res>;
}

/// @nodoc
class __$AvailableCopyWithImpl<$Res>
    extends _$LocationServiceStateCopyWithImpl<$Res>
    implements _$AvailableCopyWith<$Res> {
  __$AvailableCopyWithImpl(_Available _value, $Res Function(_Available) _then)
      : super(_value, (v) => _then(v as _Available));

  @override
  _Available get _value => super._value as _Available;
}

/// @nodoc

class _$_Available implements _Available {
  const _$_Available();

  @override
  String toString() {
    return 'LocationServiceState.available()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Available);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function() loadingLocation,
    required TResult Function(String errorText) error,
    required TResult Function() available,
  }) {
    return available();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadingLocation,
    TResult Function(String errorText)? error,
    TResult Function()? available,
  }) {
    return available?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function()? loadingLocation,
    TResult Function(String errorText)? error,
    TResult Function()? available,
    required TResult orElse(),
  }) {
    if (available != null) {
      return available();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_LoadingLocation value) loadingLocation,
    required TResult Function(_Error value) error,
    required TResult Function(_Available value) available,
  }) {
    return available(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingLocation value)? loadingLocation,
    TResult Function(_Error value)? error,
    TResult Function(_Available value)? available,
  }) {
    return available?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_LoadingLocation value)? loadingLocation,
    TResult Function(_Error value)? error,
    TResult Function(_Available value)? available,
    required TResult orElse(),
  }) {
    if (available != null) {
      return available(this);
    }
    return orElse();
  }
}

abstract class _Available implements LocationServiceState {
  const factory _Available() = _$_Available;
}

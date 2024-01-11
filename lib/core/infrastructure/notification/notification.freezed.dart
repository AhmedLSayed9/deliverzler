// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NotificationPayload _$NotificationPayloadFromJson(Map<String, dynamic> json) {
  return _NotificationPayload.fromJson(json);
}

/// @nodoc
mixin _$NotificationPayload {
  String? get routeLocation => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NotificationPayloadCopyWith<NotificationPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationPayloadCopyWith<$Res> {
  factory $NotificationPayloadCopyWith(
          NotificationPayload value, $Res Function(NotificationPayload) then) =
      _$NotificationPayloadCopyWithImpl<$Res, NotificationPayload>;
  @useResult
  $Res call({String? routeLocation, Map<String, dynamic>? data});
}

/// @nodoc
class _$NotificationPayloadCopyWithImpl<$Res, $Val extends NotificationPayload>
    implements $NotificationPayloadCopyWith<$Res> {
  _$NotificationPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeLocation = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      routeLocation: freezed == routeLocation
          ? _value.routeLocation
          : routeLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_NotificationPayloadCopyWith<$Res>
    implements $NotificationPayloadCopyWith<$Res> {
  factory _$$_NotificationPayloadCopyWith(_$_NotificationPayload value,
          $Res Function(_$_NotificationPayload) then) =
      __$$_NotificationPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? routeLocation, Map<String, dynamic>? data});
}

/// @nodoc
class __$$_NotificationPayloadCopyWithImpl<$Res>
    extends _$NotificationPayloadCopyWithImpl<$Res, _$_NotificationPayload>
    implements _$$_NotificationPayloadCopyWith<$Res> {
  __$$_NotificationPayloadCopyWithImpl(_$_NotificationPayload _value,
      $Res Function(_$_NotificationPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? routeLocation = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_NotificationPayload(
      routeLocation: freezed == routeLocation
          ? _value.routeLocation
          : routeLocation // ignore: cast_nullable_to_non_nullable
              as String?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_NotificationPayload implements _NotificationPayload {
  const _$_NotificationPayload(
      {required this.routeLocation, required final Map<String, dynamic>? data})
      : _data = data;

  factory _$_NotificationPayload.fromJson(Map<String, dynamic> json) =>
      _$$_NotificationPayloadFromJson(json);

  @override
  final String? routeLocation;
  final Map<String, dynamic>? _data;
  @override
  Map<String, dynamic>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableMapView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'NotificationPayload(routeLocation: $routeLocation, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NotificationPayload &&
            (identical(other.routeLocation, routeLocation) ||
                other.routeLocation == routeLocation) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, routeLocation, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NotificationPayloadCopyWith<_$_NotificationPayload> get copyWith =>
      __$$_NotificationPayloadCopyWithImpl<_$_NotificationPayload>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_NotificationPayloadToJson(
      this,
    );
  }
}

abstract class _NotificationPayload implements NotificationPayload {
  const factory _NotificationPayload(
      {required final String? routeLocation,
      required final Map<String, dynamic>? data}) = _$_NotificationPayload;

  factory _NotificationPayload.fromJson(Map<String, dynamic> json) =
      _$_NotificationPayload.fromJson;

  @override
  String? get routeLocation;
  @override
  Map<String, dynamic>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_NotificationPayloadCopyWith<_$_NotificationPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

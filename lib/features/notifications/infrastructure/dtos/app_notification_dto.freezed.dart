// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_notification_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AppNotificationDto _$AppNotificationDtoFromJson(Map<String, dynamic> json) {
  return _AppNotificationDto.fromJson(json);
}

/// @nodoc
mixin _$AppNotificationDto {
  String get tabName => throw _privateConstructorUsedError;
  String? get routeLocation => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AppNotificationDtoCopyWith<AppNotificationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppNotificationDtoCopyWith<$Res> {
  factory $AppNotificationDtoCopyWith(
          AppNotificationDto value, $Res Function(AppNotificationDto) then) =
      _$AppNotificationDtoCopyWithImpl<$Res, AppNotificationDto>;
  @useResult
  $Res call({String tabName, String? routeLocation, Map<String, dynamic>? data});
}

/// @nodoc
class _$AppNotificationDtoCopyWithImpl<$Res, $Val extends AppNotificationDto>
    implements $AppNotificationDtoCopyWith<$Res> {
  _$AppNotificationDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabName = null,
    Object? routeLocation = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      tabName: null == tabName
          ? _value.tabName
          : tabName // ignore: cast_nullable_to_non_nullable
              as String,
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
abstract class _$$_AppNotificationDtoCopyWith<$Res> implements $AppNotificationDtoCopyWith<$Res> {
  factory _$$_AppNotificationDtoCopyWith(
          _$_AppNotificationDto value, $Res Function(_$_AppNotificationDto) then) =
      __$$_AppNotificationDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String tabName, String? routeLocation, Map<String, dynamic>? data});
}

/// @nodoc
class __$$_AppNotificationDtoCopyWithImpl<$Res>
    extends _$AppNotificationDtoCopyWithImpl<$Res, _$_AppNotificationDto>
    implements _$$_AppNotificationDtoCopyWith<$Res> {
  __$$_AppNotificationDtoCopyWithImpl(
      _$_AppNotificationDto _value, $Res Function(_$_AppNotificationDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabName = null,
    Object? routeLocation = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_AppNotificationDto(
      tabName: null == tabName
          ? _value.tabName
          : tabName // ignore: cast_nullable_to_non_nullable
              as String,
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
class _$_AppNotificationDto extends _AppNotificationDto {
  const _$_AppNotificationDto(
      {required this.tabName,
      required this.routeLocation,
      required final Map<String, dynamic>? data})
      : _data = data,
        super._();

  factory _$_AppNotificationDto.fromJson(Map<String, dynamic> json) =>
      _$$_AppNotificationDtoFromJson(json);

  @override
  final String tabName;
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
    return 'AppNotificationDto(tabName: $tabName, routeLocation: $routeLocation, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppNotificationDto &&
            (identical(other.tabName, tabName) || other.tabName == tabName) &&
            (identical(other.routeLocation, routeLocation) ||
                other.routeLocation == routeLocation) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, tabName, routeLocation, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppNotificationDtoCopyWith<_$_AppNotificationDto> get copyWith =>
      __$$_AppNotificationDtoCopyWithImpl<_$_AppNotificationDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AppNotificationDtoToJson(
      this,
    );
  }
}

abstract class _AppNotificationDto extends AppNotificationDto {
  const factory _AppNotificationDto(
      {required final String tabName,
      required final String? routeLocation,
      required final Map<String, dynamic>? data}) = _$_AppNotificationDto;
  const _AppNotificationDto._() : super._();

  factory _AppNotificationDto.fromJson(Map<String, dynamic> json) = _$_AppNotificationDto.fromJson;

  @override
  String get tabName;
  @override
  String? get routeLocation;
  @override
  Map<String, dynamic>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_AppNotificationDtoCopyWith<_$_AppNotificationDto> get copyWith =>
      throw _privateConstructorUsedError;
}

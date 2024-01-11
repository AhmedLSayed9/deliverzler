// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_delivery_geo_point_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateDeliveryGeoPointDto {
  String get orderId => throw _privateConstructorUsedError;
  @GeoPointConverter()
  GeoPoint get geoPoint => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateDeliveryGeoPointDtoCopyWith<UpdateDeliveryGeoPointDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateDeliveryGeoPointDtoCopyWith<$Res> {
  factory $UpdateDeliveryGeoPointDtoCopyWith(UpdateDeliveryGeoPointDto value,
          $Res Function(UpdateDeliveryGeoPointDto) then) =
      _$UpdateDeliveryGeoPointDtoCopyWithImpl<$Res, UpdateDeliveryGeoPointDto>;
  @useResult
  $Res call({String orderId, @GeoPointConverter() GeoPoint geoPoint});
}

/// @nodoc
class _$UpdateDeliveryGeoPointDtoCopyWithImpl<$Res,
        $Val extends UpdateDeliveryGeoPointDto>
    implements $UpdateDeliveryGeoPointDtoCopyWith<$Res> {
  _$UpdateDeliveryGeoPointDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? geoPoint = null,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      geoPoint: null == geoPoint
          ? _value.geoPoint
          : geoPoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateDeliveryGeoPointDtoCopyWith<$Res>
    implements $UpdateDeliveryGeoPointDtoCopyWith<$Res> {
  factory _$$_UpdateDeliveryGeoPointDtoCopyWith(
          _$_UpdateDeliveryGeoPointDto value,
          $Res Function(_$_UpdateDeliveryGeoPointDto) then) =
      __$$_UpdateDeliveryGeoPointDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String orderId, @GeoPointConverter() GeoPoint geoPoint});
}

/// @nodoc
class __$$_UpdateDeliveryGeoPointDtoCopyWithImpl<$Res>
    extends _$UpdateDeliveryGeoPointDtoCopyWithImpl<$Res,
        _$_UpdateDeliveryGeoPointDto>
    implements _$$_UpdateDeliveryGeoPointDtoCopyWith<$Res> {
  __$$_UpdateDeliveryGeoPointDtoCopyWithImpl(
      _$_UpdateDeliveryGeoPointDto _value,
      $Res Function(_$_UpdateDeliveryGeoPointDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? geoPoint = null,
  }) {
    return _then(_$_UpdateDeliveryGeoPointDto(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      geoPoint: null == geoPoint
          ? _value.geoPoint
          : geoPoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$_UpdateDeliveryGeoPointDto implements _UpdateDeliveryGeoPointDto {
  const _$_UpdateDeliveryGeoPointDto(
      {required this.orderId, @GeoPointConverter() required this.geoPoint});

  @override
  final String orderId;
  @override
  @GeoPointConverter()
  final GeoPoint geoPoint;

  @override
  String toString() {
    return 'UpdateDeliveryGeoPointDto(orderId: $orderId, geoPoint: $geoPoint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateDeliveryGeoPointDto &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.geoPoint, geoPoint) ||
                other.geoPoint == geoPoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, orderId, geoPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateDeliveryGeoPointDtoCopyWith<_$_UpdateDeliveryGeoPointDto>
      get copyWith => __$$_UpdateDeliveryGeoPointDtoCopyWithImpl<
          _$_UpdateDeliveryGeoPointDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateDeliveryGeoPointDtoToJson(
      this,
    );
  }
}

abstract class _UpdateDeliveryGeoPointDto implements UpdateDeliveryGeoPointDto {
  const factory _UpdateDeliveryGeoPointDto(
          {required final String orderId,
          @GeoPointConverter() required final GeoPoint geoPoint}) =
      _$_UpdateDeliveryGeoPointDto;

  @override
  String get orderId;
  @override
  @GeoPointConverter()
  GeoPoint get geoPoint;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateDeliveryGeoPointDtoCopyWith<_$_UpdateDeliveryGeoPointDto>
      get copyWith => throw _privateConstructorUsedError;
}

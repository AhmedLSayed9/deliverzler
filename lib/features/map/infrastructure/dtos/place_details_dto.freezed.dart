// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaceDetailsDto _$PlaceDetailsDtoFromJson(Map<String, dynamic> json) {
  return _PlaceDetailsDto.fromJson(json);
}

/// @nodoc
mixin _$PlaceDetailsDto {
  @JsonKey(name: 'geometry', fromJson: _fromJsonGeoPoint)
  GeoPoint get geoPoint => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaceDetailsDtoCopyWith<PlaceDetailsDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceDetailsDtoCopyWith<$Res> {
  factory $PlaceDetailsDtoCopyWith(PlaceDetailsDto value, $Res Function(PlaceDetailsDto) then) =
      _$PlaceDetailsDtoCopyWithImpl<$Res, PlaceDetailsDto>;
  @useResult
  $Res call({@JsonKey(name: 'geometry', fromJson: _fromJsonGeoPoint) GeoPoint geoPoint});
}

/// @nodoc
class _$PlaceDetailsDtoCopyWithImpl<$Res, $Val extends PlaceDetailsDto>
    implements $PlaceDetailsDtoCopyWith<$Res> {
  _$PlaceDetailsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geoPoint = null,
  }) {
    return _then(_value.copyWith(
      geoPoint: null == geoPoint
          ? _value.geoPoint
          : geoPoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlaceDetailsDtoCopyWith<$Res> implements $PlaceDetailsDtoCopyWith<$Res> {
  factory _$$_PlaceDetailsDtoCopyWith(
          _$_PlaceDetailsDto value, $Res Function(_$_PlaceDetailsDto) then) =
      __$$_PlaceDetailsDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: 'geometry', fromJson: _fromJsonGeoPoint) GeoPoint geoPoint});
}

/// @nodoc
class __$$_PlaceDetailsDtoCopyWithImpl<$Res>
    extends _$PlaceDetailsDtoCopyWithImpl<$Res, _$_PlaceDetailsDto>
    implements _$$_PlaceDetailsDtoCopyWith<$Res> {
  __$$_PlaceDetailsDtoCopyWithImpl(
      _$_PlaceDetailsDto _value, $Res Function(_$_PlaceDetailsDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geoPoint = null,
  }) {
    return _then(_$_PlaceDetailsDto(
      geoPoint: null == geoPoint
          ? _value.geoPoint
          : geoPoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_PlaceDetailsDto extends _PlaceDetailsDto {
  const _$_PlaceDetailsDto(
      {@JsonKey(name: 'geometry', fromJson: _fromJsonGeoPoint) required this.geoPoint})
      : super._();

  factory _$_PlaceDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$$_PlaceDetailsDtoFromJson(json);

  @override
  @JsonKey(name: 'geometry', fromJson: _fromJsonGeoPoint)
  final GeoPoint geoPoint;

  @override
  String toString() {
    return 'PlaceDetailsDto(geoPoint: $geoPoint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaceDetailsDto &&
            (identical(other.geoPoint, geoPoint) || other.geoPoint == geoPoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, geoPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaceDetailsDtoCopyWith<_$_PlaceDetailsDto> get copyWith =>
      __$$_PlaceDetailsDtoCopyWithImpl<_$_PlaceDetailsDto>(this, _$identity);
}

abstract class _PlaceDetailsDto extends PlaceDetailsDto {
  const factory _PlaceDetailsDto(
      {@JsonKey(name: 'geometry', fromJson: _fromJsonGeoPoint)
      required final GeoPoint geoPoint}) = _$_PlaceDetailsDto;
  const _PlaceDetailsDto._() : super._();

  factory _PlaceDetailsDto.fromJson(Map<String, dynamic> json) = _$_PlaceDetailsDto.fromJson;

  @override
  @JsonKey(name: 'geometry', fromJson: _fromJsonGeoPoint)
  GeoPoint get geoPoint;
  @override
  @JsonKey(ignore: true)
  _$$_PlaceDetailsDtoCopyWith<_$_PlaceDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

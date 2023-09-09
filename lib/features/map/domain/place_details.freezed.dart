// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlaceDetails {
  GeoPoint get geoPoint => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaceDetailsCopyWith<PlaceDetails> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceDetailsCopyWith<$Res> {
  factory $PlaceDetailsCopyWith(PlaceDetails value, $Res Function(PlaceDetails) then) =
      _$PlaceDetailsCopyWithImpl<$Res, PlaceDetails>;
  @useResult
  $Res call({GeoPoint geoPoint});
}

/// @nodoc
class _$PlaceDetailsCopyWithImpl<$Res, $Val extends PlaceDetails>
    implements $PlaceDetailsCopyWith<$Res> {
  _$PlaceDetailsCopyWithImpl(this._value, this._then);

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
abstract class _$$_PlaceDetailsCopyWith<$Res> implements $PlaceDetailsCopyWith<$Res> {
  factory _$$_PlaceDetailsCopyWith(_$_PlaceDetails value, $Res Function(_$_PlaceDetails) then) =
      __$$_PlaceDetailsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({GeoPoint geoPoint});
}

/// @nodoc
class __$$_PlaceDetailsCopyWithImpl<$Res> extends _$PlaceDetailsCopyWithImpl<$Res, _$_PlaceDetails>
    implements _$$_PlaceDetailsCopyWith<$Res> {
  __$$_PlaceDetailsCopyWithImpl(_$_PlaceDetails _value, $Res Function(_$_PlaceDetails) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? geoPoint = null,
  }) {
    return _then(_$_PlaceDetails(
      geoPoint: null == geoPoint
          ? _value.geoPoint
          : geoPoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
    ));
  }
}

/// @nodoc

class _$_PlaceDetails implements _PlaceDetails {
  const _$_PlaceDetails({required this.geoPoint});

  @override
  final GeoPoint geoPoint;

  @override
  String toString() {
    return 'PlaceDetails(geoPoint: $geoPoint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaceDetails &&
            (identical(other.geoPoint, geoPoint) || other.geoPoint == geoPoint));
  }

  @override
  int get hashCode => Object.hash(runtimeType, geoPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaceDetailsCopyWith<_$_PlaceDetails> get copyWith =>
      __$$_PlaceDetailsCopyWithImpl<_$_PlaceDetails>(this, _$identity);
}

abstract class _PlaceDetails implements PlaceDetails {
  const factory _PlaceDetails({required final GeoPoint geoPoint}) = _$_PlaceDetails;

  @override
  GeoPoint get geoPoint;
  @override
  @JsonKey(ignore: true)
  _$$_PlaceDetailsCopyWith<_$_PlaceDetails> get copyWith => throw _privateConstructorUsedError;
}

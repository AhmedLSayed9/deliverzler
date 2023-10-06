// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_directions_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaceDirectionsDto _$PlaceDirectionsDtoFromJson(Map<String, dynamic> json) {
  return _PlaceDirectionsDto.fromJson(json);
}

/// @nodoc
mixin _$PlaceDirectionsDto {
  @JsonKey(fromJson: _fromJsonBounds)
  LatLngBounds get bounds => throw _privateConstructorUsedError;
  @JsonKey(name: 'overview_polyline', fromJson: _fromJsonPolylinePoints)
  List<PointLatLng> get polylinePoints => throw _privateConstructorUsedError;
  @JsonKey(readValue: _readDistance)
  int get distance => throw _privateConstructorUsedError;
  @JsonKey(readValue: _readDuration)
  String get duration => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaceDirectionsDtoCopyWith<PlaceDirectionsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceDirectionsDtoCopyWith<$Res> {
  factory $PlaceDirectionsDtoCopyWith(
          PlaceDirectionsDto value, $Res Function(PlaceDirectionsDto) then) =
      _$PlaceDirectionsDtoCopyWithImpl<$Res, PlaceDirectionsDto>;
  @useResult
  $Res call(
      {@JsonKey(fromJson: _fromJsonBounds)
          LatLngBounds bounds,
      @JsonKey(name: 'overview_polyline', fromJson: _fromJsonPolylinePoints)
          List<PointLatLng> polylinePoints,
      @JsonKey(readValue: _readDistance)
          int distance,
      @JsonKey(readValue: _readDuration)
          String duration});
}

/// @nodoc
class _$PlaceDirectionsDtoCopyWithImpl<$Res, $Val extends PlaceDirectionsDto>
    implements $PlaceDirectionsDtoCopyWith<$Res> {
  _$PlaceDirectionsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bounds = null,
    Object? polylinePoints = null,
    Object? distance = null,
    Object? duration = null,
  }) {
    return _then(_value.copyWith(
      bounds: null == bounds
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as LatLngBounds,
      polylinePoints: null == polylinePoints
          ? _value.polylinePoints
          : polylinePoints // ignore: cast_nullable_to_non_nullable
              as List<PointLatLng>,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlaceDirectionsDtoCopyWith<$Res>
    implements $PlaceDirectionsDtoCopyWith<$Res> {
  factory _$$_PlaceDirectionsDtoCopyWith(_$_PlaceDirectionsDto value,
          $Res Function(_$_PlaceDirectionsDto) then) =
      __$$_PlaceDirectionsDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(fromJson: _fromJsonBounds)
          LatLngBounds bounds,
      @JsonKey(name: 'overview_polyline', fromJson: _fromJsonPolylinePoints)
          List<PointLatLng> polylinePoints,
      @JsonKey(readValue: _readDistance)
          int distance,
      @JsonKey(readValue: _readDuration)
          String duration});
}

/// @nodoc
class __$$_PlaceDirectionsDtoCopyWithImpl<$Res>
    extends _$PlaceDirectionsDtoCopyWithImpl<$Res, _$_PlaceDirectionsDto>
    implements _$$_PlaceDirectionsDtoCopyWith<$Res> {
  __$$_PlaceDirectionsDtoCopyWithImpl(
      _$_PlaceDirectionsDto _value, $Res Function(_$_PlaceDirectionsDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bounds = null,
    Object? polylinePoints = null,
    Object? distance = null,
    Object? duration = null,
  }) {
    return _then(_$_PlaceDirectionsDto(
      bounds: null == bounds
          ? _value.bounds
          : bounds // ignore: cast_nullable_to_non_nullable
              as LatLngBounds,
      polylinePoints: null == polylinePoints
          ? _value._polylinePoints
          : polylinePoints // ignore: cast_nullable_to_non_nullable
              as List<PointLatLng>,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_PlaceDirectionsDto extends _PlaceDirectionsDto {
  const _$_PlaceDirectionsDto(
      {@JsonKey(fromJson: _fromJsonBounds)
          required this.bounds,
      @JsonKey(name: 'overview_polyline', fromJson: _fromJsonPolylinePoints)
          required final List<PointLatLng> polylinePoints,
      @JsonKey(readValue: _readDistance)
          required this.distance,
      @JsonKey(readValue: _readDuration)
          required this.duration})
      : _polylinePoints = polylinePoints,
        super._();

  factory _$_PlaceDirectionsDto.fromJson(Map<String, dynamic> json) =>
      _$$_PlaceDirectionsDtoFromJson(json);

  @override
  @JsonKey(fromJson: _fromJsonBounds)
  final LatLngBounds bounds;
  final List<PointLatLng> _polylinePoints;
  @override
  @JsonKey(name: 'overview_polyline', fromJson: _fromJsonPolylinePoints)
  List<PointLatLng> get polylinePoints {
    if (_polylinePoints is EqualUnmodifiableListView) return _polylinePoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_polylinePoints);
  }

  @override
  @JsonKey(readValue: _readDistance)
  final int distance;
  @override
  @JsonKey(readValue: _readDuration)
  final String duration;

  @override
  String toString() {
    return 'PlaceDirectionsDto(bounds: $bounds, polylinePoints: $polylinePoints, distance: $distance, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaceDirectionsDto &&
            (identical(other.bounds, bounds) || other.bounds == bounds) &&
            const DeepCollectionEquality()
                .equals(other._polylinePoints, _polylinePoints) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, bounds,
      const DeepCollectionEquality().hash(_polylinePoints), distance, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaceDirectionsDtoCopyWith<_$_PlaceDirectionsDto> get copyWith =>
      __$$_PlaceDirectionsDtoCopyWithImpl<_$_PlaceDirectionsDto>(
          this, _$identity);
}

abstract class _PlaceDirectionsDto extends PlaceDirectionsDto {
  const factory _PlaceDirectionsDto(
      {@JsonKey(fromJson: _fromJsonBounds)
          required final LatLngBounds bounds,
      @JsonKey(name: 'overview_polyline', fromJson: _fromJsonPolylinePoints)
          required final List<PointLatLng> polylinePoints,
      @JsonKey(readValue: _readDistance)
          required final int distance,
      @JsonKey(readValue: _readDuration)
          required final String duration}) = _$_PlaceDirectionsDto;
  const _PlaceDirectionsDto._() : super._();

  factory _PlaceDirectionsDto.fromJson(Map<String, dynamic> json) =
      _$_PlaceDirectionsDto.fromJson;

  @override
  @JsonKey(fromJson: _fromJsonBounds)
  LatLngBounds get bounds;
  @override
  @JsonKey(name: 'overview_polyline', fromJson: _fromJsonPolylinePoints)
  List<PointLatLng> get polylinePoints;
  @override
  @JsonKey(readValue: _readDistance)
  int get distance;
  @override
  @JsonKey(readValue: _readDuration)
  String get duration;
  @override
  @JsonKey(ignore: true)
  _$$_PlaceDirectionsDtoCopyWith<_$_PlaceDirectionsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PlaceDirectionsQueryDto {
  @JsonKey(toJson: _toJsonOrigin)
  Position get origin => throw _privateConstructorUsedError;
  @JsonKey(toJson: _toJsonDestination)
  GeoPoint get destination => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaceDirectionsQueryDtoCopyWith<PlaceDirectionsQueryDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceDirectionsQueryDtoCopyWith<$Res> {
  factory $PlaceDirectionsQueryDtoCopyWith(PlaceDirectionsQueryDto value,
          $Res Function(PlaceDirectionsQueryDto) then) =
      _$PlaceDirectionsQueryDtoCopyWithImpl<$Res, PlaceDirectionsQueryDto>;
  @useResult
  $Res call(
      {@JsonKey(toJson: _toJsonOrigin) Position origin,
      @JsonKey(toJson: _toJsonDestination) GeoPoint destination});
}

/// @nodoc
class _$PlaceDirectionsQueryDtoCopyWithImpl<$Res,
        $Val extends PlaceDirectionsQueryDto>
    implements $PlaceDirectionsQueryDtoCopyWith<$Res> {
  _$PlaceDirectionsQueryDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = null,
    Object? destination = null,
  }) {
    return _then(_value.copyWith(
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as Position,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlaceDirectionsQueryDtoCopyWith<$Res>
    implements $PlaceDirectionsQueryDtoCopyWith<$Res> {
  factory _$$_PlaceDirectionsQueryDtoCopyWith(_$_PlaceDirectionsQueryDto value,
          $Res Function(_$_PlaceDirectionsQueryDto) then) =
      __$$_PlaceDirectionsQueryDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(toJson: _toJsonOrigin) Position origin,
      @JsonKey(toJson: _toJsonDestination) GeoPoint destination});
}

/// @nodoc
class __$$_PlaceDirectionsQueryDtoCopyWithImpl<$Res>
    extends _$PlaceDirectionsQueryDtoCopyWithImpl<$Res,
        _$_PlaceDirectionsQueryDto>
    implements _$$_PlaceDirectionsQueryDtoCopyWith<$Res> {
  __$$_PlaceDirectionsQueryDtoCopyWithImpl(_$_PlaceDirectionsQueryDto _value,
      $Res Function(_$_PlaceDirectionsQueryDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = null,
    Object? destination = null,
  }) {
    return _then(_$_PlaceDirectionsQueryDto(
      origin: null == origin
          ? _value.origin
          : origin // ignore: cast_nullable_to_non_nullable
              as Position,
      destination: null == destination
          ? _value.destination
          : destination // ignore: cast_nullable_to_non_nullable
              as GeoPoint,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$_PlaceDirectionsQueryDto implements _PlaceDirectionsQueryDto {
  const _$_PlaceDirectionsQueryDto(
      {@JsonKey(toJson: _toJsonOrigin) required this.origin,
      @JsonKey(toJson: _toJsonDestination) required this.destination});

  @override
  @JsonKey(toJson: _toJsonOrigin)
  final Position origin;
  @override
  @JsonKey(toJson: _toJsonDestination)
  final GeoPoint destination;

  @override
  String toString() {
    return 'PlaceDirectionsQueryDto(origin: $origin, destination: $destination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaceDirectionsQueryDto &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, origin, destination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaceDirectionsQueryDtoCopyWith<_$_PlaceDirectionsQueryDto>
      get copyWith =>
          __$$_PlaceDirectionsQueryDtoCopyWithImpl<_$_PlaceDirectionsQueryDto>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlaceDirectionsQueryDtoToJson(
      this,
    );
  }
}

abstract class _PlaceDirectionsQueryDto implements PlaceDirectionsQueryDto {
  const factory _PlaceDirectionsQueryDto(
      {@JsonKey(toJson: _toJsonOrigin)
          required final Position origin,
      @JsonKey(toJson: _toJsonDestination)
          required final GeoPoint destination}) = _$_PlaceDirectionsQueryDto;

  @override
  @JsonKey(toJson: _toJsonOrigin)
  Position get origin;
  @override
  @JsonKey(toJson: _toJsonDestination)
  GeoPoint get destination;
  @override
  @JsonKey(ignore: true)
  _$$_PlaceDirectionsQueryDtoCopyWith<_$_PlaceDirectionsQueryDto>
      get copyWith => throw _privateConstructorUsedError;
}

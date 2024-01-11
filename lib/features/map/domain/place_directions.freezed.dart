// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'place_directions.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PlaceDirections {
  LatLngBounds get bounds => throw _privateConstructorUsedError;
  List<PointLatLng> get polylinePoints => throw _privateConstructorUsedError;
  int get distance => throw _privateConstructorUsedError;
  String get duration => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaceDirectionsCopyWith<PlaceDirections> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceDirectionsCopyWith<$Res> {
  factory $PlaceDirectionsCopyWith(
          PlaceDirections value, $Res Function(PlaceDirections) then) =
      _$PlaceDirectionsCopyWithImpl<$Res, PlaceDirections>;
  @useResult
  $Res call(
      {LatLngBounds bounds,
      List<PointLatLng> polylinePoints,
      int distance,
      String duration});
}

/// @nodoc
class _$PlaceDirectionsCopyWithImpl<$Res, $Val extends PlaceDirections>
    implements $PlaceDirectionsCopyWith<$Res> {
  _$PlaceDirectionsCopyWithImpl(this._value, this._then);

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
abstract class _$$_PlaceDirectionsCopyWith<$Res>
    implements $PlaceDirectionsCopyWith<$Res> {
  factory _$$_PlaceDirectionsCopyWith(
          _$_PlaceDirections value, $Res Function(_$_PlaceDirections) then) =
      __$$_PlaceDirectionsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {LatLngBounds bounds,
      List<PointLatLng> polylinePoints,
      int distance,
      String duration});
}

/// @nodoc
class __$$_PlaceDirectionsCopyWithImpl<$Res>
    extends _$PlaceDirectionsCopyWithImpl<$Res, _$_PlaceDirections>
    implements _$$_PlaceDirectionsCopyWith<$Res> {
  __$$_PlaceDirectionsCopyWithImpl(
      _$_PlaceDirections _value, $Res Function(_$_PlaceDirections) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? bounds = null,
    Object? polylinePoints = null,
    Object? distance = null,
    Object? duration = null,
  }) {
    return _then(_$_PlaceDirections(
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

class _$_PlaceDirections implements _PlaceDirections {
  const _$_PlaceDirections(
      {required this.bounds,
      required final List<PointLatLng> polylinePoints,
      required this.distance,
      required this.duration})
      : _polylinePoints = polylinePoints;

  @override
  final LatLngBounds bounds;
  final List<PointLatLng> _polylinePoints;
  @override
  List<PointLatLng> get polylinePoints {
    if (_polylinePoints is EqualUnmodifiableListView) return _polylinePoints;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_polylinePoints);
  }

  @override
  final int distance;
  @override
  final String duration;

  @override
  String toString() {
    return 'PlaceDirections(bounds: $bounds, polylinePoints: $polylinePoints, distance: $distance, duration: $duration)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaceDirections &&
            (identical(other.bounds, bounds) || other.bounds == bounds) &&
            const DeepCollectionEquality()
                .equals(other._polylinePoints, _polylinePoints) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.duration, duration) ||
                other.duration == duration));
  }

  @override
  int get hashCode => Object.hash(runtimeType, bounds,
      const DeepCollectionEquality().hash(_polylinePoints), distance, duration);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaceDirectionsCopyWith<_$_PlaceDirections> get copyWith =>
      __$$_PlaceDirectionsCopyWithImpl<_$_PlaceDirections>(this, _$identity);
}

abstract class _PlaceDirections implements PlaceDirections {
  const factory _PlaceDirections(
      {required final LatLngBounds bounds,
      required final List<PointLatLng> polylinePoints,
      required final int distance,
      required final String duration}) = _$_PlaceDirections;

  @override
  LatLngBounds get bounds;
  @override
  List<PointLatLng> get polylinePoints;
  @override
  int get distance;
  @override
  String get duration;
  @override
  @JsonKey(ignore: true)
  _$$_PlaceDirectionsCopyWith<_$_PlaceDirections> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PlaceDirectionsQuery {
  Position get origin => throw _privateConstructorUsedError;
  GeoPoint get destination => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PlaceDirectionsQueryCopyWith<PlaceDirectionsQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaceDirectionsQueryCopyWith<$Res> {
  factory $PlaceDirectionsQueryCopyWith(PlaceDirectionsQuery value,
          $Res Function(PlaceDirectionsQuery) then) =
      _$PlaceDirectionsQueryCopyWithImpl<$Res, PlaceDirectionsQuery>;
  @useResult
  $Res call({Position origin, GeoPoint destination});
}

/// @nodoc
class _$PlaceDirectionsQueryCopyWithImpl<$Res,
        $Val extends PlaceDirectionsQuery>
    implements $PlaceDirectionsQueryCopyWith<$Res> {
  _$PlaceDirectionsQueryCopyWithImpl(this._value, this._then);

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
abstract class _$$_PlaceDirectionsQueryCopyWith<$Res>
    implements $PlaceDirectionsQueryCopyWith<$Res> {
  factory _$$_PlaceDirectionsQueryCopyWith(_$_PlaceDirectionsQuery value,
          $Res Function(_$_PlaceDirectionsQuery) then) =
      __$$_PlaceDirectionsQueryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Position origin, GeoPoint destination});
}

/// @nodoc
class __$$_PlaceDirectionsQueryCopyWithImpl<$Res>
    extends _$PlaceDirectionsQueryCopyWithImpl<$Res, _$_PlaceDirectionsQuery>
    implements _$$_PlaceDirectionsQueryCopyWith<$Res> {
  __$$_PlaceDirectionsQueryCopyWithImpl(_$_PlaceDirectionsQuery _value,
      $Res Function(_$_PlaceDirectionsQuery) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? origin = null,
    Object? destination = null,
  }) {
    return _then(_$_PlaceDirectionsQuery(
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

class _$_PlaceDirectionsQuery implements _PlaceDirectionsQuery {
  const _$_PlaceDirectionsQuery(
      {required this.origin, required this.destination});

  @override
  final Position origin;
  @override
  final GeoPoint destination;

  @override
  String toString() {
    return 'PlaceDirectionsQuery(origin: $origin, destination: $destination)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaceDirectionsQuery &&
            (identical(other.origin, origin) || other.origin == origin) &&
            (identical(other.destination, destination) ||
                other.destination == destination));
  }

  @override
  int get hashCode => Object.hash(runtimeType, origin, destination);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaceDirectionsQueryCopyWith<_$_PlaceDirectionsQuery> get copyWith =>
      __$$_PlaceDirectionsQueryCopyWithImpl<_$_PlaceDirectionsQuery>(
          this, _$identity);
}

abstract class _PlaceDirectionsQuery implements PlaceDirectionsQuery {
  const factory _PlaceDirectionsQuery(
      {required final Position origin,
      required final GeoPoint destination}) = _$_PlaceDirectionsQuery;

  @override
  Position get origin;
  @override
  GeoPoint get destination;
  @override
  @JsonKey(ignore: true)
  _$$_PlaceDirectionsQueryCopyWith<_$_PlaceDirectionsQuery> get copyWith =>
      throw _privateConstructorUsedError;
}

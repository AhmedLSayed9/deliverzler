// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppNotification {
  String get tabName => throw _privateConstructorUsedError;
  String? get routeLocation => throw _privateConstructorUsedError;
  Map<String, dynamic>? get data => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppNotificationCopyWith<AppNotification> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppNotificationCopyWith<$Res> {
  factory $AppNotificationCopyWith(AppNotification value, $Res Function(AppNotification) then) =
      _$AppNotificationCopyWithImpl<$Res, AppNotification>;
  @useResult
  $Res call({String tabName, String? routeLocation, Map<String, dynamic>? data});
}

/// @nodoc
class _$AppNotificationCopyWithImpl<$Res, $Val extends AppNotification>
    implements $AppNotificationCopyWith<$Res> {
  _$AppNotificationCopyWithImpl(this._value, this._then);

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
abstract class _$$_AppNotificationCopyWith<$Res> implements $AppNotificationCopyWith<$Res> {
  factory _$$_AppNotificationCopyWith(
          _$_AppNotification value, $Res Function(_$_AppNotification) then) =
      __$$_AppNotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String tabName, String? routeLocation, Map<String, dynamic>? data});
}

/// @nodoc
class __$$_AppNotificationCopyWithImpl<$Res>
    extends _$AppNotificationCopyWithImpl<$Res, _$_AppNotification>
    implements _$$_AppNotificationCopyWith<$Res> {
  __$$_AppNotificationCopyWithImpl(
      _$_AppNotification _value, $Res Function(_$_AppNotification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tabName = null,
    Object? routeLocation = freezed,
    Object? data = freezed,
  }) {
    return _then(_$_AppNotification(
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

class _$_AppNotification implements _AppNotification {
  const _$_AppNotification(
      {required this.tabName,
      required this.routeLocation,
      required final Map<String, dynamic>? data})
      : _data = data;

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
    return 'AppNotification(tabName: $tabName, routeLocation: $routeLocation, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppNotification &&
            (identical(other.tabName, tabName) || other.tabName == tabName) &&
            (identical(other.routeLocation, routeLocation) ||
                other.routeLocation == routeLocation) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, tabName, routeLocation, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppNotificationCopyWith<_$_AppNotification> get copyWith =>
      __$$_AppNotificationCopyWithImpl<_$_AppNotification>(this, _$identity);
}

abstract class _AppNotification implements AppNotification {
  const factory _AppNotification(
      {required final String tabName,
      required final String? routeLocation,
      required final Map<String, dynamic>? data}) = _$_AppNotification;

  @override
  String get tabName;
  @override
  String? get routeLocation;
  @override
  Map<String, dynamic>? get data;
  @override
  @JsonKey(ignore: true)
  _$$_AppNotificationCopyWith<_$_AppNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

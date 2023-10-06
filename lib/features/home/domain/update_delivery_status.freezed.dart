// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_delivery_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateDeliveryStatus {
  String get orderId => throw _privateConstructorUsedError;
  DeliveryStatus get deliveryStatus => throw _privateConstructorUsedError;
  String? get deliveryId => throw _privateConstructorUsedError;
  String? get employeeCancelNote => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UpdateDeliveryStatusCopyWith<UpdateDeliveryStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateDeliveryStatusCopyWith<$Res> {
  factory $UpdateDeliveryStatusCopyWith(UpdateDeliveryStatus value,
          $Res Function(UpdateDeliveryStatus) then) =
      _$UpdateDeliveryStatusCopyWithImpl<$Res, UpdateDeliveryStatus>;
  @useResult
  $Res call(
      {String orderId,
      DeliveryStatus deliveryStatus,
      String? deliveryId,
      String? employeeCancelNote});
}

/// @nodoc
class _$UpdateDeliveryStatusCopyWithImpl<$Res,
        $Val extends UpdateDeliveryStatus>
    implements $UpdateDeliveryStatusCopyWith<$Res> {
  _$UpdateDeliveryStatusCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? deliveryStatus = null,
    Object? deliveryId = freezed,
    Object? employeeCancelNote = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryStatus: null == deliveryStatus
          ? _value.deliveryStatus
          : deliveryStatus // ignore: cast_nullable_to_non_nullable
              as DeliveryStatus,
      deliveryId: freezed == deliveryId
          ? _value.deliveryId
          : deliveryId // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeCancelNote: freezed == employeeCancelNote
          ? _value.employeeCancelNote
          : employeeCancelNote // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UpdateDeliveryStatusCopyWith<$Res>
    implements $UpdateDeliveryStatusCopyWith<$Res> {
  factory _$$_UpdateDeliveryStatusCopyWith(_$_UpdateDeliveryStatus value,
          $Res Function(_$_UpdateDeliveryStatus) then) =
      __$$_UpdateDeliveryStatusCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String orderId,
      DeliveryStatus deliveryStatus,
      String? deliveryId,
      String? employeeCancelNote});
}

/// @nodoc
class __$$_UpdateDeliveryStatusCopyWithImpl<$Res>
    extends _$UpdateDeliveryStatusCopyWithImpl<$Res, _$_UpdateDeliveryStatus>
    implements _$$_UpdateDeliveryStatusCopyWith<$Res> {
  __$$_UpdateDeliveryStatusCopyWithImpl(_$_UpdateDeliveryStatus _value,
      $Res Function(_$_UpdateDeliveryStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? deliveryStatus = null,
    Object? deliveryId = freezed,
    Object? employeeCancelNote = freezed,
  }) {
    return _then(_$_UpdateDeliveryStatus(
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      deliveryStatus: null == deliveryStatus
          ? _value.deliveryStatus
          : deliveryStatus // ignore: cast_nullable_to_non_nullable
              as DeliveryStatus,
      deliveryId: freezed == deliveryId
          ? _value.deliveryId
          : deliveryId // ignore: cast_nullable_to_non_nullable
              as String?,
      employeeCancelNote: freezed == employeeCancelNote
          ? _value.employeeCancelNote
          : employeeCancelNote // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_UpdateDeliveryStatus implements _UpdateDeliveryStatus {
  const _$_UpdateDeliveryStatus(
      {required this.orderId,
      required this.deliveryStatus,
      this.deliveryId,
      this.employeeCancelNote});

  @override
  final String orderId;
  @override
  final DeliveryStatus deliveryStatus;
  @override
  final String? deliveryId;
  @override
  final String? employeeCancelNote;

  @override
  String toString() {
    return 'UpdateDeliveryStatus(orderId: $orderId, deliveryStatus: $deliveryStatus, deliveryId: $deliveryId, employeeCancelNote: $employeeCancelNote)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateDeliveryStatus &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.deliveryStatus, deliveryStatus) ||
                other.deliveryStatus == deliveryStatus) &&
            (identical(other.deliveryId, deliveryId) ||
                other.deliveryId == deliveryId) &&
            (identical(other.employeeCancelNote, employeeCancelNote) ||
                other.employeeCancelNote == employeeCancelNote));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, orderId, deliveryStatus, deliveryId, employeeCancelNote);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateDeliveryStatusCopyWith<_$_UpdateDeliveryStatus> get copyWith =>
      __$$_UpdateDeliveryStatusCopyWithImpl<_$_UpdateDeliveryStatus>(
          this, _$identity);
}

abstract class _UpdateDeliveryStatus implements UpdateDeliveryStatus {
  const factory _UpdateDeliveryStatus(
      {required final String orderId,
      required final DeliveryStatus deliveryStatus,
      final String? deliveryId,
      final String? employeeCancelNote}) = _$_UpdateDeliveryStatus;

  @override
  String get orderId;
  @override
  DeliveryStatus get deliveryStatus;
  @override
  String? get deliveryId;
  @override
  String? get employeeCancelNote;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateDeliveryStatusCopyWith<_$_UpdateDeliveryStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

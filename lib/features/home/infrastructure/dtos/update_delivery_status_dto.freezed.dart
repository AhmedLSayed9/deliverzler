// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'update_delivery_status_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UpdateDeliveryStatusDto {
  @JsonKey(includeToJson: false)
  String get orderId => throw _privateConstructorUsedError;
  DeliveryStatus get deliveryStatus => throw _privateConstructorUsedError;
  @JsonKey(disallowNullValue: true)
  String? get deliveryId => throw _privateConstructorUsedError;
  @JsonKey(disallowNullValue: true)
  String? get employeeCancelNote => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateDeliveryStatusDtoCopyWith<UpdateDeliveryStatusDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateDeliveryStatusDtoCopyWith<$Res> {
  factory $UpdateDeliveryStatusDtoCopyWith(UpdateDeliveryStatusDto value,
          $Res Function(UpdateDeliveryStatusDto) then) =
      _$UpdateDeliveryStatusDtoCopyWithImpl<$Res, UpdateDeliveryStatusDto>;
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String orderId,
      DeliveryStatus deliveryStatus,
      @JsonKey(disallowNullValue: true) String? deliveryId,
      @JsonKey(disallowNullValue: true) String? employeeCancelNote});
}

/// @nodoc
class _$UpdateDeliveryStatusDtoCopyWithImpl<$Res,
        $Val extends UpdateDeliveryStatusDto>
    implements $UpdateDeliveryStatusDtoCopyWith<$Res> {
  _$UpdateDeliveryStatusDtoCopyWithImpl(this._value, this._then);

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
abstract class _$$_UpdateDeliveryStatusDtoCopyWith<$Res>
    implements $UpdateDeliveryStatusDtoCopyWith<$Res> {
  factory _$$_UpdateDeliveryStatusDtoCopyWith(_$_UpdateDeliveryStatusDto value,
          $Res Function(_$_UpdateDeliveryStatusDto) then) =
      __$$_UpdateDeliveryStatusDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeToJson: false) String orderId,
      DeliveryStatus deliveryStatus,
      @JsonKey(disallowNullValue: true) String? deliveryId,
      @JsonKey(disallowNullValue: true) String? employeeCancelNote});
}

/// @nodoc
class __$$_UpdateDeliveryStatusDtoCopyWithImpl<$Res>
    extends _$UpdateDeliveryStatusDtoCopyWithImpl<$Res,
        _$_UpdateDeliveryStatusDto>
    implements _$$_UpdateDeliveryStatusDtoCopyWith<$Res> {
  __$$_UpdateDeliveryStatusDtoCopyWithImpl(_$_UpdateDeliveryStatusDto _value,
      $Res Function(_$_UpdateDeliveryStatusDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? orderId = null,
    Object? deliveryStatus = null,
    Object? deliveryId = freezed,
    Object? employeeCancelNote = freezed,
  }) {
    return _then(_$_UpdateDeliveryStatusDto(
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
@JsonSerializable(createFactory: false)
class _$_UpdateDeliveryStatusDto implements _UpdateDeliveryStatusDto {
  const _$_UpdateDeliveryStatusDto(
      {@JsonKey(includeToJson: false) required this.orderId,
      required this.deliveryStatus,
      @JsonKey(disallowNullValue: true) this.deliveryId,
      @JsonKey(disallowNullValue: true) this.employeeCancelNote});

  @override
  @JsonKey(includeToJson: false)
  final String orderId;
  @override
  final DeliveryStatus deliveryStatus;
  @override
  @JsonKey(disallowNullValue: true)
  final String? deliveryId;
  @override
  @JsonKey(disallowNullValue: true)
  final String? employeeCancelNote;

  @override
  String toString() {
    return 'UpdateDeliveryStatusDto(orderId: $orderId, deliveryStatus: $deliveryStatus, deliveryId: $deliveryId, employeeCancelNote: $employeeCancelNote)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateDeliveryStatusDto &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.deliveryStatus, deliveryStatus) ||
                other.deliveryStatus == deliveryStatus) &&
            (identical(other.deliveryId, deliveryId) ||
                other.deliveryId == deliveryId) &&
            (identical(other.employeeCancelNote, employeeCancelNote) ||
                other.employeeCancelNote == employeeCancelNote));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, orderId, deliveryStatus, deliveryId, employeeCancelNote);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateDeliveryStatusDtoCopyWith<_$_UpdateDeliveryStatusDto>
      get copyWith =>
          __$$_UpdateDeliveryStatusDtoCopyWithImpl<_$_UpdateDeliveryStatusDto>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UpdateDeliveryStatusDtoToJson(
      this,
    );
  }
}

abstract class _UpdateDeliveryStatusDto implements UpdateDeliveryStatusDto {
  const factory _UpdateDeliveryStatusDto(
          {@JsonKey(includeToJson: false) required final String orderId,
          required final DeliveryStatus deliveryStatus,
          @JsonKey(disallowNullValue: true) final String? deliveryId,
          @JsonKey(disallowNullValue: true) final String? employeeCancelNote}) =
      _$_UpdateDeliveryStatusDto;

  @override
  @JsonKey(includeToJson: false)
  String get orderId;
  @override
  DeliveryStatus get deliveryStatus;
  @override
  @JsonKey(disallowNullValue: true)
  String? get deliveryId;
  @override
  @JsonKey(disallowNullValue: true)
  String? get employeeCancelNote;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateDeliveryStatusDtoCopyWith<_$_UpdateDeliveryStatusDto>
      get copyWith => throw _privateConstructorUsedError;
}

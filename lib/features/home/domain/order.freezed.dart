// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppOrder {
  String get id => throw _privateConstructorUsedError;
  int get date => throw _privateConstructorUsedError;
  PickupOption get pickupOption => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  Address? get address => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userImage => throw _privateConstructorUsedError;
  String get userPhone => throw _privateConstructorUsedError;
  String get userNote => throw _privateConstructorUsedError;
  String? get employeeCancelNote => throw _privateConstructorUsedError;
  DeliveryStatus get deliveryStatus => throw _privateConstructorUsedError;
  String? get deliveryId => throw _privateConstructorUsedError;
  GeoPoint? get deliveryGeoPoint => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppOrderCopyWith<AppOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppOrderCopyWith<$Res> {
  factory $AppOrderCopyWith(AppOrder value, $Res Function(AppOrder) then) =
      _$AppOrderCopyWithImpl<$Res, AppOrder>;
  @useResult
  $Res call(
      {String id,
      int date,
      PickupOption pickupOption,
      String paymentMethod,
      Address? address,
      String userId,
      String userName,
      String userImage,
      String userPhone,
      String userNote,
      String? employeeCancelNote,
      DeliveryStatus deliveryStatus,
      String? deliveryId,
      GeoPoint? deliveryGeoPoint});

  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class _$AppOrderCopyWithImpl<$Res, $Val extends AppOrder>
    implements $AppOrderCopyWith<$Res> {
  _$AppOrderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? pickupOption = null,
    Object? paymentMethod = null,
    Object? address = freezed,
    Object? userId = null,
    Object? userName = null,
    Object? userImage = null,
    Object? userPhone = null,
    Object? userNote = null,
    Object? employeeCancelNote = freezed,
    Object? deliveryStatus = null,
    Object? deliveryId = freezed,
    Object? deliveryGeoPoint = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      pickupOption: null == pickupOption
          ? _value.pickupOption
          : pickupOption // ignore: cast_nullable_to_non_nullable
              as PickupOption,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userImage: null == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String,
      userPhone: null == userPhone
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String,
      userNote: null == userNote
          ? _value.userNote
          : userNote // ignore: cast_nullable_to_non_nullable
              as String,
      employeeCancelNote: freezed == employeeCancelNote
          ? _value.employeeCancelNote
          : employeeCancelNote // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryStatus: null == deliveryStatus
          ? _value.deliveryStatus
          : deliveryStatus // ignore: cast_nullable_to_non_nullable
              as DeliveryStatus,
      deliveryId: freezed == deliveryId
          ? _value.deliveryId
          : deliveryId // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryGeoPoint: freezed == deliveryGeoPoint
          ? _value.deliveryGeoPoint
          : deliveryGeoPoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_AppOrderCopyWith<$Res> implements $AppOrderCopyWith<$Res> {
  factory _$$_AppOrderCopyWith(
          _$_AppOrder value, $Res Function(_$_AppOrder) then) =
      __$$_AppOrderCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      int date,
      PickupOption pickupOption,
      String paymentMethod,
      Address? address,
      String userId,
      String userName,
      String userImage,
      String userPhone,
      String userNote,
      String? employeeCancelNote,
      DeliveryStatus deliveryStatus,
      String? deliveryId,
      GeoPoint? deliveryGeoPoint});

  @override
  $AddressCopyWith<$Res>? get address;
}

/// @nodoc
class __$$_AppOrderCopyWithImpl<$Res>
    extends _$AppOrderCopyWithImpl<$Res, _$_AppOrder>
    implements _$$_AppOrderCopyWith<$Res> {
  __$$_AppOrderCopyWithImpl(
      _$_AppOrder _value, $Res Function(_$_AppOrder) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? pickupOption = null,
    Object? paymentMethod = null,
    Object? address = freezed,
    Object? userId = null,
    Object? userName = null,
    Object? userImage = null,
    Object? userPhone = null,
    Object? userNote = null,
    Object? employeeCancelNote = freezed,
    Object? deliveryStatus = null,
    Object? deliveryId = freezed,
    Object? deliveryGeoPoint = freezed,
  }) {
    return _then(_$_AppOrder(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as int,
      pickupOption: null == pickupOption
          ? _value.pickupOption
          : pickupOption // ignore: cast_nullable_to_non_nullable
              as PickupOption,
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String,
      address: freezed == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      userImage: null == userImage
          ? _value.userImage
          : userImage // ignore: cast_nullable_to_non_nullable
              as String,
      userPhone: null == userPhone
          ? _value.userPhone
          : userPhone // ignore: cast_nullable_to_non_nullable
              as String,
      userNote: null == userNote
          ? _value.userNote
          : userNote // ignore: cast_nullable_to_non_nullable
              as String,
      employeeCancelNote: freezed == employeeCancelNote
          ? _value.employeeCancelNote
          : employeeCancelNote // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryStatus: null == deliveryStatus
          ? _value.deliveryStatus
          : deliveryStatus // ignore: cast_nullable_to_non_nullable
              as DeliveryStatus,
      deliveryId: freezed == deliveryId
          ? _value.deliveryId
          : deliveryId // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryGeoPoint: freezed == deliveryGeoPoint
          ? _value.deliveryGeoPoint
          : deliveryGeoPoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
    ));
  }
}

/// @nodoc

class _$_AppOrder extends _AppOrder {
  const _$_AppOrder(
      {required this.id,
      required this.date,
      required this.pickupOption,
      required this.paymentMethod,
      required this.address,
      required this.userId,
      required this.userName,
      required this.userImage,
      required this.userPhone,
      required this.userNote,
      required this.employeeCancelNote,
      required this.deliveryStatus,
      required this.deliveryId,
      required this.deliveryGeoPoint})
      : super._();

  @override
  final String id;
  @override
  final int date;
  @override
  final PickupOption pickupOption;
  @override
  final String paymentMethod;
  @override
  final Address? address;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String userImage;
  @override
  final String userPhone;
  @override
  final String userNote;
  @override
  final String? employeeCancelNote;
  @override
  final DeliveryStatus deliveryStatus;
  @override
  final String? deliveryId;
  @override
  final GeoPoint? deliveryGeoPoint;

  @override
  String toString() {
    return 'AppOrder(id: $id, date: $date, pickupOption: $pickupOption, paymentMethod: $paymentMethod, address: $address, userId: $userId, userName: $userName, userImage: $userImage, userPhone: $userPhone, userNote: $userNote, employeeCancelNote: $employeeCancelNote, deliveryStatus: $deliveryStatus, deliveryId: $deliveryId, deliveryGeoPoint: $deliveryGeoPoint)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppOrderCopyWith<_$_AppOrder> get copyWith =>
      __$$_AppOrderCopyWithImpl<_$_AppOrder>(this, _$identity);
}

abstract class _AppOrder extends AppOrder {
  const factory _AppOrder(
      {required final String id,
      required final int date,
      required final PickupOption pickupOption,
      required final String paymentMethod,
      required final Address? address,
      required final String userId,
      required final String userName,
      required final String userImage,
      required final String userPhone,
      required final String userNote,
      required final String? employeeCancelNote,
      required final DeliveryStatus deliveryStatus,
      required final String? deliveryId,
      required final GeoPoint? deliveryGeoPoint}) = _$_AppOrder;
  const _AppOrder._() : super._();

  @override
  String get id;
  @override
  int get date;
  @override
  PickupOption get pickupOption;
  @override
  String get paymentMethod;
  @override
  Address? get address;
  @override
  String get userId;
  @override
  String get userName;
  @override
  String get userImage;
  @override
  String get userPhone;
  @override
  String get userNote;
  @override
  String? get employeeCancelNote;
  @override
  DeliveryStatus get deliveryStatus;
  @override
  String? get deliveryId;
  @override
  GeoPoint? get deliveryGeoPoint;
  @override
  @JsonKey(ignore: true)
  _$$_AppOrderCopyWith<_$_AppOrder> get copyWith =>
      throw _privateConstructorUsedError;
}

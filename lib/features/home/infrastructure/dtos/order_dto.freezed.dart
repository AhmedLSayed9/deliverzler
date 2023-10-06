// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) {
  return _OrderDto.fromJson(json);
}

/// @nodoc
mixin _$OrderDto {
  int get date => throw _privateConstructorUsedError;
  PickupOption get pickupOption => throw _privateConstructorUsedError;
  String get paymentMethod => throw _privateConstructorUsedError;
  @JsonKey(name: 'addressModel')
  AddressDto? get address => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get userImage => throw _privateConstructorUsedError;
  String get userPhone => throw _privateConstructorUsedError;
  String get userNote => throw _privateConstructorUsedError;
  String? get employeeCancelNote => throw _privateConstructorUsedError;
  DeliveryStatus get deliveryStatus => throw _privateConstructorUsedError;
  String? get deliveryId => throw _privateConstructorUsedError;
  @GeoPointConverter()
  GeoPoint? get deliveryGeoPoint => throw _privateConstructorUsedError;
  @JsonKey(includeToJson: false)
  String? get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderDtoCopyWith<OrderDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDtoCopyWith<$Res> {
  factory $OrderDtoCopyWith(OrderDto value, $Res Function(OrderDto) then) =
      _$OrderDtoCopyWithImpl<$Res, OrderDto>;
  @useResult
  $Res call(
      {int date,
      PickupOption pickupOption,
      String paymentMethod,
      @JsonKey(name: 'addressModel') AddressDto? address,
      String userId,
      String userName,
      String userImage,
      String userPhone,
      String userNote,
      String? employeeCancelNote,
      DeliveryStatus deliveryStatus,
      String? deliveryId,
      @GeoPointConverter() GeoPoint? deliveryGeoPoint,
      @JsonKey(includeToJson: false) String? id});

  $AddressDtoCopyWith<$Res>? get address;
}

/// @nodoc
class _$OrderDtoCopyWithImpl<$Res, $Val extends OrderDto> implements $OrderDtoCopyWith<$Res> {
  _$OrderDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
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
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
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
              as AddressDto?,
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $AddressDtoCopyWith<$Res>? get address {
    if (_value.address == null) {
      return null;
    }

    return $AddressDtoCopyWith<$Res>(_value.address!, (value) {
      return _then(_value.copyWith(address: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OrderDtoCopyWith<$Res> implements $OrderDtoCopyWith<$Res> {
  factory _$$_OrderDtoCopyWith(_$_OrderDto value, $Res Function(_$_OrderDto) then) =
      __$$_OrderDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int date,
      PickupOption pickupOption,
      String paymentMethod,
      @JsonKey(name: 'addressModel') AddressDto? address,
      String userId,
      String userName,
      String userImage,
      String userPhone,
      String userNote,
      String? employeeCancelNote,
      DeliveryStatus deliveryStatus,
      String? deliveryId,
      @GeoPointConverter() GeoPoint? deliveryGeoPoint,
      @JsonKey(includeToJson: false) String? id});

  @override
  $AddressDtoCopyWith<$Res>? get address;
}

/// @nodoc
class __$$_OrderDtoCopyWithImpl<$Res> extends _$OrderDtoCopyWithImpl<$Res, _$_OrderDto>
    implements _$$_OrderDtoCopyWith<$Res> {
  __$$_OrderDtoCopyWithImpl(_$_OrderDto _value, $Res Function(_$_OrderDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
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
    Object? id = freezed,
  }) {
    return _then(_$_OrderDto(
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
              as AddressDto?,
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
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_OrderDto extends _OrderDto {
  const _$_OrderDto(
      {required this.date,
      required this.pickupOption,
      required this.paymentMethod,
      @JsonKey(name: 'addressModel') required this.address,
      required this.userId,
      required this.userName,
      required this.userImage,
      required this.userPhone,
      required this.userNote,
      required this.employeeCancelNote,
      required this.deliveryStatus,
      required this.deliveryId,
      @GeoPointConverter() required this.deliveryGeoPoint,
      @JsonKey(includeToJson: false) this.id})
      : super._();

  factory _$_OrderDto.fromJson(Map<String, dynamic> json) => _$$_OrderDtoFromJson(json);

  @override
  final int date;
  @override
  final PickupOption pickupOption;
  @override
  final String paymentMethod;
  @override
  @JsonKey(name: 'addressModel')
  final AddressDto? address;
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
  @GeoPointConverter()
  final GeoPoint? deliveryGeoPoint;
  @override
  @JsonKey(includeToJson: false)
  final String? id;

  @override
  String toString() {
    return 'OrderDto(date: $date, pickupOption: $pickupOption, paymentMethod: $paymentMethod, address: $address, userId: $userId, userName: $userName, userImage: $userImage, userPhone: $userPhone, userNote: $userNote, employeeCancelNote: $employeeCancelNote, deliveryStatus: $deliveryStatus, deliveryId: $deliveryId, deliveryGeoPoint: $deliveryGeoPoint, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OrderDto &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.pickupOption, pickupOption) || other.pickupOption == pickupOption) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) || other.userName == userName) &&
            (identical(other.userImage, userImage) || other.userImage == userImage) &&
            (identical(other.userPhone, userPhone) || other.userPhone == userPhone) &&
            (identical(other.userNote, userNote) || other.userNote == userNote) &&
            (identical(other.employeeCancelNote, employeeCancelNote) ||
                other.employeeCancelNote == employeeCancelNote) &&
            (identical(other.deliveryStatus, deliveryStatus) ||
                other.deliveryStatus == deliveryStatus) &&
            (identical(other.deliveryId, deliveryId) || other.deliveryId == deliveryId) &&
            (identical(other.deliveryGeoPoint, deliveryGeoPoint) ||
                other.deliveryGeoPoint == deliveryGeoPoint) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      date,
      pickupOption,
      paymentMethod,
      address,
      userId,
      userName,
      userImage,
      userPhone,
      userNote,
      employeeCancelNote,
      deliveryStatus,
      deliveryId,
      deliveryGeoPoint,
      id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OrderDtoCopyWith<_$_OrderDto> get copyWith =>
      __$$_OrderDtoCopyWithImpl<_$_OrderDto>(this, _$identity);
}

abstract class _OrderDto extends OrderDto {
  const factory _OrderDto(
      {required final int date,
      required final PickupOption pickupOption,
      required final String paymentMethod,
      @JsonKey(name: 'addressModel') required final AddressDto? address,
      required final String userId,
      required final String userName,
      required final String userImage,
      required final String userPhone,
      required final String userNote,
      required final String? employeeCancelNote,
      required final DeliveryStatus deliveryStatus,
      required final String? deliveryId,
      @GeoPointConverter() required final GeoPoint? deliveryGeoPoint,
      @JsonKey(includeToJson: false) final String? id}) = _$_OrderDto;
  const _OrderDto._() : super._();

  factory _OrderDto.fromJson(Map<String, dynamic> json) = _$_OrderDto.fromJson;

  @override
  int get date;
  @override
  PickupOption get pickupOption;
  @override
  String get paymentMethod;
  @override
  @JsonKey(name: 'addressModel')
  AddressDto? get address;
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
  @GeoPointConverter()
  GeoPoint? get deliveryGeoPoint;
  @override
  @JsonKey(includeToJson: false)
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_OrderDtoCopyWith<_$_OrderDto> get copyWith => throw _privateConstructorUsedError;
}

AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) {
  return _AddressDto.fromJson(json);
}

/// @nodoc
mixin _$AddressDto {
  String get state => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get street => throw _privateConstructorUsedError;
  String get mobile => throw _privateConstructorUsedError;
  @GeoPointConverter()
  GeoPoint? get geoPoint => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddressDtoCopyWith<AddressDto> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddressDtoCopyWith<$Res> {
  factory $AddressDtoCopyWith(AddressDto value, $Res Function(AddressDto) then) =
      _$AddressDtoCopyWithImpl<$Res, AddressDto>;
  @useResult
  $Res call(
      {String state,
      String city,
      String street,
      String mobile,
      @GeoPointConverter() GeoPoint? geoPoint});
}

/// @nodoc
class _$AddressDtoCopyWithImpl<$Res, $Val extends AddressDto> implements $AddressDtoCopyWith<$Res> {
  _$AddressDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? city = null,
    Object? street = null,
    Object? mobile = null,
    Object? geoPoint = freezed,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      geoPoint: freezed == geoPoint
          ? _value.geoPoint
          : geoPoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddressDtoCopyWith<$Res> implements $AddressDtoCopyWith<$Res> {
  factory _$$_AddressDtoCopyWith(_$_AddressDto value, $Res Function(_$_AddressDto) then) =
      __$$_AddressDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String state,
      String city,
      String street,
      String mobile,
      @GeoPointConverter() GeoPoint? geoPoint});
}

/// @nodoc
class __$$_AddressDtoCopyWithImpl<$Res> extends _$AddressDtoCopyWithImpl<$Res, _$_AddressDto>
    implements _$$_AddressDtoCopyWith<$Res> {
  __$$_AddressDtoCopyWithImpl(_$_AddressDto _value, $Res Function(_$_AddressDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? city = null,
    Object? street = null,
    Object? mobile = null,
    Object? geoPoint = freezed,
  }) {
    return _then(_$_AddressDto(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      mobile: null == mobile
          ? _value.mobile
          : mobile // ignore: cast_nullable_to_non_nullable
              as String,
      geoPoint: freezed == geoPoint
          ? _value.geoPoint
          : geoPoint // ignore: cast_nullable_to_non_nullable
              as GeoPoint?,
    ));
  }
}

/// @nodoc
@JsonSerializable(createToJson: false)
class _$_AddressDto extends _AddressDto {
  const _$_AddressDto(
      {required this.state,
      required this.city,
      required this.street,
      required this.mobile,
      @GeoPointConverter() required this.geoPoint})
      : super._();

  factory _$_AddressDto.fromJson(Map<String, dynamic> json) => _$$_AddressDtoFromJson(json);

  @override
  final String state;
  @override
  final String city;
  @override
  final String street;
  @override
  final String mobile;
  @override
  @GeoPointConverter()
  final GeoPoint? geoPoint;

  @override
  String toString() {
    return 'AddressDto(state: $state, city: $city, street: $street, mobile: $mobile, geoPoint: $geoPoint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddressDto &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.mobile, mobile) || other.mobile == mobile) &&
            (identical(other.geoPoint, geoPoint) || other.geoPoint == geoPoint));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, state, city, street, mobile, geoPoint);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddressDtoCopyWith<_$_AddressDto> get copyWith =>
      __$$_AddressDtoCopyWithImpl<_$_AddressDto>(this, _$identity);
}

abstract class _AddressDto extends AddressDto {
  const factory _AddressDto(
      {required final String state,
      required final String city,
      required final String street,
      required final String mobile,
      @GeoPointConverter() required final GeoPoint? geoPoint}) = _$_AddressDto;
  const _AddressDto._() : super._();

  factory _AddressDto.fromJson(Map<String, dynamic> json) = _$_AddressDto.fromJson;

  @override
  String get state;
  @override
  String get city;
  @override
  String get street;
  @override
  String get mobile;
  @override
  @GeoPointConverter()
  GeoPoint? get geoPoint;
  @override
  @JsonKey(ignore: true)
  _$$_AddressDtoCopyWith<_$_AddressDto> get copyWith => throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_details_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileDetailsDto {
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileDetailsDtoCopyWith<ProfileDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDetailsDtoCopyWith<$Res> {
  factory $ProfileDetailsDtoCopyWith(
          ProfileDetailsDto value, $Res Function(ProfileDetailsDto) then) =
      _$ProfileDetailsDtoCopyWithImpl<$Res, ProfileDetailsDto>;
  @useResult
  $Res call({String name, String phone});
}

/// @nodoc
class _$ProfileDetailsDtoCopyWithImpl<$Res, $Val extends ProfileDetailsDto>
    implements $ProfileDetailsDtoCopyWith<$Res> {
  _$ProfileDetailsDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ProfileDetailsDtoCopyWith<$Res>
    implements $ProfileDetailsDtoCopyWith<$Res> {
  factory _$$_ProfileDetailsDtoCopyWith(_$_ProfileDetailsDto value,
          $Res Function(_$_ProfileDetailsDto) then) =
      __$$_ProfileDetailsDtoCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String phone});
}

/// @nodoc
class __$$_ProfileDetailsDtoCopyWithImpl<$Res>
    extends _$ProfileDetailsDtoCopyWithImpl<$Res, _$_ProfileDetailsDto>
    implements _$$_ProfileDetailsDtoCopyWith<$Res> {
  __$$_ProfileDetailsDtoCopyWithImpl(
      _$_ProfileDetailsDto _value, $Res Function(_$_ProfileDetailsDto) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
  }) {
    return _then(_$_ProfileDetailsDto(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      phone: null == phone
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable(createFactory: false)
class _$_ProfileDetailsDto implements _ProfileDetailsDto {
  const _$_ProfileDetailsDto({required this.name, required this.phone});

  @override
  final String name;
  @override
  final String phone;

  @override
  String toString() {
    return 'ProfileDetailsDto(name: $name, phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ProfileDetailsDto &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ProfileDetailsDtoCopyWith<_$_ProfileDetailsDto> get copyWith =>
      __$$_ProfileDetailsDtoCopyWithImpl<_$_ProfileDetailsDto>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ProfileDetailsDtoToJson(
      this,
    );
  }
}

abstract class _ProfileDetailsDto implements ProfileDetailsDto {
  const factory _ProfileDetailsDto(
      {required final String name,
      required final String phone}) = _$_ProfileDetailsDto;

  @override
  String get name;
  @override
  String get phone;
  @override
  @JsonKey(ignore: true)
  _$$_ProfileDetailsDtoCopyWith<_$_ProfileDetailsDto> get copyWith =>
      throw _privateConstructorUsedError;
}

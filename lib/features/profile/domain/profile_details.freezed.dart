// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProfileDetails {
  String get name => throw _privateConstructorUsedError;
  String get phone => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProfileDetailsCopyWith<ProfileDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDetailsCopyWith<$Res> {
  factory $ProfileDetailsCopyWith(
          ProfileDetails value, $Res Function(ProfileDetails) then) =
      _$ProfileDetailsCopyWithImpl<$Res, ProfileDetails>;
  @useResult
  $Res call({String name, String phone});
}

/// @nodoc
class _$ProfileDetailsCopyWithImpl<$Res, $Val extends ProfileDetails>
    implements $ProfileDetailsCopyWith<$Res> {
  _$ProfileDetailsCopyWithImpl(this._value, this._then);

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
abstract class _$$_UpdateProfileParamsCopyWith<$Res>
    implements $ProfileDetailsCopyWith<$Res> {
  factory _$$_UpdateProfileParamsCopyWith(_$_UpdateProfileParams value,
          $Res Function(_$_UpdateProfileParams) then) =
      __$$_UpdateProfileParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String phone});
}

/// @nodoc
class __$$_UpdateProfileParamsCopyWithImpl<$Res>
    extends _$ProfileDetailsCopyWithImpl<$Res, _$_UpdateProfileParams>
    implements _$$_UpdateProfileParamsCopyWith<$Res> {
  __$$_UpdateProfileParamsCopyWithImpl(_$_UpdateProfileParams _value,
      $Res Function(_$_UpdateProfileParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? phone = null,
  }) {
    return _then(_$_UpdateProfileParams(
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

class _$_UpdateProfileParams implements _UpdateProfileParams {
  const _$_UpdateProfileParams({required this.name, required this.phone});

  @override
  final String name;
  @override
  final String phone;

  @override
  String toString() {
    return 'ProfileDetails(name: $name, phone: $phone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UpdateProfileParams &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.phone, phone) || other.phone == phone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, phone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UpdateProfileParamsCopyWith<_$_UpdateProfileParams> get copyWith =>
      __$$_UpdateProfileParamsCopyWithImpl<_$_UpdateProfileParams>(
          this, _$identity);
}

abstract class _UpdateProfileParams implements ProfileDetails {
  const factory _UpdateProfileParams(
      {required final String name,
      required final String phone}) = _$_UpdateProfileParams;

  @override
  String get name;
  @override
  String get phone;
  @override
  @JsonKey(ignore: true)
  _$$_UpdateProfileParamsCopyWith<_$_UpdateProfileParams> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_with_email.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInWithEmail {
// Note: You should consider using separate value object (with its validator method)
// for these values if they're used in other entities.
  String get email => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignInWithEmailCopyWith<SignInWithEmail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInWithEmailCopyWith<$Res> {
  factory $SignInWithEmailCopyWith(
          SignInWithEmail value, $Res Function(SignInWithEmail) then) =
      _$SignInWithEmailCopyWithImpl<$Res, SignInWithEmail>;
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class _$SignInWithEmailCopyWithImpl<$Res, $Val extends SignInWithEmail>
    implements $SignInWithEmailCopyWith<$Res> {
  _$SignInWithEmailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignInWithEmailCopyWith<$Res>
    implements $SignInWithEmailCopyWith<$Res> {
  factory _$$_SignInWithEmailCopyWith(
          _$_SignInWithEmail value, $Res Function(_$_SignInWithEmail) then) =
      __$$_SignInWithEmailCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String email, String password});
}

/// @nodoc
class __$$_SignInWithEmailCopyWithImpl<$Res>
    extends _$SignInWithEmailCopyWithImpl<$Res, _$_SignInWithEmail>
    implements _$$_SignInWithEmailCopyWith<$Res> {
  __$$_SignInWithEmailCopyWithImpl(
      _$_SignInWithEmail _value, $Res Function(_$_SignInWithEmail) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$_SignInWithEmail(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignInWithEmail implements _SignInWithEmail {
  const _$_SignInWithEmail({required this.email, required this.password});

// Note: You should consider using separate value object (with its validator method)
// for these values if they're used in other entities.
  @override
  final String email;
  @override
  final String password;

  @override
  String toString() {
    return 'SignInWithEmail(email: $email, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInWithEmail &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInWithEmailCopyWith<_$_SignInWithEmail> get copyWith =>
      __$$_SignInWithEmailCopyWithImpl<_$_SignInWithEmail>(this, _$identity);
}

abstract class _SignInWithEmail implements SignInWithEmail {
  const factory _SignInWithEmail(
      {required final String email,
      required final String password}) = _$_SignInWithEmail;

  @override // Note: You should consider using separate value object (with its validator method)
// for these values if they're used in other entities.
  String get email;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_SignInWithEmailCopyWith<_$_SignInWithEmail> get copyWith =>
      throw _privateConstructorUsedError;
}

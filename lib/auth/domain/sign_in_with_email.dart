import 'package:flutter/cupertino.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/domain/value_validators.dart';

part 'sign_in_with_email.freezed.dart';

@freezed
class SignInWithEmail with _$SignInWithEmail {
  const factory SignInWithEmail({
    required String email,
    required String password,
  }) = _SignInWithEmail;

  static FormFieldValidator<String?> validateEmail(BuildContext context) =>
      ValueValidators.validateEmail(context);

  static FormFieldValidator<String?> validatePassword(BuildContext context) =>
      ValueValidators.validateLoginPassword(context);
}

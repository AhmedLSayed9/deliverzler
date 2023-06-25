import 'package:flutter/cupertino.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/value_validators.dart';

part 'profile_details.freezed.dart';

@freezed
class ProfileDetails with _$ProfileDetails {
  const factory ProfileDetails({
    required String name,
    required String phone,
  }) = _UpdateProfileParams;

  static FormFieldValidator<String?> validateName(BuildContext context) =>
      ValueValidators.validateName(context);

  static FormFieldValidator<String?> validateMobile(BuildContext context) =>
      ValueValidators.validateMobileNumber(context);
}

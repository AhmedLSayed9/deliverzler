import 'package:freezed_annotation/freezed_annotation.dart';

import '../../features/profile/domain/profile_details.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    required String email,
    required String? name,
    required String? phone,
    required String? image,
  }) = _User;
  const User._();

  User copyWithProfileDetails(ProfileDetails profileDetails) {
    return copyWith(
      name: profileDetails.name,
      phone: profileDetails.phone,
    );
  }

  static const spareUserImage =
      'https://firebasestorage.googleapis.com/v0/b/deliverzler.appspot.com/o/profile_pic4.png?alt=media&token=60fc5dbb-93ab-4f2b-89fe-d378f3a0ae6f';
}

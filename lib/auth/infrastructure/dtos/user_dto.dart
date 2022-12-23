import 'package:firebase_auth/firebase_auth.dart' as f_auth;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/user.dart';

part 'user_dto.freezed.dart';

part 'user_dto.g.dart';

//TODO: extend User entity when extending another Freezed class is supported:
//https://github.com/rrousselGit/freezed/issues/907
@freezed
class UserDto with _$UserDto {
  const UserDto._();

  const factory UserDto({
    required String id,
    required String email,
    required String? name,
    required String? phone,
    required String? image,
  }) = _UserDto;

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  factory UserDto.fromUserCredential(f_auth.User user) {
    return UserDto(
      id: user.uid,
      email: user.email ?? '',
      name: user.displayName?.split(' ').first ?? '',
      phone: user.phoneNumber ?? '',
      image: user.photoURL ?? '',
    );
  }

  factory UserDto.fromDomain(User user) {
    return UserDto(
      id: user.id,
      email: user.email,
      name: user.name,
      phone: user.phone,
      image: user.image,
    );
  }

  User toDomain() {
    return User(
      id: id,
      email: email,
      name: name,
      phone: phone,
      image: image,
    );
  }
}

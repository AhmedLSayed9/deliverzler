import 'package:firebase_auth/firebase_auth.dart' as f_auth;
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/user.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const UserModel._();

  const factory UserModel({
    required String id,
    required String email,
    required String? name,
    required String? phone,
    required String? image,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromUserCredential(f_auth.User user) {
    return UserModel(
      id: user.uid,
      email: user.email ?? '',
      name: user.displayName?.split(' ').first ?? '',
      phone: user.phoneNumber ?? '',
      image: user.photoURL ?? '',
    );
  }

  factory UserModel.fromEntity(User user) {
    return UserModel(
      id: user.id,
      email: user.email,
      name: user.name,
      phone: user.phone,
      image: user.image,
    );
  }

  User toEntity() {
    return User(
      id: id,
      email: email,
      name: name,
      phone: phone,
      image: image,
    );
  }
}

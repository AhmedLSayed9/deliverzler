import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uId;
  final String email;
  final String? name;
  final String? phone;
  final String? image;

  UserModel({
    required this.uId,
    required this.email,
    required this.name,
    required this.phone,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'email': email,
      'name': name ?? '',
      'phone': phone ?? '',
      'image': image ?? '',
    }..removeWhere((key, value) => value == null);
  }

  factory UserModel.fromMap(Map<String, dynamic> map, String documentId) {
    return UserModel(
      uId: documentId,
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      phone: map['phone'] ?? '',
      image: map['image'] ?? '',
    );
  }

  /// Google Factory
  factory UserModel.fromUserCredential(User user) {
    return UserModel(
      uId: user.uid,
      email: user.email ?? '',
      name: user.displayName?.split(' ').first ?? '',
      phone: user.phoneNumber ?? '',
      image: user.photoURL ?? '',
    );
  }

  UserModel copyWith({
    String? uId,
    String? name,
    String? email,
    String? image,
    String? phone,
  }) {
    return UserModel(
      uId: uId ?? this.uId,
      name: name ?? this.name,
      email: email ?? this.email,
      image: image ?? this.image,
      phone: phone ?? this.phone,
    );
  }
}

import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String? name;
  final String? phone;
  final String? image;

  const User({
    required this.id,
    required this.email,
    required this.name,
    required this.phone,
    required this.image,
  });

  @override
  List<Object?> get props => [
        id,
        email,
        name,
        phone,
        image,
      ];

  User copyWith({
    String? id,
    String? email,
    String? name,
    String? phone,
    String? image,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      image: image ?? this.image,
    );
  }
}

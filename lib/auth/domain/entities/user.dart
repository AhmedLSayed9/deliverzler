import 'package:freezed_annotation/freezed_annotation.dart';

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
}

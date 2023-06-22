import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:deliverzler/auth/infrastructure/dtos/user_dto.dart';
import '../../../fixtures/fixture_reader.dart';

void main() {
  final jsonMap = json.decode(fixtureReader('auth/user.json')) as Map<String, dynamic>;

  final tUserDto = UserDto(
    id: jsonMap['id'] as String,
    email: jsonMap['email'] as String,
    name: jsonMap['name'] as String?,
    phone: jsonMap['phone'] as String?,
    image: jsonMap['image'] as String?,
  );

  group(
    'toMap',
    () {
      test(
        'should return a JSON map containing the proper data',
        () async {
          // WHEN
          final result = tUserDto.toJson();

          // THEN
          final expectedMap = jsonMap;
          expect(result, expectedMap);
        },
      );
    },
  );

  group(
    'fromMap',
    () {
      test(
        'should return a valid DTO',
        () async {
          // WHEN
          final result = UserDto.fromJson(jsonMap);

          // THEN
          expect(result, tUserDto);
        },
      );
    },
  );
}

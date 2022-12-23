import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import 'package:deliverzler/auth/infrastructure/dtos/user_dto.dart';
import '../../../fixtures/fixture_reader.dart';

void main() {
  final Map<String, dynamic> jsonMap =
      json.decode(fixtureReader('auth/user.json'));

  final tUserDto = UserDto(
    id: jsonMap['id'],
    email: jsonMap['email'],
    name: jsonMap['name'],
    phone: jsonMap['phone'],
    image: jsonMap['image'],
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

import 'dart:convert';

import 'package:deliverzler/auth/data/models/user_model.dart';
import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  final Map<String, dynamic> jsonMap =
      json.decode(fixtureReader('auth/user.json'));

  final tUserModel = UserModel(
    id: jsonMap['id'],
    email: jsonMap['email'],
    name: jsonMap['name'],
    phone: jsonMap['phone'],
    image: jsonMap['image'],
  );

  test(
    'should be a subclass of User entity',
    () async {
      // THEN
      expect(tUserModel, isA<User>());
    },
  );

  group(
    'toMap',
    () {
      test(
        'should return a JSON map containing the proper data',
        () async {
          // WHEN
          final result = tUserModel.toMap();

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
        'should return a valid model',
        () async {
          // WHEN
          final result = UserModel.fromMap(jsonMap);

          // THEN
          expect(result, tUserModel);
        },
      );
    },
  );
}

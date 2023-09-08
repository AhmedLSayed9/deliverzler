import 'dart:io';

String fixtureReader(String path) => File('test/fixtures/$path').readAsStringSync();

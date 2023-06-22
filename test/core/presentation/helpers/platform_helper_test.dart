import 'package:flutter/foundation.dart';

import 'package:flutter_test/flutter_test.dart';

import 'package:deliverzler/core/presentation/helpers/platform_helper.dart';

void main() {
  void setUpTargetPlatform(TargetPlatform targetPlatform) {
    debugDefaultTargetPlatformOverride = targetPlatform;
    addTearDown(() {
      debugDefaultTargetPlatformOverride = null;
    });
  }

  group('isMaterialApp', () {
    test(
      'should return false if TargetPlatform.isIOS',
      () {
        // GIVEN
        setUpTargetPlatform(TargetPlatform.iOS);
        // WHEN
        final result = PlatformHelper.isMaterialApp();
        // THEN
        expect(result, false);
      },
    );

    test(
      'should return false if TargetPlatform.macOS',
      () {
        // GIVEN
        setUpTargetPlatform(TargetPlatform.macOS);
        // WHEN
        final result = PlatformHelper.isMaterialApp();
        // THEN
        expect(result, false);
      },
    );

    test(
      'should return true if TargetPlatform.android',
      () {
        // GIVEN
        setUpTargetPlatform(TargetPlatform.android);
        // WHEN
        final result = PlatformHelper.isMaterialApp();
        // THEN
        expect(result, true);
      },
    );

    test(
      'should return true if TargetPlatform.fuchsia',
      () {
        // GIVEN
        setUpTargetPlatform(TargetPlatform.fuchsia);
        // WHEN
        final result = PlatformHelper.isMaterialApp();
        // THEN
        expect(result, true);
      },
    );

    test(
      'should return true if TargetPlatform.windows',
      () {
        // GIVEN
        setUpTargetPlatform(TargetPlatform.windows);
        // WHEN
        final result = PlatformHelper.isMaterialApp();
        // THEN
        expect(result, true);
      },
    );
  });
}

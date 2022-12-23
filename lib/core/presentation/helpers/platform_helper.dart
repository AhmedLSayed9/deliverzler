import 'package:flutter/foundation.dart';

abstract class PlatformHelper {
  static bool isMaterialApp() {
    if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      return false;
    } else {
      return true;
    }
  }
}

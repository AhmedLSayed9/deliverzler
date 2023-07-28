import 'package:flutter/foundation.dart' show TargetPlatform, defaultTargetPlatform, kIsWeb;

abstract class PlatformHelper {
  static bool _matchPlatform(List<TargetPlatform> platforms) =>
      platforms.any((p) => defaultTargetPlatform == p);

  static bool get isMobileDevice =>
      !kIsWeb && (_matchPlatform([TargetPlatform.iOS, TargetPlatform.android]));
  static bool get isDesktopDevice =>
      !kIsWeb &&
      _matchPlatform([TargetPlatform.macOS, TargetPlatform.windows, TargetPlatform.linux]);
  static bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;
  static bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;

  static bool get isMaterialApp {
    if (kIsWeb) return true;

    if (_matchPlatform([TargetPlatform.iOS, TargetPlatform.macOS, TargetPlatform.linux])) {
      return false;
    } else {
      return true;
    }
  }
}

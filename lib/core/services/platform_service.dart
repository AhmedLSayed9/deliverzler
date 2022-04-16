import 'dart:io';

class PlatformService {
  PlatformService._();

  static final instance = PlatformService._();

  bool isMaterialApp() {
    if (Platform.isIOS || Platform.isMacOS) {
      return false;
    } else {
      return true;
    }
  }
}

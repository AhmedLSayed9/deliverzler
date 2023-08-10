import 'package:device_info_plus/device_info_plus.dart';

import '../utils/fp_framework.dart';

extension AndroidDeviceInfoX on Option<AndroidDeviceInfo> {
  bool get isOldAndroid {
    return match(() => false, (info) => info.version.sdkInt < 29);
  }
}

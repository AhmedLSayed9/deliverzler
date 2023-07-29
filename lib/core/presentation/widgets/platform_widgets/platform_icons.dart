import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

import '../../helpers/platform_helper.dart';

abstract class AppPlatformIcons {
  static PlatformIcons platformIcons(BuildContext context) => context.platformIcons;

  static IconData get error =>
      PlatformHelper.isMaterialApp ? Icons.error : CupertinoIcons.exclamationmark_circle_fill;
}

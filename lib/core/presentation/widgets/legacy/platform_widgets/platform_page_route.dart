import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../helpers/platform_helper.dart';

PageRoute<T> platformPageRoute<T>({
  required WidgetBuilder builder,
  RouteSettings? settings,
  bool maintainState = true,
  bool fullscreenDialog = false,
  String? iosTitle,
}) {
  if (PlatformHelper.isMaterialApp) {
    return MaterialPageRoute<T>(
      builder: builder,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    );
  } else {
    return CupertinoPageRoute<T>(
      builder: builder,
      title: iosTitle,
      settings: settings,
      maintainState: maintainState,
      fullscreenDialog: fullscreenDialog,
    );
  }
}

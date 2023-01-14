import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

//Abiding to Material 3 Design guidelines:
//https://m3.material.io/foundations/adaptive-design/large-screens/overview
enum WindowSizeClass {
  compact(0),
  medium(600),
  expanded(840);

  const WindowSizeClass(this.breakpoint);

  final int breakpoint;
}

WindowSizeClass getWindowClass(Size size) {
  late final double deviceWidth;

  //Use width=Size.width rather than width=Size.shortest when on Web/Desktop.
  //This fixes when window's height is adjusted but the width is still wide, should
  //be considered expanded instead of medium/compact.
  if (kIsWeb || Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
    deviceWidth = size.width;
  } else {
    deviceWidth = size.shortestSide;
  }

  if (deviceWidth >= WindowSizeClass.expanded.breakpoint) {
    return WindowSizeClass.expanded;
  }
  if (deviceWidth >= WindowSizeClass.medium.breakpoint) {
    return WindowSizeClass.medium;
  }
  return WindowSizeClass.compact;
}

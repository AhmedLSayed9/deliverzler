import 'package:flutter/material.dart';

import '../../helpers/platform_helper.dart';

/// Base class to be extended by all platform widgets
abstract class PlatformBaseWidget<A extends Widget, I extends Widget> extends StatelessWidget {
  const PlatformBaseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PlatformHelper.isMaterialApp
        ? createMaterialWidget(context)
        : createCupertinoWidget(context);
  }

  A createMaterialWidget(BuildContext context);

  I createCupertinoWidget(BuildContext context);
}

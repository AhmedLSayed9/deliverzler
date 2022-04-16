import 'package:deliverzler/core/services/platform_service.dart';
import 'package:flutter/material.dart';

abstract class PlatformBaseWidget<I extends Widget, A extends Widget>
    extends StatelessWidget {
  const PlatformBaseWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformService.instance.isMaterialApp()
        ? createMaterialWidget(context)
        : createCupertinoWidget(context);
  }

  I createCupertinoWidget(BuildContext context);

  A createMaterialWidget(BuildContext context);
}

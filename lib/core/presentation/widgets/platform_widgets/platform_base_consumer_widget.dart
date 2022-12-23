import 'package:flutter/material.dart';

import '../../helpers/platform_helper.dart';
import '../../utils/riverpod_framework.dart';

/// Base class to be extended by all platform widgets
abstract class PlatformBaseConsumerWidget<A extends Widget, I extends Widget>
    extends ConsumerWidget {
  const PlatformBaseConsumerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PlatformHelper.isMaterialApp()
        ? createMaterialWidget(context, ref)
        : createCupertinoWidget(context, ref);
  }

  A createMaterialWidget(BuildContext context, WidgetRef ref);

  I createCupertinoWidget(BuildContext context, WidgetRef ref);
}

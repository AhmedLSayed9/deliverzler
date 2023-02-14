import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../helpers/platform_helper.dart';

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

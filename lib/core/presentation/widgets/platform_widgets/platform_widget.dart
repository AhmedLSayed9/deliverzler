import 'package:flutter/material.dart';

import 'platform_base_widget.dart';

class PlatformWidget extends PlatformBaseWidget<Widget, Widget> {
  const PlatformWidget({
    super.key,
    this.material,
    this.cupertino,
  });

  final WidgetBuilder? material;
  final WidgetBuilder? cupertino;

  @override
  Widget createMaterialWidget(BuildContext context) {
    return material?.call(context) ?? const SizedBox.shrink();
  }

  @override
  Widget createCupertinoWidget(BuildContext context) {
    return cupertino?.call(context) ?? const SizedBox.shrink();
  }
}

import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_base_widget.dart';
import 'package:flutter/material.dart';

typedef PlatformWidgetBuilder<T> = Widget Function(BuildContext context);

class PlatformWidget extends PlatformBaseWidget<Widget, Widget> {
  const PlatformWidget({
    super.key,
    this.material,
    this.cupertino,
  });

  final PlatformWidgetBuilder? material;
  final PlatformWidgetBuilder? cupertino;

  @override
  Widget createMaterialWidget(BuildContext context) {
    return material?.call(context) ?? const SizedBox.shrink();
  }

  @override
  Widget createCupertinoWidget(BuildContext context) {
    return cupertino?.call(context) ?? const SizedBox.shrink();
  }
}

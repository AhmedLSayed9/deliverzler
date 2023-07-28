import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core_features/theme/presentation/utils/colors/custom_colors.dart';
import 'platform_base_widget.dart';

class PlatformRefreshIndicator extends PlatformBaseWidget<RefreshIndicator, CustomScrollView> {
  const PlatformRefreshIndicator({
    required this.onRefresh,
    required this.slivers,
    super.key,
    this.widgetKey,
    this.scrollController,
  });

  final Key? widgetKey;
  final ScrollController? scrollController;
  final Future<void> Function() onRefresh;
  final List<Widget> slivers;

  @override
  RefreshIndicator createMaterialWidget(BuildContext context) {
    return RefreshIndicator(
      key: widgetKey,
      onRefresh: onRefresh,
      color: customColors(context).loadingIndicatorColor,
      child: CustomScrollView(
        controller: scrollController,
        slivers: slivers,
      ),
    );
  }

  @override
  CustomScrollView createCupertinoWidget(BuildContext context) {
    return CustomScrollView(
      key: widgetKey,
      controller: scrollController,
      slivers: [
        CupertinoSliverRefreshControl(
          onRefresh: onRefresh,
        ),
        ...slivers,
      ],
    );
  }
}

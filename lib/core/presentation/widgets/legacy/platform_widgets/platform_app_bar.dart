import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../styles/sizes.dart';
import '../../platform_widgets/platform_base_widget.dart';

class PlatformAppBar extends PlatformBaseWidget<AppBar, SizedBox> {
  const PlatformAppBar({
    super.key,
    this.widgetKey,
    this.toolbarHeight,
    this.backgroundColor,
    this.leading,
    this.automaticallyImplyLeading = true,
    this.title,
    this.actions,
    this.materialData,
    this.cupertinoData,
  });

  final Key? widgetKey;
  final double? toolbarHeight;
  final Color? backgroundColor;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final Widget? title;
  final List<Widget>? actions;
  final MaterialAppBarData? materialData;
  final CupertinoNavigationBarData? cupertinoData;

  @override
  AppBar createMaterialWidget(BuildContext context) {
    return AppBar(
      key: widgetKey,
      toolbarHeight: toolbarHeight,
      backgroundColor: backgroundColor,
      leading: leading,
      automaticallyImplyLeading: automaticallyImplyLeading,
      title: title,
      actions: actions,
      centerTitle: materialData?.centerTitle,
      elevation: materialData?.elevation,
      titleSpacing: materialData?.titleSpacing,
      leadingWidth: materialData?.leadingWidth,
    );
  }

  @override
  SizedBox createCupertinoWidget(BuildContext context) {
    return SizedBox(
      //Have to add height here in addition to PreferredSizeWidget..
      //https://github.com/flutter/flutter/issues/112326
      height: Sizes.statusBarHeight + (toolbarHeight ?? kMinInteractiveDimensionCupertino),
      child: CupertinoNavigationBar(
        key: widgetKey,
        backgroundColor: backgroundColor,
        leading: leading,
        automaticallyImplyLeading: automaticallyImplyLeading,
        middle: title,
        trailing: actions?.isEmpty ?? true
            ? null
            : Row(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: actions!,
              ),
        border: cupertinoData?.border,
        transitionBetweenRoutes: cupertinoData?.transitionBetweenRoutes ?? true,
      ),
    );
  }
}

class MaterialAppBarData {
  const MaterialAppBarData({
    this.centerTitle,
    this.elevation,
    this.titleSpacing,
    this.leadingWidth,
  });

  final bool? centerTitle;
  final double? elevation;
  final double? titleSpacing;
  final double? leadingWidth;
}

class CupertinoNavigationBarData {
  const CupertinoNavigationBarData({
    this.transitionBetweenRoutes,
    this.border,
  });

  final bool? transitionBetweenRoutes;
  final Border? border;
}

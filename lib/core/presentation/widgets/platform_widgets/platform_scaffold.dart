import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../empty_appbar_widget.dart';
import 'platform_base_widget.dart';

class PlatformScaffold extends PlatformBaseWidget<Scaffold, Widget> {
  const PlatformScaffold({
    required this.body,
    this.widgetKey,
    this.platformAppBar,
    this.hasEmptyAppbar = true,
    this.backgroundColor,
    this.materialData,
    super.key,
  });

  final Key? widgetKey;
  final Object? platformAppBar;
  final bool hasEmptyAppbar;
  final Widget body;
  final Color? backgroundColor;
  final MaterialScaffoldData? materialData;

  @override
  Scaffold createMaterialWidget(BuildContext context) {
    return Scaffold(
      key: widgetKey,
      appBar: platformAppBar != null
          ? platformAppBar! as PreferredSizeWidget
          : hasEmptyAppbar
              ? EmptyAppBar(
                  statusBarColor: materialData?.statusBarColor,
                )
              : null,
      body: body,
      floatingActionButton: materialData?.floatingActionButton,
      drawer: materialData?.drawer,
      backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      extendBodyBehindAppBar: materialData?.extendBodyBehindAppBar ?? false,
    );
  }

  @override
  Widget createCupertinoWidget(BuildContext context) {
    return CupertinoPageScaffold(
      key: widgetKey,
      navigationBar: platformAppBar != null
          ? platformAppBar! as ObstructingPreferredSizeWidget
          : hasEmptyAppbar
              ? const EmptyAppBar(
                  //It's not allowed to set statusBarColor for iOS without an appbar.
                  statusBarColor: Colors.transparent,
                )
              : null,
      backgroundColor: backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: body,
    );
  }
}

class MaterialScaffoldData {
  const MaterialScaffoldData({
    this.floatingActionButton,
    this.drawer,
    this.extendBodyBehindAppBar,
    this.statusBarColor,
  });

  final Widget? floatingActionButton;
  final Widget? drawer;
  final bool? extendBodyBehindAppBar;
  final Color? statusBarColor;
}

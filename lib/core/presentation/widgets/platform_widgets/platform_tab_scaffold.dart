import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'platform_base_consumer_widget.dart';
import 'platform_nav_bar.dart';

typedef IndexedAppBarBuilder = dynamic Function(
    BuildContext context, int index);

class PlatformTabScaffold
    extends PlatformBaseConsumerWidget<Scaffold, CupertinoTabScaffold> {
  const PlatformTabScaffold({
    super.key,
    this.widgetKey,
    this.backgroundColor,
    this.resizeToAvoidBottomInset = true,
    required this.bottomNavigationBar,
    required this.materialData,
    required this.cupertinoData,
  });

  final Key? widgetKey;
  final Color? backgroundColor;
  final bool resizeToAvoidBottomInset;
  final PlatformNavBar bottomNavigationBar;
  final MaterialTabScaffoldData materialData;
  final CupertinoTabScaffoldData cupertinoData;

  @override
  Scaffold createMaterialWidget(BuildContext context, ref) {
    return Scaffold(
      key: widgetKey,
      appBar: materialData.appBar,
      body: materialData.body,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: materialData.floatingActionButton,
      drawer: materialData.drawer,
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      extendBodyBehindAppBar: materialData.extendBodyBehindAppBar ?? false,
    );
  }

  @override
  CupertinoTabScaffold createCupertinoWidget(BuildContext context, ref) {
    return CupertinoTabScaffold(
      key: widgetKey,
      tabBuilder: cupertinoData.cupertinoTabBuilder,
      tabBar: bottomNavigationBar.createCupertinoWidget(context),
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
    );
  }
}

class MaterialTabScaffoldData {
  MaterialTabScaffoldData({
    this.appBar,
    required this.body,
    this.floatingActionButton,
    this.drawer,
    this.extendBodyBehindAppBar,
    this.statusBarColor,
  });

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Widget? floatingActionButton;
  final Widget? drawer;
  final bool? extendBodyBehindAppBar;
  final Color? statusBarColor;
}

class CupertinoTabScaffoldData {
  const CupertinoTabScaffoldData({
    required this.cupertinoTabBuilder,
  });

  final IndexedWidgetBuilder cupertinoTabBuilder;
}

import 'package:deliverzler/core/services/platform_service.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter/material.dart';

class PopUpPage extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final bool safeAreaNavBar;
  final Color? statusBarColor;
  final Color? backgroundColor;
  final Widget body;
  final PlatformAppBar? appBar;
  final bool resizeToAvoidBottomInset;
  final bool extendBodyBehindAppBar;
  final Widget? drawer;
  final PlatformNavBar? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Future<bool> Function()? onWillPop;

  const PopUpPage({
    Key? key,
    this.scaffoldKey,
    this.safeAreaTop = false,
    this.safeAreaBottom = false,
    this.safeAreaNavBar = false,
    this.statusBarColor,
    this.backgroundColor,
    this.body = const SizedBox(),
    this.appBar,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset = false,
    this.drawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.onWillPop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop ?? () => Future.value(true),
      child: SafeArea(
        top: safeAreaTop,
        bottom: safeAreaBottom,
        child: PlatformScaffold(
          widgetKey: scaffoldKey,
          backgroundColor:
              backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
          appBar: appBar,
          bottomNavBar: bottomNavigationBar,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: statusBarColor != null
                ? Theme.of(context)
                    .appBarTheme
                    .systemOverlayStyle!
                    .copyWith(statusBarColor: statusBarColor)
                : Theme.of(context).appBarTheme.systemOverlayStyle!,
            child: PlatformService.instance.isMaterialApp()
                ? body
                : SafeArea(
                    top: false,
                    bottom: safeAreaNavBar,
                    child: body,
                  ),
          ),
          material: (_, __) {
            return MaterialScaffoldData(
              drawer: drawer,
              floatingActionButton: floatingActionButton,
              resizeToAvoidBottomInset: resizeToAvoidBottomInset,
              extendBodyBehindAppBar: extendBodyBehindAppBar,
            );
          },
          cupertino: (_, __) {
            return CupertinoPageScaffoldData(
              resizeToAvoidBottomInset: resizeToAvoidBottomInset,
            );
          },
        ),
      ),
    );
  }
}

import 'package:deliverzler/core/services/platform_service.dart';
import 'package:deliverzler/core/widgets/custom_app_bar_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter/material.dart';

class PopUpPage extends StatelessWidget {
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final bool safeAreaTop;
  final bool safeAreaBottom;
  final bool safeAreaNavBar;
  final Color? backgroundColor;
  final Widget body;
  final bool hasAppBar;
  final double? appbarHeight;
  final Color? appBarColor;
  final String? title;
  final Widget? customTitle;
  final bool centerTitle;
  final bool appBarWithBack;
  final dynamic result;
  final bool appBarWithMenu;
  final Widget? customLeading;
  final List<Widget>? trailingActions;
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
    this.backgroundColor,
    this.body = const SizedBox(),
    this.hasAppBar = false,
    this.appbarHeight,
    this.appBarColor,
    this.title,
    this.customTitle,
    this.centerTitle = false,
    this.appBarWithBack = false,
    this.result,
    this.appBarWithMenu = false,
    this.customLeading,
    this.trailingActions,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset = false,
    this.drawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.onWillPop,
  })  : assert(appBarWithMenu ^ (scaffoldKey == null)),
        super(key: key);

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
          appBar: hasAppBar
              ? CustomAppBar(
                  context,
                  scaffoldKey: scaffoldKey,
                  height: appbarHeight,
                  appBarColor: appBarColor ??
                      Theme.of(context).appBarTheme.backgroundColor,
                  title: title,
                  customTitle: customTitle,
                  centerTitle: centerTitle,
                  hasBackButton: appBarWithBack,
                  result: result,
                  customLeading: customLeading,
                  hasMenuButton: PlatformService.instance.isMaterialApp()
                      ? appBarWithMenu
                      : false,
                  trailingActions: trailingActions,
                )
              : null,
          bottomNavBar: bottomNavigationBar,
          body: AnnotatedRegion<SystemUiOverlayStyle>(
            value: safeAreaTop
                ? Theme.of(context).appBarTheme.systemOverlayStyle!
                : Theme.of(context)
                    .appBarTheme
                    .systemOverlayStyle!
                    .copyWith(statusBarColor: Colors.transparent),
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

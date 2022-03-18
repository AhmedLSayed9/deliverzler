import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

class PopUpPage extends StatelessWidget {
  final Widget child;
  final bool appBarSkippable;
  final bool appBarWithMenu;
  final bool appBarWithBack;
  final bool appBarTitle;
  final bool canPop;
  final String? title;
  final Function? skipBehaviour;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Color? backgroundColor;
  final bool showBackgroundImage;
  final bool fixedNavigationBarColor;
  final bool extendBodyBehindAppBar;
  final bool resizeToAvoidBottomInset;
  final Widget? backButtonWidget;
  final double? appbarHeight;
  final List<Widget> appbarItems;
  final Widget? drawer;
  final Widget? floatingActionButton;
  final dynamic result;
  final Future<bool> Function()? onWillPop;
  final Color? appBarColor;
  final Color? backButtonColor;
  final bool? safeAreaTop;
  final bool? safeAreaBottom;
  final Widget? bottomNavigationBar;

  const PopUpPage({
    Key? key,
    this.child = const SizedBox(),
    this.appBarSkippable = false,
    this.appBarWithMenu = false,
    this.appBarWithBack = false,
    this.appBarTitle = false,
    this.canPop = false,
    this.title,
    this.skipBehaviour,
    this.scaffoldKey,
    this.backgroundColor,
    this.showBackgroundImage = false,
    this.fixedNavigationBarColor = false,
    this.extendBodyBehindAppBar = false,
    this.resizeToAvoidBottomInset = false,
    this.appbarHeight,
    this.appbarItems = const [],
    this.drawer,
    this.floatingActionButton,
    this.onWillPop,
    this.result,
    this.appBarColor,
    this.backButtonColor,
    this.backButtonWidget,
    this.safeAreaTop,
    this.safeAreaBottom,
    this.bottomNavigationBar,
  })  : assert((appBarSkippable ^ (skipBehaviour == null)) &&
            (appBarWithMenu ^ (scaffoldKey == null)) &&
            (appBarTitle ^ (title == null))),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop ?? () => Future.value(true),
      child: SafeArea(
        top: safeAreaTop ?? false,
        bottom: safeAreaBottom ?? false,
        child: Scaffold(
          key: scaffoldKey,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          backgroundColor:
              backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          appBar: appBarSkippable
              ? CustomAppBar.skippable(
                  context,
                  children: appbarItems,
                  backButtonColor: backButtonColor,
                  height: appbarHeight,
                  skipBehaviour: skipBehaviour!,
                )
              : appBarWithMenu
                  ? CustomAppBar.withMenu(
                      context,
                      scaffoldKey: scaffoldKey!,
                      children: appbarItems,
                      menuButtonColor: AppColors.lightThemePrimary,
                    )
                  : appBarWithBack
                      ? CustomAppBar(
                          context,
                          canPop: true,
                          children: appbarItems,
                          height: appbarHeight,
                          backButtonColor: backButtonColor,
                          result: result,
                          color: appBarColor,
                          backButtonWidget: backButtonWidget,
                        )
                      : appBarTitle
                          ? CustomAppBar.title(
                              context,
                              canPop: canPop,
                              title: title!,
                              result: result,
                              color: appBarColor,
                            )
                          : null,
          drawer: drawer,
          floatingActionButton: floatingActionButton,
          body: child,
          bottomNavigationBar: bottomNavigationBar,
        ),
      ),
    );
  }
}

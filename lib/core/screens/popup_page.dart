import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/core/widgets/custom_app_bar_widget.dart';
import 'package:flutter/material.dart';

class PopUpPage extends StatelessWidget {
  final Widget child;
  final bool appBarSkippable;
  final bool appBarWithMenu;
  final bool appBarWithBack;
  final Function? skipBehaviour;
  final GlobalKey<ScaffoldState>? scaffoldKey;
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
  final bool showUpperShadow;

  const PopUpPage({
    Key? key,
    this.child = const SizedBox(),
    this.appBarSkippable = false,
    this.appBarWithMenu = false,
    this.appBarWithBack = false,
    this.showBackgroundImage = false,
    this.skipBehaviour,
    this.scaffoldKey,
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
    this.showUpperShadow = false,
    this.safeAreaBottom,
  })  : assert((appBarSkippable ^ (skipBehaviour == null)) &&
            (appBarWithMenu ^ (scaffoldKey == null))),
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
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                      menuButtonColor: AppColors.primaryColor,
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
                      : null,
          drawer: drawer,
          floatingActionButton: floatingActionButton,
          body: Stack(alignment: Alignment.center, children: [
            child,
            if (showUpperShadow)
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: Sizes.screenTopShadowHeight(context),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xde000000), Color(0x00000000)],
                      stops: [0, 0.4],
                      begin: Alignment.topCenter,
                      end: Alignment(0, .1),
                    ),
                  ),
                ),
              )
          ]),
        ),
      ),
    );
  }
}

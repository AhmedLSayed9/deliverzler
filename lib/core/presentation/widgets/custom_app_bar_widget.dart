import 'package:flutter/material.dart';

import '../routing/navigation_service.dart';
import '../styles/sizes.dart';
import 'platform_widgets/platform_app_bar.dart';
import 'platform_widgets/platform_icon_button.dart';
import 'platform_widgets/platform_icons.dart';

class CustomAppBar extends PlatformAppBar {
  CustomAppBar(
    BuildContext context, {
    super.key,
    double? height = Sizes.appBarHeight56,
    Color? backgroundColor,
    GlobalKey<ScaffoldState>? scaffoldKey,
    Widget? title,
    bool centerTitle = false,
    bool hasBackButton = false,
    dynamic result,
    bool hasMenuButton = false,
    Widget? customLeading,
    List<Widget>? trailingActions,
    double elevation = 0,
  }) : super(
          toolbarHeight: height,
          backgroundColor:
              backgroundColor ?? Theme.of(context).appBarTheme.backgroundColor,
          leading: hasBackButton
              ? CustomBackButton(result: result)
              : hasMenuButton
                  ? CustomMenuButton(scaffoldKey: scaffoldKey!)
                  : customLeading,
          automaticallyImplyLeading: false,
          actions: [
            if (trailingActions != null) ...trailingActions,
            if (hasBackButton)
              const SizedBox(
                width: Sizes.appBarButtonR32 * 2,
              ),
            if (hasMenuButton)
              const SizedBox(
                width: Sizes.appBarButtonR32 * 2,
              ),
          ],
          title: title,
          materialData: MaterialAppBarData(
            centerTitle: centerTitle,
            elevation: elevation,
            leadingWidth: Sizes.appBarButtonR32 * 2,
            titleSpacing: Sizes.paddingH20,
          ),
          cupertinoData: const CupertinoNavigationBarData(
            transitionBetweenRoutes: false,
            border: Border(bottom: BorderSide(color: Colors.transparent)),
          ),
        );
}

class CustomBackButton extends StatelessWidget {
  final dynamic result;
  final Color? color;
  final EdgeInsets? padding;
  final bool isLTROnly;

  const CustomBackButton({
    required this.result,
    this.color,
    this.padding,
    this.isLTROnly = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformIconButton(
      onPressed: () => NavigationService.pop(context, result: result),
      icon: Icon(
        PlatformIcons.back,
        color: color ?? Theme.of(context).iconTheme.color,
        size: Sizes.appBarButtonR32,
        textDirection: isLTROnly ? TextDirection.ltr : null,
      ),
      padding: padding ??
          const EdgeInsets.symmetric(
            horizontal: Sizes.appBarButtonR32 / 2,
          ),
      materialData: const MaterialIconButtonData(
        constraints: BoxConstraints(),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      cupertinoData: const CupertinoButtonData(
        minSize: 0.0,
        alignment: Alignment.center,
      ),
    );
  }
}

class CustomMenuButton extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CustomMenuButton({
    required this.scaffoldKey,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformIconButton(
      onPressed: () {
        scaffoldKey.currentState?.openDrawer();
      },
      icon: Icon(
        Icons.menu_rounded,
        size: Sizes.appBarButtonR32,
        color: Theme.of(context).colorScheme.primary,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: Sizes.appBarButtonR32 / 2,
      ),
      materialData: const MaterialIconButtonData(
        constraints: BoxConstraints(),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      cupertinoData: const CupertinoButtonData(
        minSize: 0.0,
        alignment: Alignment.center,
      ),
    );
  }
}

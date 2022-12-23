import 'package:deliverzler/core/presentation/helpers/platform_helper.dart';
import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_app_bar.dart';
import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_icon_button.dart';
import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_icons.dart';
import 'package:flutter/material.dart';
import 'package:deliverzler/core/presentation/routing/navigation_service.dart';
import 'package:deliverzler/core/core_features/theme/presentation/utils/colors/app_static_colors.dart';
import 'package:deliverzler/core/presentation/styles/font_styles.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/widgets/custom_text.dart';

class CustomAppBar extends PlatformAppBar {
  CustomAppBar(
    BuildContext context, {
    super.key,
    double? height,
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
          toolbarHeight: height ?? Sizes.appBarHeight(context),
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
              SizedBox(
                width: Sizes.appBarButtonRadius(context) * 2,
              ),
            if (hasMenuButton)
              SizedBox(
                width: Sizes.appBarButtonRadius(context) * 2,
              ),
          ],
          title: title,
          materialData: MaterialAppBarData(
            elevation: elevation,
            leadingWidth: Sizes.appBarButtonRadius(context) * 2,
            titleSpacing: Sizes.paddingH22(context),
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
      onPressed: () {
        NavigationService.goBack(context, result: result);
      },
      icon: Icon(
        PlatformIcons.back,
        color: color ?? Theme.of(context).iconTheme.color,
        size: Sizes.appBarButtonRadius(context),
        textDirection: isLTROnly ? TextDirection.ltr : null,
      ),
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: Sizes.appBarButtonRadius(context) / 2,
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
        size: Sizes.appBarButtonRadius(context),
        color: Theme.of(context).colorScheme.primary,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.appBarButtonRadius(context) / 2,
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

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    required this.title,
    required this.centerTitle,
    Key? key,
  }) : super(key: key);

  final String title;
  final bool centerTitle;

  @override
  Widget build(BuildContext context) {
    return CustomText.f24(
      context,
      title,
      weight: FontStyles.fontWeightBold,
      color: AppStaticColors.white,
      alignment: PlatformHelper.isMaterialApp()
          ? centerTitle
              ? Alignment.center
              : null
          : Alignment.center,
    );
  }
}

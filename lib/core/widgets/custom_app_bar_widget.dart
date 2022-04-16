import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/font_styles.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends PlatformAppBar {
  CustomAppBar(
    BuildContext context, {
    Key? key,
    GlobalKey<ScaffoldState>? scaffoldKey,
    double? height,
    Color? appBarColor,
    String? title,
    Widget? customTitle,
    required bool centerTitle,
    required bool hasBackButton,
    dynamic result,
    required bool hasMenuButton,
    Widget? customLeading,
    List<Widget>? trailingActions,
  }) : super(
          key: key,
          backgroundColor: appBarColor,
          leading: hasBackButton
              ? _BackButton(result: result)
              : hasMenuButton
                  ? _MenuButton(scaffoldKey: scaffoldKey!)
                  : customLeading,
          automaticallyImplyLeading: false,
          trailingActions: [
            if (trailingActions != null) ...trailingActions,
            if (hasBackButton)
              SizedBox(
                width: Sizes.appBarBackButtonRadius(context) * 2,
              ),
            if (hasMenuButton)
              SizedBox(
                width: Sizes.appBarMenuButtonRadius(context) * 2,
              ),
          ],
          material: (_, __) {
            return MaterialAppBarData(
              elevation: 0,
              toolbarHeight: height ?? Sizes.appBarDefaultHeight(context),
              title: title != null
                  ? CustomText.h2(
                      context,
                      title,
                      weight: FontStyles.fontWeightBold,
                      color: AppColors.white,
                      alignment: centerTitle ? Alignment.center : null,
                    )
                  : customTitle,
              leadingWidth: Sizes.appBarBackButtonRadius(context) * 2,
              titleSpacing: Sizes.hPaddingMedium(context),
            );
          },
          cupertino: (_, __) {
            return CupertinoNavigationBarData(
              transitionBetweenRoutes: false,
              border: Border.all(style: BorderStyle.none),
              title: title != null
                  ? CustomText.h2(
                      context,
                      title,
                      weight: FontStyles.fontWeightBold,
                      color: AppColors.white,
                      alignment: Alignment.center,
                    )
                  : customTitle,
            );
          },
        );
}

class _MenuButton extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const _MenuButton({
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
        size: Sizes.appBarMenuButtonRadius(context),
        color: AppColors.lightThemePrimary,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.appBarMenuButtonRadius(context) / 2,
      ),
      material: (_, __) {
        return MaterialIconButtonData(
          constraints: const BoxConstraints(),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        );
      },
      cupertino: (_, __) {
        return CupertinoIconButtonData(
          alignment: Alignment.center,
        );
      },
    );
  }
}

class _BackButton extends StatelessWidget {
  final dynamic result;

  const _BackButton({
    required this.result,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PlatformIconButton(
      onPressed: () {
        NavigationService.goBack(result: result);
      },
      icon: Icon(
        PlatformIcons(context).back,
        color: Theme.of(context).iconTheme.color,
        size: Sizes.appBarBackButtonRadius(context),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.appBarBackButtonRadius(context) / 2,
      ),
      material: (_, __) {
        return MaterialIconButtonData(
          constraints: const BoxConstraints(),
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        );
      },
      cupertino: (_, __) {
        return CupertinoIconButtonData(
          alignment: Alignment.center,
        );
      },
    );
  }
}

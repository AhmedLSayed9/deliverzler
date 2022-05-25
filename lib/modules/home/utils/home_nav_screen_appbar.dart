import 'package:deliverzler/core/components/appbar_with_icon_component.dart';
import 'package:deliverzler/core/routing/route_paths.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/services/platform_service.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/app_images.dart';
import 'package:deliverzler/core/widgets/custom_app_bar_widget.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

PlatformAppBar? getHomeNavScreenAppBar(
  context, {
  required String routeName,
  GlobalKey<ScaffoldState>? scaffoldKey,
}) {
  switch (routeName) {
    case RoutePaths.home:
      return CustomAppBar(
        context,
        scaffoldKey: scaffoldKey,
        hasMenuButton: PlatformService.instance.isMaterialApp() ? true : false,
        customTitle: CustomText.h2(
          context,
          tr(context).appName,
          color: AppColors.lightThemePrimary,
          alignment: Alignment.center,
        ),
      );
    case RoutePaths.profile:
      return CustomAppBar(
        context,
        hasBackButton: PlatformService.instance.isMaterialApp() ? true : false,
        customTitle: AppBarWithIconComponent(
          icon: AppImages.profileScreenIcon,
          title: tr(context).myProfile,
        ),
      );
    case RoutePaths.settings:
      return CustomAppBar(
        context,
        hasBackButton: PlatformService.instance.isMaterialApp() ? true : false,
        customTitle: AppBarWithIconComponent(
          icon: AppImages.settingsScreenIcon,
          title: tr(context).settings,
        ),
      );
    case RoutePaths.settingsLanguage:
      return CustomAppBar(
        context,
        hasBackButton: true,
        customTitle: AppBarWithIconComponent(
          icon: AppImages.languageScreenIcon,
          title: tr(context).language,
        ),
      );
    default:
      return null;
  }
}

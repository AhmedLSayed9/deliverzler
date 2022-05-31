import 'package:deliverzler/core/components/appbar_with_icon_component.dart';
import 'package:deliverzler/core/routing/route_paths.dart';
import 'package:deliverzler/core/services/localization_service.dart';
import 'package:deliverzler/core/services/platform_service.dart';
import 'package:deliverzler/core/styles/app_colors.dart';
import 'package:deliverzler/core/styles/app_images.dart';
import 'package:deliverzler/core/widgets/custom_app_bar_widget.dart';
import 'package:deliverzler/core/widgets/custom_text.dart';
import 'package:deliverzler/modules/home/viewmodels/home_base_nav_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// The default height of the toolbar component of the [AppBar].
const double kToolbarHeight = 56.0;

class PreferredAppBarSize extends Size {
  PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}

class HomeBaseNavAppBar extends ConsumerWidget
    implements PreferredSizeWidget, ObstructingPreferredSizeWidget {
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;
  final GlobalKey<ScaffoldState>? scaffoldKey;

  HomeBaseNavAppBar({
    this.toolbarHeight,
    this.bottom,
    this.backgroundColor,
    this.scaffoldKey,
    Key? key,
  })  : preferredSize =
            PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height),
        super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _currentIndex = ref.watch(HomeBaseNavProviders.currentIndex);
    final _currentRoute = ref.watch(HomeBaseNavProviders.routes[_currentIndex]);

    switch (_currentRoute) {

      ///HomeNestedRoutes
      case RoutePaths.home:
        return CustomAppBar(
          context,
          scaffoldKey: scaffoldKey,
          hasMenuButton:
              PlatformService.instance.isMaterialApp() ? true : false,
          customTitle: CustomText.h2(
            context,
            tr(context).appName,
            color: AppColors.lightThemePrimary,
            alignment: Alignment.center,
          ),
        );

      ///ProfileNestedRoutes
      case RoutePaths.profile:
        return CustomAppBar(
          context,
          hasBackButton:
              PlatformService.instance.isMaterialApp() ? true : false,
          customTitle: AppBarWithIconComponent(
            icon: AppImages.profileScreenIcon,
            title: tr(context).myProfile,
          ),
        );

      ///SettingsNestedRoutes
      case RoutePaths.settings:
        return CustomAppBar(
          context,
          hasBackButton:
              PlatformService.instance.isMaterialApp() ? true : false,
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
        return const SizedBox();
    }
  }

  @override
  final Size preferredSize;

  @override
  bool shouldFullyObstruct(BuildContext context) {
    final Color backgroundColor =
        CupertinoDynamicColor.maybeResolve(this.backgroundColor, context) ??
            CupertinoTheme.of(context).barBackgroundColor;
    return backgroundColor.alpha == 0xFF;
  }
}

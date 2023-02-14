import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/presentation/components/appbar_with_icon_component.dart';
import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/routing/route_paths.dart';
import '../../../../core/presentation/styles/app_images.dart';
import '../../../../core/presentation/widgets/custom_app_bar_widget.dart';
import '../../../../core/presentation/widgets/custom_text.dart';
import '../providers/tabs_providers.dart';

/// The default height of the toolbar component of the [AppBar].
const double kToolbarHeight = 56.0;

class PreferredAppBarSize extends Size {
  PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight(
            (toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}

class TabAppBarComponent extends HookConsumerWidget
    implements PreferredSizeWidget, ObstructingPreferredSizeWidget {
  TabAppBarComponent({
    this.toolbarHeight,
    this.bottom,
    this.backgroundColor,
    Key? key,
  })  : preferredSize =
            PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height),
        super(key: key);

  //ToolbarHeight for Android/iOS and BackgroundColor for iOS must be pre-initialized, as we
  //implementing PreferredSizeWidget, ObstructingPreferredSizeWidget to be able to rebuild only the appbar.
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, ref) {
    final selectedTab = ref.watch(selectedTabProvider);
    final currentRoute = ref.watch(tabCurrentRouteProvider(selectedTab));

    switch (currentRoute) {

      ///HomeNestedRoutes
      case RoutePaths.home:
        return CustomAppBar(
          context,
          centerTitle: true,
          title: CustomText.f20(
            context,
            tr(context).appName,
            color: Theme.of(context).colorScheme.primary,
          ),
        );

      ///ProfileNestedRoutes
      case RoutePaths.profile:
        return CustomAppBar(
          context,
          title: AppBarWithIconComponent(
            icon: AppImages.profileScreenIcon,
            title: tr(context).myProfile,
          ),
        );

      ///SettingsNestedRoutes
      case RoutePaths.settings:
        return CustomAppBar(
          context,
          title: AppBarWithIconComponent(
            icon: AppImages.settingsScreenIcon,
            title: tr(context).settings,
          ),
        );
      case RoutePaths.language:
        return CustomAppBar(
          context,
          hasBackButton: true,
          title: AppBarWithIconComponent(
            icon: AppImages.languageScreenIcon,
            title: tr(context).language,
          ),
        );

      default:
        return CustomAppBar(
          context,
        );
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/presentation/components/appbar_with_icon_component.dart';
import '../../../../core/presentation/helpers/localization_helper.dart';
import '../../../../core/presentation/routing/app_router.dart';
import '../../../../core/presentation/styles/app_images.dart';
import '../../../../core/presentation/widgets/custom_app_bar_widget.dart';
import '../../../../core/presentation/widgets/custom_text.dart';

/// The default height of the toolbar component of the [AppBar].
const double kToolbarHeight = 56;

class PreferredAppBarSize extends Size {
  PreferredAppBarSize(this.toolbarHeight, this.bottomHeight)
      : super.fromHeight((toolbarHeight ?? kToolbarHeight) + (bottomHeight ?? 0));

  final double? toolbarHeight;
  final double? bottomHeight;
}

class TabAppBarComponent extends StatelessWidget
    implements PreferredSizeWidget, ObstructingPreferredSizeWidget {
  TabAppBarComponent({
    this.toolbarHeight,
    this.bottom,
    this.backgroundColor,
    super.key,
  }) : preferredSize = PreferredAppBarSize(toolbarHeight, bottom?.preferredSize.height);

  static final IList<String> _noAppBarLocations = IListConst([
    const MapRoute().location,
  ]);

  //ToolbarHeight for Android/iOS and BackgroundColor for iOS must be pre-initialized, as we
  //implementing PreferredSizeWidget, ObstructingPreferredSizeWidget to be able to rebuild only the appbar.
  final double? toolbarHeight;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final location = GoRouter.of(context).location;

    /// Home Tab
    if (location == const HomeRoute().location) {
      return CustomAppBar(
        context,
        centerTitle: true,
        title: CustomText.f20(
          context,
          tr(context).appName,
          color: Theme.of(context).colorScheme.primary,
        ),
      );
    }

    /// Profile Tab
    else if (location == const ProfileRoute().location) {
      return CustomAppBar(
        context,
        title: AppBarWithIconComponent(
          icon: AppImages.profileScreenIcon,
          title: tr(context).myProfile,
        ),
      );
    }

    /// Settings Tab
    else if (location == const SettingsRoute().location) {
      return CustomAppBar(
        context,
        title: AppBarWithIconComponent(
          icon: AppImages.settingsScreenIcon,
          title: tr(context).settings,
        ),
      );
    } else if (location == const LanguageRoute().location) {
      return CustomAppBar(
        context,
        hasBackButton: true,
        title: AppBarWithIconComponent(
          icon: AppImages.languageScreenIcon,
          title: tr(context).language,
        ),
      );
    }

    return CustomAppBar(context);
  }

  @override
  final Size preferredSize;

  @override
  bool shouldFullyObstruct(BuildContext context) {
    final backgroundColor = CupertinoDynamicColor.maybeResolve(this.backgroundColor, context) ??
        CupertinoTheme.of(context).barBackgroundColor;
    return backgroundColor.alpha == 0xFF;
  }
}

extension StatefulNavigationShellX on StatefulNavigationShell {
  bool get currentLocationHasAppBar {
    final location = shellRouteContext.routerState.location;
    return !TabAppBarComponent._noAppBarLocations.contains(location);
  }
}

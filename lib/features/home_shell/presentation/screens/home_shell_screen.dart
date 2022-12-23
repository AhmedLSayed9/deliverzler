import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';

import '../../../../auth/presentation/providers/sign_out_provider.dart';
import '../../../../core/presentation/services/connection_stream_service.dart';
import '../../../../core/presentation/services/fcm_service/show_fcm_notification_provider.dart';
import '../../../../core/presentation/styles/sizes.dart';
import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../../../core/presentation/utils/toasts.dart';
import '../../../../core/presentation/widgets/platform_widgets/platform_tab_scaffold.dart';
import '../../../notifications/domain/app_notification.dart';
import '../../../notifications/presentation/providers/fcm_remote_message_providers.dart';
import '../../../notifications/presentation/providers/tapped_notification_provider.dart';
import '../components/bottom_nav_bar_component.dart';
import '../components/tab_appbar_component.dart';
import '../utils/tab_item.dart';

/// Builds the "shell" for the home by building a Scaffold with a persistent
/// BottomNavigationBar or similar, where [navigationShell] is placed in the body of the Scaffold.
class HomeShellScreen extends HookConsumerWidget {
  const HomeShellScreen({required this.navigationShell, super.key});

  /// The navigation shell and container for the branch Navigators.
  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context, ref) {
    ref.listen(connectionStreamProvider, (prevState, newState) {
      newState.whenOrNull(
        data: (status) {
          Toasts.showConnectionToast(context, connectionStatus: status);
        },
      );
    });

    ref.easyListen(signOutStateProvider);

    ref.listen(onMessageProvider, (previous, next) {
      next.whenData(
        (message) {
          ref.read(showFCMNotificationProvider(message));
        },
      );
    });

    final selectedTab =
        useState<TabItem>(TabItem.values[navigationShell.currentIndex]);

    ref.listen<Option<AppNotification>>(
      tappedNotificationProvider,
      (previous, next) {
        if (next is Some<AppNotification>) {
          final notification = next.value;
          selectedTab.value = TabItem.values
              .firstWhere((tab) => tab.name == notification.tabName);

          final location = notification.routeLocation;
          if (location != null) context.go(location);
        }
      },
    );

    return WillPopScope(
      onWillPop: () async {
        //This prevent popping when tab isn't (Home) & instead will back to home.
        if (selectedTab.value != TabItem.home) {
          selectedTab.value = TabItem.home;
          navigationShell.goBranch(TabItem.home.index);
          return false;
        }
        return true;
      },
      child: PlatformTabScaffold(
        materialData: MaterialTabScaffoldData(
          // Using single persistent AppBar for all tabs and update it according to current location.
          // This is necessary to avoid using nested scaffolds as it's discouraged by flutter
          // (but You can use it anyway if you don't want the persistent AppBar behavior).
          // While for iOS, we can use CupertinoTabScaffold which has tabBuilder/tabBar(BNB)
          // and each nested screen can use CupertinoPageScaffold that can have individual Appbar.
          appBar: navigationShell.currentLocationHasAppBar
              ? TabAppBarComponent(
                  toolbarHeight: Sizes.appBarHeight56,
                  backgroundColor:
                      Theme.of(context).appBarTheme.backgroundColor,
                )
              : null,
          body: navigationShell,
        ),
        cupertinoData: CupertinoTabScaffoldData(
          cupertinoTabBuilder: (context, index) {
            return navigationShell;
          },
        ),
        bottomNavigationBar: BottomNavBarComponent(
          context,
          currentTab: selectedTab.value,
          onSelectTab: (tab) {
            selectedTab.value = tab;
            // When navigating to a new branch, it's recommended to use the goBranch
            // method, as doing so makes sure the last navigation state of the
            // Navigator for the branch is restored.
            navigationShell.goBranch(
              tab.index,
              // A common pattern when using bottom navigation bars is to support
              // navigating to the initial location when tapping the item that is
              // already active. This demonstrates how to support this behavior,
              // using the initialLocation parameter of goBranch:
              // initialLocation: tab.index == navigationShell.currentIndex,
            );
          },
        ),
      ),
    );
  }
}

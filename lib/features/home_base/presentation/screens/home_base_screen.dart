import 'package:deliverzler/auth/presentation/providers/sign_out_provider.dart';
import 'package:deliverzler/core/presentation/extensions/app_error_extension.dart';
import 'package:deliverzler/core/presentation/routing/navigation_service.dart';
import 'package:deliverzler/core/presentation/styles/sizes.dart';
import 'package:deliverzler/core/presentation/utils/toasts.dart';
import 'package:deliverzler/core/presentation/utils/dialogs.dart';
import 'package:deliverzler/core/presentation/widgets/platform_widgets/platform_tab_scaffold.dart';
import 'package:deliverzler/core/presentation/services/connection_stream_service.dart';
import 'package:deliverzler/features/home_base/presentation/components/bottom_nav_bar_component.dart';
import 'package:deliverzler/features/home_base/presentation/components/tab_appbar_component.dart';
import 'package:deliverzler/features/home_base/presentation/screens/tab_navigator_screen.dart';
import 'package:deliverzler/features/home_base/presentation/utils/tab_item.dart';
import 'package:deliverzler/features/home_base/presentation/providers/tabs_providers.dart';
import 'package:deliverzler/features/notifications/domain/entities/app_notification.dart';
import 'package:deliverzler/features/notifications/presentation/providers/fcm_remote_message_providers.dart';
import 'package:deliverzler/features/notifications/presentation/providers/tapped_notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:deliverzler/core/presentation/utils/functional.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeBaseScreen extends HookConsumerWidget {
  const HomeBaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    ref.listen<AsyncValue<ConnectionStatus>>(
      connectionStreamProvider,
      (prevState, newState) {
        newState.whenOrNull(
          data: (status) {
            Toasts.showConnectionToast(context, connectionStatus: status);
          },
        );
      },
    );

    ref.listen<AsyncValue<void>>(
      signOutStateProvider,
      (prevState, newState) {
        prevState?.unwrapPrevious().whenOrNull(
              loading: () => NavigationService.dismissDialog(context),
            );
        newState.unwrapPrevious().whenOrNull(
              loading: () => Dialogs.showLoadingDialog(context),
              error: (err, st) {
                Dialogs.showErrorDialog(
                  context,
                  message: err.errorMessage(context),
                );
              },
            );
      },
    );

    final selectedTab = ref.watch(selectedTabProvider);
    final navigatorKeys = useMemoized(() => {
          TabItem.profile: GlobalKey<NavigatorState>(debugLabel: 'page1'),
          TabItem.home: GlobalKey<NavigatorState>(debugLabel: 'page2'),
          TabItem.settings: GlobalKey<NavigatorState>(debugLabel: 'page3'),
        });

    useEffect(() {
      ref.read(getInitialMessageProvider);
      ref.listenManual(onMessageProvider, (previous, next) {});
      ref.listenManual(onMessageOpenedAppProvider, (previous, next) {});
      return null;
    }, []);

    //TODO [Enhancement]: use go_router for better deep links handling
    ref.listen<Option<AppNotification>>(
      tappedNotificationProvider,
      (previous, next) {
        if (next is Some<AppNotification>) {
          final notification = next.value;
          ref.read(selectedTabProvider.notifier).state = TabItem.values
              .firstWhere(
                  (tab) => tab.initialRoute == notification.initialRoute);
          if (notification.route != null) {
            NavigationService.push(
              navigatorKeys[selectedTab]!.currentContext!,
              isNamed: true,
              page: notification.route,
            );
          }
        }
      },
    );

    return WillPopScope(
      onWillPop: () async {
        //This prevent popping the main navigator when pressing mobile's back button
        final selectedNavKey = navigatorKeys[selectedTab];
        if (await selectedNavKey!.currentState!.maybePop()) {
          return false;
        }
        //This prevent popping when tab isn't (Home) & instead will back to home
        if (selectedTab != TabItem.home) {
          ref.read(selectedTabProvider.notifier).state = TabItem.home;
          return false;
        }
        return true;
      },
      child: AnnotatedRegion(
        //TODO: This is temporary until https://github.com/flutter/flutter/pull/104827
        //is on stable channel then remove this AnnotatedRegion
        value: Theme.of(context).appBarTheme.systemOverlayStyle!,
        child: PlatformTabScaffold(
          materialData: MaterialTabScaffoldData(
            //Using single persistent AppBar for all tabs and update it with state management. This is necessary to avoid using
            //nested scaffolds as it's not recommended by Flutter. While for iOS we can use CupertinoTabScaffold which has
            //tabBuilder/tabBar(BNB) and each nested screen can use CupertinoPageScaffold that can have individual Appbar.
            appBar: TabAppBarComponent(
              toolbarHeight: Sizes.appBarHeight(context),
              backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            ),
            body: HomeBaseMaterialBody(navigatorKeys: navigatorKeys),
          ),
          cupertinoData: CupertinoTabScaffoldData(
            cupertinoTabBuilder: (context, index) {
              final tab = TabItem.values[index];
              //Using Navigator for both android and iOS (instead of CupertinoTabView which does the same)
              return TabNavigatorScreen(
                tabItem: tab,
                navigatorKey: navigatorKeys[tab]!,
              );
            },
          ),
          bottomNavigationBar: BottomNavBarComponent(
            context,
            currentTab: selectedTab,
            onSelectTab: (tab) {
              ref.read(selectedTabProvider.notifier).state = tab;
            },
          ),
        ),
      ),
    );
  }
}

class HomeBaseMaterialBody extends HookConsumerWidget {
  const HomeBaseMaterialBody({
    required this.navigatorKeys,
    Key? key,
  }) : super(key: key);

  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  @override
  Widget build(BuildContext context, ref) {
    final selectedTab = ref.watch(selectedTabProvider);
    final pageController = usePageController(initialPage: selectedTab.index);

    ref.listen<TabItem>(
      selectedTabProvider,
      (previous, next) {
        pageController.jumpToPage(next.index);
      },
    );

    return PageView(
      physics: const NeverScrollableScrollPhysics(),
      controller: pageController,
      children: TabItem.values
          .map((tab) => TabNavigatorScreen(
                tabItem: tab,
                navigatorKey: navigatorKeys[tab]!,
              ))
          .toList(),
    );
  }
}

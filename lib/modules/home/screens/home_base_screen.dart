import 'package:deliverzler/core/components/main_drawer.dart';
import 'package:deliverzler/core/screens/popup_page.dart';
import 'package:deliverzler/core/styles/sizes.dart';
import 'package:deliverzler/modules/home/components/bottom_nav_bar_component.dart';
import 'package:deliverzler/modules/home/utils/home_base_nav_appbar.dart';
import 'package:deliverzler/modules/home/utils/home_base_nav_utils.dart';
import 'package:deliverzler/modules/home/viewmodels/home_base_nav_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeBaseScreen extends HookConsumerWidget {
  const HomeBaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    //This prevent disposing routes Providers when switching between tabs
    //Also using autoDispose provider is necessary to reset providers when home is popped
    for (final provider in HomeBaseNavProviders.routes) {
      ref.watch(provider.notifier);
    }
    final _currentIndex = ref.watch(HomeBaseNavProviders.currentIndex);
    final _indexNotifier =
        ref.watch(HomeBaseNavProviders.currentIndex.notifier);
    final _scaffoldKey = useMemoized(() => GlobalKey<ScaffoldState>());

    return PopUpPage(
      safeAreaNavBar: true,
      onWillPop: () async {
        //This prevent popping the main navigator when pressing mobile's back button
        if (await HomeBaseNavUtils.navScreensKeys[_currentIndex].currentState!
            .maybePop()) {
          return false;
        }
        //This prevent popping when index isn't 1 (Home) & instead will back to home
        if (_currentIndex != 1) {
          _indexNotifier.state = 1;
          return false;
        }
        return true;
      },
      //Using dynamic shared Appbar to show differently titled AppBars.
      //This avoid using nested scaffolds as it's not recommended by flutter.
      //ToolbarHeight for Android and BackgroundColor for iOS must be pre-initialized, as we
      //implementing PreferredSizeWidget, ObstructingPreferredSizeWidget to be able to rebuild only the appbar.
      consumerAppBar: HomeBaseNavAppBar(
        toolbarHeight: Sizes.appBarDefaultHeight(context),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        scaffoldKey: _scaffoldKey,
      ),
      scaffoldKey: _scaffoldKey,
      drawer: MainDrawer(
        scaffoldKey: _scaffoldKey,
      ),
      body: HomeBaseNavUtils.navScreens[_currentIndex],
      cupertinoTabChildBuilder: (context, index) {
        return HomeBaseNavUtils.navScreens[index];
      },
      bottomNavigationBar: bottomNavBarComponent(
        context,
        currentIndex: _currentIndex,
        itemChanged: (index) {
          _indexNotifier.state = index;
        },
      ),
    );
  }
}

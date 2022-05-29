import 'package:deliverzler/core/components/main_drawer.dart';
import 'package:deliverzler/core/screens/popup_page.dart';
import 'package:deliverzler/modules/home/components/bottom_nav_bar_component.dart';
import 'package:deliverzler/modules/home/utils/home_nav_screen_appbar.dart';
import 'package:deliverzler/modules/home/utils/home_nav_screens_utils.dart';
import 'package:deliverzler/modules/home/viewmodels/home_nav_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeBaseScreen extends HookConsumerWidget {
  const HomeBaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    //This prevent disposing homeNavRoutesProviders when switching between tabs
    //Also using autoDispose provider is necessary to reset providers when home is popped
    for (final provider in HomeNavProviders.routes) {
      ref.watch(provider.notifier);
    }
    final _currentIndex = ref.watch(HomeNavProviders.currentIndex);
    final _indexNotifier = ref.watch(HomeNavProviders.currentIndex.notifier);
    final _currentRoute = ref.watch(HomeNavProviders.routes[_currentIndex]);
    final _scaffoldKey = useMemoized(() => GlobalKey<ScaffoldState>());

    return PopUpPage(
      safeAreaNavBar: true,
      onWillPop: () async {
        //This prevent popping the main navigator when pressing mobile's back button
        if (await HomeNavScreensUtils
            .homeNavScreensKeys[_currentIndex].currentState!
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
      //Use dynamic shared Appbar to show differently titled AppBars.
      //This avoid using nested scaffolds as it's not recommended by flutter
      appBar: getHomeNavScreenAppBar(
        context,
        routeName: _currentRoute,
        scaffoldKey: _scaffoldKey,
      ),
      scaffoldKey: _scaffoldKey,
      drawer: MainDrawer(
        scaffoldKey: _scaffoldKey,
      ),
      body: HomeNavScreensUtils.homeNavScreens[_currentIndex],
      cupertinoTabChildBuilder: (context, index) {
        return HomeNavScreensUtils.homeNavScreens[index];
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

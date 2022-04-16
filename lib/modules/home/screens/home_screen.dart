import 'package:deliverzler/core/screens/popup_page.dart';
import 'package:deliverzler/modules/home/components/bottom_nav_bar_component.dart';
import 'package:deliverzler/modules/home/utils/home_nav_screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final _navIndex = useState(1);

    return PopUpPage(
      safeAreaNavBar: true,
      body: IndexedStack(
        index: _navIndex.value,
        children: homeNavScreens,
      ),
      bottomNavigationBar: bottomNavBarComponent(
        context,
        currentIndex: _navIndex.value,
        itemChanged: (index) {
          _navIndex.value = index;
        },
      ),
    );
  }
}
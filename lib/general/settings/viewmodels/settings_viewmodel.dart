import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/routing/route_paths.dart';
import 'package:deliverzler/core/viewmodels/main_core_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final settingsViewModel =
    Provider<SettingsViewModel>((ref) => SettingsViewModel(ref));

class SettingsViewModel {
  SettingsViewModel(this.ref) {
    _mainCoreProvider = ref.watch(mainCoreProvider);
  }

  final Ref ref;
  late MainCoreProvider _mainCoreProvider;

  signOut() async {
    NavigationService.pushReplacementAll(
      isNamed: true,
      page: RoutePaths.authLogin,
    );
    //Delay until NavigationFadeTransition is done
    await Future.delayed(const Duration(seconds: 1));
    await _mainCoreProvider.logoutUser();
  }
}

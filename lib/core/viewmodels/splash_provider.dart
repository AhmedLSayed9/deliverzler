import 'package:deliverzler/authentication/models/user_model.dart';
import 'package:deliverzler/core/services/init_services/connectivity_service.dart';
import 'package:deliverzler/core/services/init_services/firebase_messaging_service.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/services/init_services/services_initializer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/routing/route_paths.dart';
import 'package:deliverzler/core/viewmodels/main_core_provider.dart';

final splashProvider = Provider.autoDispose<SplashProvider>(
    (ref) => SplashProvider(ref.read(mainCoreProvider)));

class SplashProvider {
  final MainCoreProvider _mainCoreProvider;
  late String secondPage;

  SplashProvider(this._mainCoreProvider) {
    ConnectivityService.instance.checkIfConnected().then((value) async {
      await Future.delayed(const Duration(seconds: 2), () {});
      if (value) {
        initializeData().then(
          (_) {
            NavigationService.pushReplacementAll(
              isNamed: true,
              page: secondPage,
            );
            if (secondPage == RoutePaths.home) {
              FirebaseMessagingService.instance.getInitialMessage();
            }
          },
        );
      } else {
        NavigationService.pushReplacementAll(
          isNamed: true,
          page: RoutePaths.coreNoInternet,
          arguments: {'fromSplash': true},
        );
      }
    });
  }

  Future initializeData() async {
    List futures = [
      ServiceInitializer.instance.initializeData(),
      checkForCachedUser(),
    ];
    await Future.wait<dynamic>([...futures]);
  }

  Future checkForCachedUser() async {
    String? uid = _mainCoreProvider.getCurrentUserAuthUid();

    if (uid != null) {
      UserModel? userModel =
          await _mainCoreProvider.getUserFromFirebase(uid: uid);
      if (userModel != null) {
        _mainCoreProvider.setCurrentUser(userModel: userModel);
        secondPage = RoutePaths.home;
      } else {
        await _mainCoreProvider.logoutUser();
        secondPage = RoutePaths.authLogin;
      }
    } else {
      secondPage = RoutePaths.authLogin;
    }
  }
}

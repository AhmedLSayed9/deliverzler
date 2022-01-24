import 'package:deliverzler/authentication/models/user_model.dart';
import 'package:deliverzler/core/services/init_services/connectivity_service.dart';
import 'package:deliverzler/core/services/init_services/firebase_messaging_service.dart';
import 'package:deliverzler/core/services/navigation_service.dart';
import 'package:deliverzler/core/services/init_services/services_initializer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/core/utils/routes.dart';
import 'package:deliverzler/core/viewmodels/main_core_viewmodel.dart';

final splashViewModel = ChangeNotifierProvider.autoDispose<SplashViewModel>(
    (ref) => SplashViewModel(ref.read(mainCoreViewModel)));

class SplashViewModel extends ChangeNotifier {
  final MainCoreViewModel _mainCoreVM;
  late String secondPage;

  SplashViewModel(this._mainCoreVM) {
    ConnectivityService.instance.checkIfConnected().then((value) async {
      await Future.delayed(const Duration(seconds: 2), () {});
      if (value) {
        initializeData().then(
          (_) {
            NavigationService.offAll(
              isNamed: true,
              page: secondPage,
            );
            if (secondPage == RoutePaths.home) {
              FirebaseMessagingService.instance.getInitialMessage();
            }
          },
        );
      } else {
        NavigationService.offAll(
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
    String? uid = _mainCoreVM.getCurrentUserAuthUid();

    if (uid != null) {
      UserModel? userModel =
          await _mainCoreVM.getUserDataFromFirebase(uid: uid);
      if (userModel != null) {
        _mainCoreVM.setCurrentUser(userModel: userModel);
        secondPage = RoutePaths.home;
      } else {
        await _mainCoreVM.logoutUser();
        secondPage = RoutePaths.authLogin;
      }
    } else {
      secondPage = RoutePaths.authLogin;
    }
  }
}

import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:deliverzler/authentication/services/firebase_auth_api.dart';
import 'package:deliverzler/authentication/models/user_model.dart';
import 'package:deliverzler/authentication/repos/user_repo.dart';
import 'package:deliverzler/authentication/viewmodels/auth_loading_provider.dart';
import 'package:deliverzler/core/services/init_services/firebase_messaging_service.dart';
import 'package:deliverzler/core/utils/dialogs.dart';
import 'package:deliverzler/core/utils/routes.dart';
import 'package:deliverzler/core/utils/validators.dart';
import 'package:deliverzler/core/viewmodels/main_core_viewmodel.dart';
import 'package:deliverzler/core/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModel =
    ChangeNotifierProvider<AuthViewModel>((ref) => AuthViewModel(ref));

class AuthViewModel with ChangeNotifier {
  AuthViewModel(this.ref) {
    _mainCoreVM = ref.read(mainCoreViewModel);
  }

  final Ref ref;
  late MainCoreViewModel _mainCoreVM;

  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  String? Function(String?)? validateLoginEmail() {
    return Validators.instance.validateEmail();
  }

  String? Function(String?)? validateLoginPassword() {
    return Validators.instance.validateLoginPassword();
  }

  signInWithEmailAndPassword(context) async {
    try {
      ref.read(authLoadingProvider.notifier).state = true;
      removeAllFocus(context);
      UserModel? userModel = await FirebaseAuthAPI.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);
      if (userModel?.uId != null) {
        await submitLogin(userModel: userModel!);
      }
      ref.read(authLoadingProvider.notifier).state = false;
    } on FirebaseAuthException catch (e) {
      onFirebaseAuthException(e);
    } catch (e) {
      debugPrint(e.toString());
      AppDialogs.showEmailOrPassIncorrectDialog().then((value) {
        ref.read(authLoadingProvider.notifier).state = false;
      });
    }
  }

  onFirebaseAuthException(FirebaseAuthException error) {
    if (error.code == 'network-request-failed') {
      AppDialogs.showDefaultErrorDialog().then((value) {
        ref.read(authLoadingProvider.notifier).state = false;
      });
    } else {
      AppDialogs.showEmailOrPassIncorrectDialog().then((value) {
        ref.read(authLoadingProvider.notifier).state = false;
      });
    }
  }

  void removeAllFocus(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  Future submitLogin({required UserModel? userModel}) async {
    debugPrint(userModel!.toMap().toString());
    try {
      UserModel? client = await UserRepo(userId: userModel.uId)
          .setUserData(userData: userModel);
      _mainCoreVM.setCurrentUser(userModel: client!);
      subscribeUserToTopic();
      navigationToHomeScreen();
    } catch (e) {
      debugPrint(e.toString());
      AppDialogs.showDefaultErrorDialog();
    }
  }

  subscribeUserToTopic() {
    FirebaseMessagingService.instance.subscribeToTopic(
      topic: 'general',
    );
  }

  navigationToHomeScreen() {
    NavigationService.offAll(
      isNamed: true,
      page: RoutePaths.home,
    );
  }
}

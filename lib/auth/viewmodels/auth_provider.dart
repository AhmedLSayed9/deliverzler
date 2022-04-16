import 'dart:developer';

import 'package:deliverzler/auth/models/user_model.dart';
import 'package:deliverzler/auth/repos/auth_repo.dart';
import 'package:deliverzler/auth/viewmodels/auth_state.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/routing/route_paths.dart';
import 'package:deliverzler/core/services/init_services/firebase_messaging_service.dart';
import 'package:deliverzler/core/utils/dialogs.dart';
import 'package:deliverzler/core/viewmodels/main_core_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider =
    StateNotifierProvider.autoDispose<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(ref);
});

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(this.ref) : super(const AuthState.available()) {
    _mainCoreProvider = ref.watch(mainCoreProvider);
    _authRepo = ref.watch(authRepoProvider);
  }

  final Ref ref;
  late MainCoreProvider _mainCoreProvider;
  late AuthRepo _authRepo;

  signInWithEmailAndPassword(
    BuildContext context, {
    required String email,
    required String password,
  }) async {
    state = const AuthState.loading();
    NavigationService.removeAllFocus();
    final _result = await _authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    await _result.fold(
      (failure) {
        state = AuthState.error(errorText: failure.message);
        AppDialogs.showErrorDialog(context, message: failure.message);
      },
      (user) async {
        UserModel userModel = user;
        await submitLogin(context, userModel);
      },
    );
  }

  Future submitLogin(BuildContext context, UserModel userModel) async {
    log(userModel.toMap().toString());
    final _result = await _mainCoreProvider.setUserToFirebase(userModel);
    await _result.fold(
      (failure) {
        state = AuthState.error(errorText: failure.message);
        AppDialogs.showErrorDialog(context, message: failure.message);
      },
      (isSet) async {
        subscribeUserToTopic();
        navigationToHomeScreen();
      },
    );
  }

  subscribeUserToTopic() {
    FirebaseMessagingService.instance.subscribeToTopic(
      topic: 'general',
    );
  }

  navigationToHomeScreen() {
    NavigationService.pushReplacementAll(
      isNamed: true,
      page: RoutePaths.home,
    );
  }
}

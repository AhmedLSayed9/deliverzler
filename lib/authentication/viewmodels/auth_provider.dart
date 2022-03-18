import 'package:deliverzler/authentication/models/user_model.dart';
import 'package:deliverzler/authentication/repos/auth_repo.dart';
import 'package:deliverzler/authentication/viewmodels/auth_state.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:deliverzler/core/routing/route_paths.dart';
import 'package:deliverzler/core/services/init_services/firebase_messaging_service.dart';
import 'package:deliverzler/core/utils/dialogs.dart';
import 'package:deliverzler/core/viewmodels/main_core_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider =
    StateNotifierProvider.autoDispose<AuthProvider, AuthState>((ref) {
  return AuthProvider(ref);
});

class AuthProvider extends StateNotifier<AuthState> {
  AuthProvider(this.ref) : super(const AuthState.available()) {
    _mainCoreProvider = ref.read(mainCoreProvider);
    _authRepo = ref.read(authRepoProvider);
  }

  final Ref ref;
  late MainCoreProvider _mainCoreProvider;
  late AuthRepo _authRepo;

  signInWithEmailAndPassword({
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
        AppDialogs.showErrorDialog(message: failure.message);
      },
      (user) async {
        UserModel userModel = user;
        await submitLogin(userModel);
      },
    );
  }

  Future submitLogin(UserModel userModel) async {
    debugPrint(userModel.toMap().toString());
    final _result = await _mainCoreProvider.setUserToFirebase(userModel);
    await _result.fold(
      (failure) {
        state = AuthState.error(errorText: failure?.message);
        AppDialogs.showErrorDialog(message: failure?.message);
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

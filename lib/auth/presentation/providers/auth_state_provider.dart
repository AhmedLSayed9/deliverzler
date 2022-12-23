import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/auth/presentation/providers/user_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_state_provider.g.dart';

enum AuthState {
  authenticated,
  unauthenticated,
}

@Riverpod(keepAlive: true)
class AuthStateController extends _$AuthStateController {
  @override
  AuthState build() {
    return AuthState.unauthenticated;
  }

  void authenticateUser(User user) {
    ref.read(userControllerProvider.notifier).setUser(user);
    state = AuthState.authenticated;
  }

  void unAuthenticateUser() {
    state = AuthState.unauthenticated;
    //Delay invalidating userControllerProvider to ensure page animation is completed.
    Future.delayed(const Duration(seconds: 1), () {
      ref.invalidate(userControllerProvider);
    });
  }
}

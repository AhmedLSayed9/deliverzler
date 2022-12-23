import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/auth/presentation/providers/user_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum AuthState {
  authenticated,
  unauthenticated,
}

final authStateProvider =
    NotifierProvider<AuthStateNotifier, AuthState>(AuthStateNotifier.new);

class AuthStateNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    return AuthState.unauthenticated;
  }

  void authenticateUser(User user) {
    ref.read(userProvider.notifier).setUser(user);
    state = AuthState.authenticated;
  }

  void unAuthenticateUser() {
    state = AuthState.unauthenticated;
    //Delay invalidating userProvider to ensure page animation is completed.
    Future.delayed(const Duration(seconds: 1), () {
      ref.invalidate(userProvider);
    });
  }
}

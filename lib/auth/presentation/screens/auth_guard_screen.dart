import 'package:deliverzler/auth/presentation/providers/auth_state_provider.dart';
import 'package:deliverzler/auth/presentation/screens/sign_in_screen/sign_in_screen.dart';
import 'package:deliverzler/features/home_base/presentation/screens/home_base_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthGuardScreen extends ConsumerWidget {
  const AuthGuardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final authState = ref.watch(authStateControllerProvider);

    return authState == AuthState.authenticated
        ? const HomeBaseScreen()
        : const SignInScreen();
  }
}

import 'package:flutter/material.dart';

import '../../../core/presentation/utils/riverpod_framework.dart';
import '../../../features/home_base/presentation/screens/home_base_screen.dart';
import '../providers/auth_state_provider.dart';
import 'sign_in_screen/sign_in_screen.dart';

class AuthGuardScreen extends ConsumerWidget {
  const AuthGuardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    final isAuthenticated =
        ref.watch(authStateProvider.select((user) => user.isSome()));

    return isAuthenticated ? const HomeBaseScreen() : const SignInScreen();
  }
}

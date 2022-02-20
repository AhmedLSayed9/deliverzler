import 'package:deliverzler/authentication/viewmodels/auth_provider.dart';
import 'package:deliverzler/core/utils/validators.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authViewModel = ChangeNotifierProvider.autoDispose<AuthViewModel>(
    (ref) => AuthViewModel(ref));

class AuthViewModel extends ChangeNotifier {
  AuthViewModel(this.ref);

  final Ref ref;

  TextEditingController emailController = TextEditingController(text: "");
  TextEditingController passwordController = TextEditingController(text: "");

  String? Function(String?)? validateLoginEmail() {
    return Validators.instance.validateEmail();
  }

  String? Function(String?)? validateLoginPassword() {
    return Validators.instance.validateLoginPassword();
  }

  signInWithEmailAndPassword() {
    ref.read(authProvider.notifier).signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        );
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}

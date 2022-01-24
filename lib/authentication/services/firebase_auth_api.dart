import 'package:deliverzler/authentication/models/user_model.dart';
import 'package:deliverzler/core/utils/dialogs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class FirebaseAuthAPI {
  FirebaseAuthAPI._();

  static final FirebaseAuthAPI instance = FirebaseAuthAPI._();

  UserCredential? userCredential;

  Future<UserModel?>? signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (userCredential != null) {
      debugPrint(userCredential.toString());
      return UserModel.fromUserCredential(userCredential!.user!);
    } else {
      AppDialogs.showDefaultErrorDialog();
      return null;
    }
  }

  Future signOut() async {
    await FirebaseAuth.instance.signOut();
  }
}

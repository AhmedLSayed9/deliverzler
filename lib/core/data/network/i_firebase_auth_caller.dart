import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

abstract class IFirebaseAuthCaller {
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<User> getCurrentUser();

  Future<void> signOut();
}

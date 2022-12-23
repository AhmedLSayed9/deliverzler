import 'dart:async';

import 'package:deliverzler/core/data/error/app_exception.dart';
import 'package:deliverzler/core/data/error/server_exception_type.dart';
import 'package:deliverzler/core/data/network/i_firebase_auth_caller.dart';
import 'package:deliverzler/core/data/network/main_api/extensions/firebase_error_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//Our main API is Firebase
final mainApiAuthCaller = Provider<IFirebaseAuthCaller>(
  (ref) => MainApiAuthCaller(
    firebaseAuth: FirebaseAuth.instance,
  ),
);

class MainApiAuthCaller implements IFirebaseAuthCaller {
  MainApiAuthCaller({
    required this.firebaseAuth,
  });

  final FirebaseAuth firebaseAuth;

  @override
  Future<UserCredential> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _tryCatchWrapper(
      () async {
        return await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
      },
    );
  }

  @override
  Future<User> getCurrentUser() async {
    return await _tryCatchWrapper(
      () async {
        final currentUser = firebaseAuth.currentUser;
        if (currentUser != null) {
          return currentUser;
        } else {
          throw const ServerException(
            type: ServerExceptionType.unauthorized,
            message: 'User is not signed-in',
          );
        }
      },
    );
  }

  @override
  Future<void> signOut() async {
    return await _tryCatchWrapper(
      () async {
        return await firebaseAuth.signOut();
      },
    );
  }

  FutureOr<T> _tryCatchWrapper<T>(FutureOr<T> Function() body) async {
    try {
      return await body();
    } on Exception catch (e) {
      throw e.firebaseErrorToServerException();
    }
  }
}

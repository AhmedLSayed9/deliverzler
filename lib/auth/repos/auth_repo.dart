import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:deliverzler/auth/models/user_model.dart';
import 'package:deliverzler/core/errors/exceptions.dart';
import 'package:deliverzler/core/errors/failures.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepoProvider = Provider<AuthRepo>((ref) => AuthRepo());

class AuthRepo {
  Future<Either<Failure, UserModel>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      log(userCredential.toString());
      return Right(UserModel.fromUserCredential(userCredential.user!));
    } on FirebaseAuthException catch (e) {
      final _errorMessage = Exceptions.firebaseAuthErrorMessage(e);
      return Left(ServerFailure(message: _errorMessage));
    } catch (e) {
      log(e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      return Left(ServerFailure(message: _errorMessage));
    }
  }

  Future signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      log(e.toString());
    }
  }
}

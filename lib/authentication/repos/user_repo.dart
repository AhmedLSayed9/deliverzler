import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:deliverzler/authentication/models/user_model.dart';
import 'package:deliverzler/core/errors/exceptions.dart';
import 'package:deliverzler/core/errors/failures.dart';
import 'package:deliverzler/core/services/firebase_services/firebase_caller.dart';
import 'package:deliverzler/core/services/firebase_services/firestore_paths.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepoProvider = Provider<UserRepo>((ref) => UserRepo());

class UserRepo {
  final FirebaseCaller _firebaseCaller = FirebaseCaller.instance;

  String? uid;
  UserModel? userModel;

  Future<Either<Failure, UserModel>> setUserDataToFirebase(
      UserModel userData) async {
    try {
      final _firebaseStoredUser = await getUserDataFromFirebase(userData.uId);
      if (_firebaseStoredUser == null) {
        _firebaseCaller.setData(
          path: FirestorePaths.userDocument(userData.uId),
          data: userData.toMap(),
        );
        userModel = userData;
        return Right(userData);
      } else {
        return Right(_firebaseStoredUser);
      }
    } on FirebaseAuthException catch (e) {
      final _errorMessage = Exceptions.firebaseAuthErrorMessage(e);
      return Left(ServerFailure(message: _errorMessage));
    } catch (e) {
      debugPrint(e.toString());
      final _errorMessage = Exceptions.errorMessage(e);
      return Left(ServerFailure(message: _errorMessage));
    }
  }

  Future<UserModel?> getUserDataFromFirebase(String userId) async {
    return await _firebaseCaller.getData(
      path: FirestorePaths.userDocument(userId),
      builder: (data, docId) {
        if (data != null) {
          userModel = UserModel.fromMap(data, docId!);
          return userModel!;
        }
        return null;
      },
    );
  }

  Future updateUser(UserModel userData) async {
    await _firebaseCaller.setData(
      path: FirestorePaths.userDocument(uid!),
      data: userData.toMap(),
      merge: true,
    );
    userModel = userData;
  }

  Future updateUserName({required String name}) async {
    await _firebaseCaller.setData(
      path: FirestorePaths.userDocument(uid!),
      data: {"name": name},
      merge: true,
    );
    userModel = userModel!.copyWith(name: name);
  }

  Future updateUserPhone({required String phone}) async {
    await _firebaseCaller.setData(
      path: FirestorePaths.userDocument(uid!),
      data: {"phone": phone},
      merge: true,
    );
    userModel = userModel!.copyWith(phone: phone);
  }

  Future updateUserImage({required File? imageFile}) async {
    String? _picUrl = await _firebaseCaller.uploadImage(
      path: FirestorePaths.profilesImagesPath(userModel!.uId),
      file: imageFile!,
    );
    if (_picUrl != null) {
      await _firebaseCaller.setData(
        path: FirestorePaths.userDocument(uid!),
        data: {"image": _picUrl},
        merge: true,
      );
      userModel = userModel!.copyWith(image: _picUrl);
    }
  }

  Future clearUserLocalData() async {
    uid = null;
    userModel = null;
  }
}

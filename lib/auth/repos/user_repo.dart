import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:deliverzler/auth/models/user_model.dart';
import 'package:deliverzler/core/errors/failures.dart';
import 'package:deliverzler/core/services/firebase_services/firebase_caller.dart';
import 'package:deliverzler/core/services/firebase_services/firestore_paths.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepoProvider = Provider<UserRepo>((ref) => UserRepo());

class UserRepo {
  final FirebaseCaller _firebaseCaller = FirebaseCaller.instance;

  String? uid;
  UserModel? userModel;

  Future<Either<Failure, UserModel?>> getUserData(String userId) async {
    return await _firebaseCaller.getData(
      path: FirestorePaths.userDocument(userId),
      builder: (data, docId) {
        if (data is! ServerFailure) {
          userModel = data != null ? UserModel.fromMap(data, docId!) : null;
          uid = userModel?.uId;
          return Right(userModel);
        } else {
          return Left(data);
        }
      },
    );
  }

  Future<Either<Failure, bool>> setUserData(UserModel userData) async {
    return await _firebaseCaller.setData(
      path: FirestorePaths.userDocument(userData.uId),
      data: userData.toMap(),
      builder: (data) {
        if (data is! ServerFailure && data == true) {
          userModel = userData;
          return Right(data);
        } else {
          return Left(data);
        }
      },
    );
  }

  Future<Either<Failure, bool>> updateUserData(UserModel userData) async {
    return await _firebaseCaller.setData(
      path: FirestorePaths.userDocument(uid!),
      data: userData.toMap(),
      merge: true,
      builder: (data) {
        if (data is! ServerFailure && data == true) {
          userModel = userData;
          return Right(data);
        } else {
          return Left(data);
        }
      },
    );
  }

  Future<Either<Failure, bool>> updateUserImage(File? imageFile) async {
    Either<Failure, String> _result = await _firebaseCaller.uploadImage(
      path: FirestorePaths.profilesImagesPath(uid!),
      file: imageFile!,
      builder: (data) {
        if (data is! ServerFailure) {
          return Right(data);
        } else {
          return Left(data);
        }
      },
    );
    return _result.fold(
      (failure) {
        return Left(failure);
      },
      (imageUrl) async {
        return await setUserImage(imageUrl);
      },
    );
  }

  Future<Either<Failure, bool>> setUserImage(String imageUrl) async {
    return await _firebaseCaller.setData(
      path: FirestorePaths.userDocument(uid!),
      data: {"image": imageUrl},
      merge: true,
      builder: (data) {
        if (data is! ServerFailure && data == true) {
          userModel = userModel!.copyWith(image: imageUrl);
          return Right(data);
        } else {
          return Left(data);
        }
      },
    );
  }

  Future clearUserLocalData() async {
    uid = null;
    userModel = null;
  }
}

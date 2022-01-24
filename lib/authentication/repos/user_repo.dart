import 'dart:io';

import 'package:deliverzler/authentication/models/user_model.dart';
import 'package:deliverzler/authentication/services/firebase_auth_api.dart';
import 'package:deliverzler/core/services/firebase_services/firebase_caller.dart';
import 'package:deliverzler/core/services/firebase_services/firestore_paths.dart';

class UserRepo {
  UserRepo._();

  static final UserRepo instance = UserRepo._();

  factory UserRepo({required String? userId}) {
    instance.uid = userId;
    return instance;
  }

  final FirebaseCaller _firebaseCaller = FirebaseCaller.instance;
  String? uid;
  UserModel? userModel;

  Future<UserModel?> setUserData({required UserModel userData}) async {
    final _currentStoredUser = await getUserData();
    if (_currentStoredUser == null) {
      _firebaseCaller.setData(
        path: FirestorePaths.userDocument(userData.uId),
        data: userData.toMap(),
      );
      userModel = userData;
      return userModel;
    } else {
      return _currentStoredUser;
    }
  }

  Future<UserModel?> getUserData() async {
    return await _firebaseCaller.getData(
      path: FirestorePaths.userDocument(uid!),
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

  Future logoutUser() async {
    uid = null;
    userModel = null;
    await FirebaseAuthAPI.instance.signOut();
  }
}

import 'dart:async';

import 'package:deliverzler/authentication/models/user_model.dart';
import 'package:deliverzler/authentication/repos/user_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:deliverzler/core/services/location_service.dart';

final mainCoreViewModel =
    ChangeNotifierProvider<MainCoreViewModel>((ref) => MainCoreViewModel());

class MainCoreViewModel extends ChangeNotifier {
  ///User module methods
  String? getCurrentUserAuthUid() {
    if (FirebaseAuth.instance.currentUser != null) {
      return FirebaseAuth.instance.currentUser!.uid;
    }
    return null;
  }

  Future<UserModel?>? getUserDataFromFirebase({required String uid}) async {
    try {
      return await UserRepo(userId: uid).getUserData();
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  UserModel? getCurrentUser() {
    return UserRepo.instance.userModel;
  }

  setCurrentUser({required UserModel userModel}) {
    UserRepo.instance.uid = userModel.uId;
    UserRepo.instance.userModel = userModel;
  }

  Future logoutUser() async {
    await UserRepo.instance.logoutUser();
  }

  ///Location module related...

  Future<bool> enableLocationAndRequestPermission() async {
    bool locationServiceEnabled = await enableLocationService();
    if (locationServiceEnabled) {
      return await requestLocationPermission() == PermissionStatus.granted;
    } else {
      return false;
    }
  }

  Future<bool> enableLocationService() async {
    return await LocationService.instance.enableLocationService();
  }

  Future<PermissionStatus> requestLocationPermission() async {
    return await LocationService.instance.requestLocationPermission();
  }

  Future<bool> enableBackgroundMode() async {
    return await LocationService.instance.enableBackgroundMode();
  }

  Future<LocationData?> getCurrentUserLocation() async {
    return await LocationService.instance.getLocation();
  }
}

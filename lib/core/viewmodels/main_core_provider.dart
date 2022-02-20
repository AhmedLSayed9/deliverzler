import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:deliverzler/authentication/models/user_model.dart';
import 'package:deliverzler/authentication/repos/auth_repo.dart';
import 'package:deliverzler/authentication/repos/user_repo.dart';
import 'package:deliverzler/core/errors/failures.dart';
import 'package:deliverzler/core/services/init_services/firebase_messaging_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:deliverzler/core/services/location_service.dart';

final mainCoreProvider =
    Provider<MainCoreProvider>((ref) => MainCoreProvider(ref));

class MainCoreProvider {
  MainCoreProvider(this.ref) {
    _userRepo = ref.read(userRepoProvider);
    _authRepo = ref.read(authRepoProvider);
  }

  final Ref ref;
  late UserRepo _userRepo;
  late AuthRepo _authRepo;

  ///User module methods
  String? getCurrentUserAuthUid() {
    if (FirebaseAuth.instance.currentUser != null) {
      return FirebaseAuth.instance.currentUser!.uid;
    }
    return null;
  }

  Future<UserModel?>? getUserFromFirebase({required String uid}) async {
    try {
      return await _userRepo.getUserDataFromFirebase(uid);
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  UserModel? getCurrentUser() {
    return _userRepo.userModel;
  }

  Future<Either<Failure, UserModel>> setUserInFirebase(
    UserModel userModel,
  ) async {
    return await _userRepo.setUserDataToFirebase(userModel);
  }

  setCurrentUser({required UserModel userModel}) {
    _userRepo.uid = userModel.uId;
    _userRepo.userModel = userModel;
  }

  Future logoutUser() async {
    await _authRepo.signOut();
    await FirebaseMessagingService.instance
        .unsubscribeFromTopic(topic: 'general');
    await _userRepo.clearUserLocalData();
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

  Future initLocationSettings({
    LocationAccuracy? accuracy,
    int? interval,
    double? distanceFilter,
  }) async {
    return await LocationService.instance.initSettings(
      accuracy: accuracy,
      interval: interval,
      distanceFilter: distanceFilter,
    );
  }

  Future<LocationData?> getCurrentUserLocation() async {
    return await LocationService.instance.getLocation();
  }
}

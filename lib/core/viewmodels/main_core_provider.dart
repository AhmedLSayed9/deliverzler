import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:deliverzler/authentication/models/user_model.dart';
import 'package:deliverzler/authentication/repos/auth_repo.dart';
import 'package:deliverzler/authentication/repos/user_repo.dart';
import 'package:deliverzler/core/errors/failures.dart';
import 'package:deliverzler/core/services/init_services/connectivity_service.dart';
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
    _userRepo = ref.watch(userRepoProvider);
    _authRepo = ref.watch(authRepoProvider);
  }

  final Ref ref;
  late UserRepo _userRepo;
  late AuthRepo _authRepo;

  ///User module methods
  Future<bool> checkValidAuth() async {
    final _uid = getCurrentUserAuthUid();
    if (_uid != null) {
      return await validateAuth(_uid);
    } else {
      return false;
    }
  }

  String? getCurrentUserAuthUid() {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  Future<bool> validateAuth(String uid) async {
    final _result = await _userRepo.getUserData(uid);
    return _result.fold(
      (failure) {
        debugPrint(failure?.message);
        logoutUser();
        return false;
      },
      (userModel) {
        if (userModel != null) {
          return true;
        } else {
          logoutUser();
          return false;
        }
      },
    );
  }

  Future<Either<Failure?, bool>> setUserToFirebase(UserModel userModel) async {
    final _result = await _userRepo.getUserData(userModel.uId);
    return await _result.fold(
      (failure) {
        return Left(failure);
      },
      (userData) async {
        if (userData == null) {
          return _userRepo.setUserData(userModel);
        } else {
          return const Right(true);
        }
      },
    );
  }

  Future logoutUser() async {
    await _userRepo.clearUserLocalData();
    await _authRepo.signOut();
    await FirebaseMessagingService.instance
        .unsubscribeFromTopic(topic: 'general');
  }

  ///Location module methods
  Future<bool> enableLocationAndRequestPermission() async {
    bool locationServiceEnabled = await enableLocationService();
    if (locationServiceEnabled) {
      return await requestLocationPermission();
    } else {
      return false;
    }
  }

  Future<bool> enableLocationService() async {
    return await LocationService.instance.enableLocationService();
  }

  Future<bool> requestLocationPermission() async {
    return await LocationService.instance.requestLocationPermission() ==
        PermissionStatus.granted;
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

  Future<bool> isAllLocationPermissionsRequired() async {
    return await LocationService.instance.isAllLocationPermissionsRequired();
  }

  ///Connection module methods
  Future<bool> isConnectedToInternet() async {
    return await ConnectivityService.instance.checkIfConnected();
  }
}

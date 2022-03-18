import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/authentication/models/user_model.dart';
import 'package:deliverzler/authentication/repos/user_repo.dart';
import 'package:deliverzler/core/services/image_selector.dart';
import 'package:deliverzler/core/utils/dialogs.dart';
import 'package:deliverzler/core/viewmodels/main_core_provider.dart';

final profileViewModel = ChangeNotifierProvider.autoDispose<ProfileViewModel>(
  (ref) => ProfileViewModel(ref),
);

class ProfileViewModel extends ChangeNotifier {
  ProfileViewModel(this.ref) {
    _mainCoreProvider = ref.read(mainCoreProvider);
    _userRepo = ref.read(userRepoProvider);
    userModel = _mainCoreProvider.getCurrentUser()!;
    profileNameController.text = userModel.name ?? '';
    profileMobileController.text = userModel.phone ?? '';
  }

  final Ref ref;
  late MainCoreProvider _mainCoreProvider;
  late UserRepo _userRepo;
  bool isLoading = false;
  bool _disposed = false;

  late UserModel userModel;
  TextEditingController profileNameController = TextEditingController();
  TextEditingController profileMobileController = TextEditingController();

  Future updateProfile() async {
    isLoading = true;
    notifyListeners();
    final _result = await _userRepo.updateUserData(
      _userRepo.userModel!.copyWith(
        name: profileNameController.text,
        phone: profileMobileController.text,
      ),
    );
    await _result.fold(
      (failure) {
        AppDialogs.showErrorDialog(message: failure?.message);
      },
      (isSet) async {
        if (isSet) {
          userModel = _mainCoreProvider.getCurrentUser()!;
        }
      },
    );
    isLoading = false;
    notifyListeners();
  }

  Future updateProfileImage({required bool fromCamera}) async {
    final _pickedFile = await ImageSelector.instance.pickImage(
      fromCamera: fromCamera,
    );
    if (_pickedFile != null) {
      updateFirebaseImage(_pickedFile);
    }
  }

  updateFirebaseImage(File? image) async {
    isLoading = true;
    notifyListeners();
    final _result = await _userRepo.updateUserImage(image);
    await _result.fold(
      (failure) {
        AppDialogs.showErrorDialog(message: failure?.message);
      },
      (isSet) async {
        if (isSet) {
          userModel = _mainCoreProvider.getCurrentUser()!;
        }
      },
    );
    isLoading = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    profileNameController.dispose();
    profileMobileController.dispose();
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}

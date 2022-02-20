import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/authentication/models/user_model.dart';
import 'package:deliverzler/authentication/repos/user_repo.dart';
import 'package:deliverzler/core/services/image_selector.dart';
import 'package:deliverzler/core/utils/dialogs.dart';
import 'package:deliverzler/core/utils/validators.dart';
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

  String? Function(String?)? validateName() {
    return Validators.instance.validateName();
  }

  String? Function(String?)? validateMobile() {
    return Validators.instance.validateMobileNumber();
  }

  Future updateProfile() async {
    isLoading = true;
    notifyListeners();
    try {
      await _userRepo.updateUserName(name: profileNameController.text);
      await _userRepo.updateUserPhone(phone: profileMobileController.text);
      userModel = _mainCoreProvider.getCurrentUser()!;
    } catch (e) {
      debugPrint(e.toString());
      AppDialogs.showDefaultErrorDialog();
    }
    isLoading = false;
    notifyListeners();
  }

  Future updateProfileImage({required bool fromCamera}) async {
    final _pickedFile = await ImageSelector.instance.pickImage(
      fromCamera: fromCamera,
    );
    if (_pickedFile != null) {
      uploadImageToFirebase(_pickedFile);
    }
  }

  uploadImageToFirebase(File? image) async {
    isLoading = true;
    notifyListeners();
    try {
      await _userRepo.updateUserImage(imageFile: image);
      userModel = _mainCoreProvider.getCurrentUser()!;
    } catch (e) {
      debugPrint(e.toString());
      AppDialogs.showDefaultErrorDialog();
    }
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

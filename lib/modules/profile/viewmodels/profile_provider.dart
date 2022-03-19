import 'dart:io';

import 'package:deliverzler/authentication/repos/user_repo.dart';
import 'package:deliverzler/core/services/image_selector.dart';
import 'package:deliverzler/core/utils/dialogs.dart';
import 'package:deliverzler/modules/profile/viewmodels/profile_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final profileProvider =
    StateNotifierProvider.autoDispose<ProfileProvider, ProfileState>((ref) {
  return ProfileProvider(ref);
});

class ProfileProvider extends StateNotifier<ProfileState> {
  ProfileProvider(this.ref) : super(const ProfileState.available()) {
    _userRepo = ref.read(userRepoProvider);
  }

  final Ref ref;
  late UserRepo _userRepo;

  Future updateProfile({
    required String name,
    required String mobile,
  }) async {
    state = const ProfileState.loading();
    final _result = await _userRepo.updateUserData(
      _userRepo.userModel!.copyWith(
        name: name,
        phone: mobile,
      ),
    );
    await _result.fold(
      (failure) {
        AppDialogs.showErrorDialog(message: failure?.message);
        state = ProfileState.error(errorText: failure?.message);
      },
      (isSet) async {
        if (isSet) {
          state = const ProfileState.available();
        }
      },
    );
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
    state = const ProfileState.loading();
    final _result = await _userRepo.updateUserImage(image);
    await _result.fold(
      (failure) {
        AppDialogs.showErrorDialog(message: failure?.message);
        state = ProfileState.error(errorText: failure?.message);
      },
      (isSet) async {
        if (isSet) {
          state = const ProfileState.available();
        }
      },
    );
  }
}

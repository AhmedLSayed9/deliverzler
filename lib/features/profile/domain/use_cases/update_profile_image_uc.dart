import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/domain/use_cases/use_case_base.dart';
import '../../data/repos/profile_repo.dart';
import '../repos/i_profile_repo.dart';

part 'update_profile_image_uc.g.dart';

@Riverpod(keepAlive: true)
UpdateProfileImageUC updateProfileImageUC(UpdateProfileImageUCRef ref) {
  return UpdateProfileImageUC(
    profileRepo: ref.watch(profileRepoProvider),
  );
}

class UpdateProfileImageUC implements UseCaseBase<String, File> {
  UpdateProfileImageUC({required this.profileRepo});

  final IProfileRepo profileRepo;

  @override
  Future<String> call(File imageFile) async {
    final imageUrl = await profileRepo.uploadProfileImage(imageFile);
    return await updateProfileImage(imageUrl);
  }

  Future<String> updateProfileImage(String imageUrl) async {
    await profileRepo.updateProfileImage(imageUrl);
    return imageUrl;
  }
}

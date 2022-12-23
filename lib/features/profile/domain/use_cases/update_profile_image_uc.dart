import 'dart:io';

import 'package:deliverzler/core/domain/use_cases/use_case_base.dart';
import 'package:deliverzler/features/profile/data/repos/profile_repo.dart';
import 'package:deliverzler/features/profile/domain/repos/i_profile_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final updateProfileImageUCProvider = Provider(
  (ref) => UpdateProfileImageUC(
    profileRepo: ref.watch(profileRepoProvider),
  ),
);

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

import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/core/domain/use_cases/use_case_base.dart';
import 'package:deliverzler/features/profile/data/repos/profile_repo.dart';
import 'package:deliverzler/features/profile/domain/repos/i_profile_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_profile_data_uc.g.dart';

@Riverpod(keepAlive: true)
UpdateProfileDataUC updateProfileDataUC(UpdateProfileDataUCRef ref) {
  return UpdateProfileDataUC(
    profileRepo: ref.watch(profileRepoProvider),
  );
}

class UpdateProfileDataUC implements UseCaseBase<void, User> {
  UpdateProfileDataUC({required this.profileRepo});

  final IProfileRepo profileRepo;

  @override
  Future<void> call(User user) async {
    return await profileRepo.updateProfileData(user);
  }
}

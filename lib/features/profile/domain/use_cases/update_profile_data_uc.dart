

import '../../../../auth/domain/entities/user.dart';
import '../../../../core/domain/use_cases/use_case_base.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../data/repos/profile_repo.dart';
import '../repos/i_profile_repo.dart';

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

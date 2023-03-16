import 'dart:io';

import '../../../../core/data/local/image_picker_caller/i_image_picker_caller.dart';
import '../../../../core/domain/use_cases/use_case_base.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../data/repos/profile_repo.dart';
import '../repos/i_profile_repo.dart';

part 'pick_profile_image_uc.g.dart';

@Riverpod(keepAlive: true)
PickProfileImageUC pickProfileImageUC(PickProfileImageUCRef ref) {
  return PickProfileImageUC(
    profileRepo: ref.watch(profileRepoProvider),
  );
}

class PickProfileImageUC implements UseCaseBase<File, PickSource> {
  PickProfileImageUC({required this.profileRepo});

  final IProfileRepo profileRepo;

  @override
  Future<File> call(PickSource pickSource) async {
    return await profileRepo.pickProfileImage(pickSource);
  }
}

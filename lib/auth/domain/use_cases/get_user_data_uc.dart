import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/domain/use_cases/use_case_base.dart';
import '../../data/repos/auth_repo.dart';
import '../entities/user.dart';
import '../repos/i_auth_repo.dart';

part 'get_user_data_uc.g.dart';

@Riverpod(keepAlive: true)
GetUserDataUC getUserDataUC(GetUserDataUCRef ref) {
  return GetUserDataUC(
    authRepo: ref.watch(authRepoProvider),
  );
}

class GetUserDataUC implements UseCaseBase<User, String> {
  GetUserDataUC({required this.authRepo});

  final IAuthRepo authRepo;

  @override
  Future<User> call(String uid) async {
    return await authRepo.getUserData(uid);
  }
}

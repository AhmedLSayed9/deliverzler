

import '../../../core/domain/use_cases/use_case_base.dart';
import '../../../core/presentation/utils/riverpod_framework.dart';
import '../../data/repos/auth_repo.dart';
import '../entities/user.dart';
import '../repos/i_auth_repo.dart';
import 'get_user_data_uc.dart';
import 'sign_out_uc.dart';

part 'check_auth_uc.g.dart';

@Riverpod(keepAlive: true)
CheckAuthUC checkAuthUC(CheckAuthUCRef ref) {
  return CheckAuthUC(
    ref,
    authRepo: ref.watch(authRepoProvider),
  );
}

class CheckAuthUC implements UseCaseNoParamsBase<User> {
  CheckAuthUC(this.ref, {required this.authRepo});

  final CheckAuthUCRef ref;
  final IAuthRepo authRepo;

  @override
  Future<User> call() async {
    final uid = await authRepo.getUserAuthUid();
    return await getUserData(uid);
  }

  Future<User> getUserData(String uid) async {
    try {
      final user = await ref.read(getUserDataUCProvider).call(uid);
      return user;
    } catch (err) {
      await ref.read(signOutUCProvider).call();
      rethrow;
    }
  }
}

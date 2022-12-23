import 'package:deliverzler/auth/data/repos/auth_repo.dart';
import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/auth/domain/repos/i_auth_repo.dart';
import 'package:deliverzler/core/domain/use_cases/use_case_base.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final getUserDataUCProvider = Provider(
  (ref) => GetUserDataUC(
    ref,
    authRepo: ref.watch(authRepoProvider),
  ),
);

class GetUserDataUC implements UseCaseBase<User, String> {
  GetUserDataUC(this.ref, {required this.authRepo});

  final Ref ref;
  final IAuthRepo authRepo;

  @override
  Future<User> call(String uid) async {
    return await authRepo.getUserData(uid);
  }
}

import 'package:deliverzler/auth/data/repos/auth_repo.dart';
import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/auth/domain/repos/i_auth_repo.dart';
import 'package:deliverzler/core/domain/use_cases/use_case_base.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//This is no longer needed..
//as user doc should be created at Firestore when registering the user.
final setUserDataUCProvider = Provider(
  (ref) => SetUserDataUC(
    ref,
    authRepo: ref.watch(authRepoProvider),
  ),
);

class SetUserDataUC implements UseCaseBase<User, User> {
  SetUserDataUC(this.ref, {required this.authRepo});

  final Ref ref;
  final IAuthRepo authRepo;

  @override
  Future<User> call(User user) async {
    await authRepo.setUserData(user);
    return user;
  }
}

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/domain/use_cases/use_case_base.dart';
import '../../data/repos/auth_repo.dart';
import '../entities/user.dart';
import '../repos/i_auth_repo.dart';

part 'set_user_data_uc.g.dart';

//This is no longer needed..
//as user doc should be created at Firestore when registering the user.

@Riverpod(keepAlive: true)
SetUserDataUC setUserDataUC(SetUserDataUCRef ref) {
  return SetUserDataUC(
    ref,
    authRepo: ref.watch(authRepoProvider),
  );
}

class SetUserDataUC implements UseCaseBase<User, User> {
  SetUserDataUC(this.ref, {required this.authRepo});

  final SetUserDataUCRef ref;
  final IAuthRepo authRepo;

  @override
  Future<User> call(User user) async {
    await authRepo.setUserData(user);
    return user;
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/domain/use_cases/use_case_base.dart';
import '../../../core/presentation/services/fcm_service/fcm_provider.dart';
import '../../../core/presentation/utils/riverpod_framework.dart';
import '../../data/repos/auth_repo.dart';
import '../entities/user.dart';
import '../repos/i_auth_repo.dart';
import 'get_user_data_uc.dart';

part 'sign_in_with_email_uc.freezed.dart';

part 'sign_in_with_email_uc.g.dart';

@Riverpod(keepAlive: true)
SignInWithEmailUC signInWithEmailUC(SignInWithEmailUCRef ref) {
  return SignInWithEmailUC(
    ref,
    authRepo: ref.watch(authRepoProvider),
  );
}

class SignInWithEmailUC implements UseCaseBase<User, SignInWithEmailParams> {
  SignInWithEmailUC(this.ref, {required this.authRepo});

  final SignInWithEmailUCRef ref;
  final IAuthRepo authRepo;

  @override
  Future<User> call(SignInWithEmailParams params) async {
    final userFromCredential = await authRepo.signInWithEmail(params);
    return await getUserData(userFromCredential.id);
  }

  Future<User> getUserData(String uid) async {
    final user = await ref.read(getUserDataUCProvider).call(uid);
    await ref.read(fcmProvider).subscribeToTopic('general');
    return user;
  }
}

@Freezed(toJson: true)
class SignInWithEmailParams with _$SignInWithEmailParams {
  const factory SignInWithEmailParams({
    required String email,
    required String password,
  }) = _SignInWithEmailParams;
}

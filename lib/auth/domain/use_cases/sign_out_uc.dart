import 'package:deliverzler/core/domain/use_cases/use_case_base.dart';
import 'package:deliverzler/auth/domain/repos/i_auth_repo.dart';
import 'package:deliverzler/auth/data/repos/auth_repo.dart';
import 'package:deliverzler/core/presentation/services/fcm_service/fcm_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final signOutUCProvider = Provider(
  (ref) => SignOutUC(
    ref,
    authRepo: ref.watch(authRepoProvider),
  ),
);

class SignOutUC implements UseCaseNoParamsBase<void> {
  SignOutUC(this.ref, {required this.authRepo});

  final Ref ref;
  final IAuthRepo authRepo;

  @override
  Future<void> call() async {
    await authRepo.signOut();
    await ref.read(fcmProvider).unsubscribeFromTopic('general');
  }
}

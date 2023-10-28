import '../../../core/infrastructure/services/fcm_service/fcm_provider.dart';
import '../../../core/presentation/utils/fp_framework.dart';
import '../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/sign_in_with_email.dart';
import '../../domain/user.dart';
import '../../infrastructure/repos/auth_repo.dart';
import 'auth_state_provider.dart';

part 'sign_in_provider.g.dart';

//Using [Option] to indicate idle(none)/success(some) states.
//This is a shorthand. You can use custom states using [freezed] instead.
@riverpod
class SignInState extends _$SignInState {
  @override
  FutureOr<Option<User>> build() => const None();

  Future<void> signIn(SignInWithEmail params) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final authRepo = ref.read(authRepoProvider);
      final userFromCredential = await authRepo.signInWithEmail(params);
      final user = await authRepo.getUserData(userFromCredential.id);
      await ref.read(fcmProvider).subscribeToTopic('general');

      ref.read(authStateProvider.notifier).authenticateUser(user);

      return Some(user);
    });
  }
}

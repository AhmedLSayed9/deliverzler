import '../../../core/presentation/providers/provider_utils.dart';
import '../../../core/presentation/services/fcm_service/fcm_provider.dart';
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
FutureOr<Option<User>> signInState(SignInStateRef ref) {
  final sub = ref.listen(authStateProvider.notifier, (prev, next) {});
  ref.listenSelf((previous, next) {
    next.whenData(
      (user) {
        if (user is Some<User>) {
          sub.read().authenticateUser(user.value);
        }
      },
    );
  });

  final event = ref.watch(signInWithEmailEventProvider);
  return event.match(
    () => const None(),
    (event) {
      return ref.watch(signInProvider(event).future).then((user) => Some(user));
    },
  );
}

@riverpod
class SignInWithEmailEvent extends _$SignInWithEmailEvent with NotifierUpdate {
  @override
  Option<Event<SignInWithEmail>> build() => const None();
}

@riverpod
Future<User> signIn(
  SignInRef ref,
  Event<SignInWithEmail> event,
) async {
  final authRepo = ref.watch(authRepoProvider);
  final userFromCredential = await authRepo.signInWithEmail(event.arg);
  final user = await authRepo.getUserData(userFromCredential.id);
  await ref.watch(fcmProvider).subscribeToTopic('general');
  return user;
}

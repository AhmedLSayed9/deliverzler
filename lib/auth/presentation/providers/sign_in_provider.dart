import '../../../core/presentation/providers/provider_utils.dart';
import '../../../core/presentation/utils/fp_framework.dart';
import '../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/entities/user.dart';
import '../../domain/use_cases/sign_in_with_email_uc.dart';
import 'auth_state_provider.dart';

part 'sign_in_provider.g.dart';

//Using [Option] to indicate idle(none)/success(some) states.
//This is a shorthand. You can use custom states using [freezed] instead.
@riverpod
AsyncValue<Option<User>> signInState(SignInStateRef ref) {
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
    () => const AsyncData(None()),
    (event) {
      return ref
          .watch(signInWithEmailProvider(event))
          .whenData((user) => Some(user));
    },
  );
}

@riverpod
class SignInWithEmailEvent extends _$SignInWithEmailEvent with NotifierUpdate {
  @override
  Option<Event<SignInWithEmailParams>> build() => const None();
}

@riverpod
Future<User> signInWithEmail(
  SignInWithEmailRef ref,
  Event<SignInWithEmailParams> event,
) async {
  return ref.watch(signInWithEmailUCProvider).call(event.arg);
}

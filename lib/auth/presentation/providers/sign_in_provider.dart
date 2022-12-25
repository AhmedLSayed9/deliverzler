import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/auth/domain/use_cases/sign_in_with_email_uc.dart';
import 'package:deliverzler/auth/presentation/providers/auth_state_provider.dart';
import 'package:deliverzler/core/presentation/utils/functional.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_provider.g.dart';

//Using [Option] to indicate initial(none)/success(some) states.
//This is a shorthand. You can use custom states using [freezed] instead.
@riverpod
AsyncValue<Option<User>> signInState(SignInStateRef ref) {
  ref.listenSelf((previous, next) {
    next.whenOrNull(
      //If the call emitted an error state, signInWithEmailParamsProvider will be invalidated which will
      //lead to invalidating signInWithEmailProvider too, so that you'll be able to retry the api call again.
      error: (_, __) => ref.invalidate(signInWithEmailParamsProvider),
      data: (user) {
        if (user is Some<User>) {
          ref
              .read(authStateControllerProvider.notifier)
              .authenticateUser(user.value);
        }
      },
    );
  });

  final params = ref.watch(signInWithEmailParamsProvider);
  return params.match(
    () => const AsyncData(None()),
    (params) {
      return ref
          .watch(signInWithEmailProvider(params))
          .whenData((user) => Some(user));
    },
  );
}

final signInWithEmailParamsProvider =
    StateProvider.autoDispose<Option<SignInWithEmailParams>>((ref) {
  return const None();
});

@riverpod
Future<User> signInWithEmail(
  SignInWithEmailRef ref,
  SignInWithEmailParams params,
) async {
  return ref.watch(signInWithEmailUCProvider).call(params);
}

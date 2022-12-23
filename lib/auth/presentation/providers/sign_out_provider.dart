import 'package:deliverzler/auth/domain/use_cases/sign_out_uc.dart';
import 'package:deliverzler/auth/presentation/providers/auth_state_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum SignOutState {
  initial,
  success,
}

final signOutStateProvider =
    Provider.autoDispose<AsyncValue<SignOutState>>((ref) {
  ref.listenSelf((previous, next) {
    next.whenOrNull(
      error: (_, __) => ref.invalidate(signOutTriggerProvider),
      data: (state) {
        if (state == SignOutState.success) {
          ref.read(authStateProvider.notifier).unAuthenticateUser();
        }
      },
    );
  });

  if (ref.watch(signOutTriggerProvider)) {
    return ref.watch(signOutProvider).whenData((_) => SignOutState.success);
  }
  return const AsyncData(SignOutState.initial);
});

final signOutTriggerProvider = StateProvider.autoDispose<bool>((ref) => false);

final signOutProvider = FutureProvider.autoDispose<void>((ref) async {
  return ref.watch(signOutUCProvider).call();
});

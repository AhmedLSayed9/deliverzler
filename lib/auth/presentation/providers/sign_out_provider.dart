import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/presentation/providers/provider_utils.dart';
import '../../domain/use_cases/sign_out_uc.dart';
import 'auth_state_provider.dart';

part 'sign_out_provider.g.dart';

enum SignOutState {
  initial,
  success,
}

@riverpod
AsyncValue<SignOutState> signOutState(SignOutStateRef ref) {
  ref.listenSelf((previous, next) {
    next.whenOrNull(
      error: (_, __) => ref.invalidate(signOutEventProvider),
      data: (state) {
        if (state == SignOutState.success) {
          ref.read(authStateControllerProvider.notifier).unAuthenticateUser();
        }
      },
    );
  });

  if (ref.watch(signOutEventProvider)) {
    return ref.watch(signOutProvider).whenData((_) => SignOutState.success);
  }
  return const AsyncData(SignOutState.initial);
}

@riverpod
class SignOutEvent extends _$SignOutEvent with NotifierUpdate {
  @override
  bool build() => false;
}

@riverpod
Future<void> signOut(SignOutRef ref) async {
  return ref.watch(signOutUCProvider).call();
}

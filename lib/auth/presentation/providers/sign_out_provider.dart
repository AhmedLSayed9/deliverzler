import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/presentation/providers/provider_utils.dart';
import '../../../core/presentation/utils/functional.dart';
import '../../domain/use_cases/sign_out_uc.dart';
import 'auth_state_provider.dart';

part 'sign_out_provider.g.dart';

enum SignOutState {
  idle,
  success,
}

@riverpod
AsyncValue<SignOutState> signOutState(SignOutStateRef ref) {
  final sub = ref.listen(authStateProvider.notifier, (prev, next) {});
  ref.listenSelf((previous, next) {
    next.whenData(
      (state) {
        if (state == SignOutState.success) {
          sub.read().unAuthenticateUser();
        }
      },
    );
  });

  final event = ref.watch(signOutEventProvider);
  return event.match(
    () => const AsyncData(SignOutState.idle),
    (event) {
      return ref
          .watch(signOutProvider(event))
          .whenData((_) => SignOutState.success);
    },
  );
}

@riverpod
class SignOutEvent extends _$SignOutEvent with NotifierUpdate {
  @override
  Option<Event<void>> build() => const None();
}

@riverpod
Future<void> signOut(
  SignOutRef ref,
  Event<void> event,
) async {
  return ref.watch(signOutUCProvider).call();
}

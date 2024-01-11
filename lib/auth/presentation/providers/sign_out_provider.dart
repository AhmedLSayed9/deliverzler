import 'dart:async';

import '../../../core/infrastructure/notification/notification_service.dart';
import '../../../core/presentation/extensions/future_extensions.dart';
import '../../../core/presentation/utils/fp_framework.dart';
import '../../../core/presentation/utils/riverpod_framework.dart';
import '../../infrastructure/repos/auth_repo.dart';
import 'auth_state_provider.dart';

part 'sign_out_provider.g.dart';

@riverpod
class SignOutState extends _$SignOutState {
  @override
  FutureOr<Option<Unit>> build() => const None();

  Future<void> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      unawaited(ref.read(authRepoProvider).signOut().suppressError());
      unawaited(
        ref.read(notificationServiceProvider).unsubscribeFromTopic('general').suppressError(),
      );

      ref.read(authStateProvider.notifier).unAuthenticateUser();

      return const Some(unit);
    });
  }
}

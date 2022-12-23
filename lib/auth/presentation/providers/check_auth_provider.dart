import 'dart:async';

import '../../../auth/domain/user.dart';
import '../../../auth/infrastructure/repos/auth_repo.dart';
import '../../../auth/presentation/providers/auth_state_provider.dart';
import '../../../auth/presentation/providers/sign_out_provider.dart';
import '../../../core/presentation/utils/event.dart';
import '../../../core/presentation/utils/fp_framework.dart';
import '../../../core/presentation/utils/riverpod_framework.dart';

part 'check_auth_provider.g.dart';

@riverpod
Future<User> checkAuth(CheckAuthRef ref) async {
  final sub = ref.listen(authStateProvider.notifier, (prev, next) {});
  ref.listenSelf((previous, next) {
    next.whenOrNull(
      data: (user) => sub.read().authenticateUser(user),
      error: (err, st) => ref.read(signOutProvider(const Event(arg: unit))),
    );
  });

  final uid = await ref.watch(authRepoProvider).getUserAuthUid();
  return await ref.watch(authRepoProvider).getUserData(uid);
}

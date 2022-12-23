import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/auth/presentation/providers/user_provider.dart';
import 'package:deliverzler/features/profile/domain/use_cases/update_profile_data_uc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//Using [Option] to indicate initial(none)/success(some) states.
//This is a shorthand. You can use custom states using [freezed] instead.
final updateProfileDataStateProvider =
    Provider.autoDispose<AsyncValue<Option<User>>>((ref) {
  ref.listenSelf((previous, next) {
    next.whenOrNull(
      error: (_, __) => ref.invalidate(updateProfileDataParamsProvider),
      data: (user) {
        if (user is Some<User>) {
          ref.read(userProvider.notifier).setUser(user.value);
          ref.invalidate(updateProfileDataParamsProvider);
        }
      },
    );
  });

  final params = ref.watch(updateProfileDataParamsProvider);
  return params.match(
    () => const AsyncData(None()),
    (params) {
      return ref
          .watch(updateProfileDataProvider(params))
          .whenData((user) => Some(user));
    },
  );
});

final updateProfileDataParamsProvider =
    StateProvider.autoDispose<Option<User>>((ref) {
  return const None();
});

final updateProfileDataProvider =
    FutureProvider.autoDispose.family<User, User>((ref, user) async {
  await ref.watch(updateProfileDataUCProvider).call(user);
  return user;
});

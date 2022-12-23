import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/auth/presentation/providers/user_provider.dart';
import 'package:deliverzler/features/profile/domain/use_cases/update_profile_data_uc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_profile_data_provider.g.dart';

//Using [Option] to indicate initial(none)/success(some) states.
//This is a shorthand. You can use custom states using [freezed] instead.
@riverpod
AsyncValue<Option<User>> updateProfileDataState(UpdateProfileDataStateRef ref) {
  ref.listenSelf((previous, next) {
    next.whenOrNull(
      error: (_, __) => ref.invalidate(updateProfileDataParamsProvider),
      data: (user) {
        if (user is Some<User>) {
          ref.read(userControllerProvider.notifier).setUser(user.value);
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
}

final updateProfileDataParamsProvider =
    StateProvider.autoDispose<Option<User>>((ref) {
  return const None();
});

@riverpod
Future<User> updateProfileData(
  UpdateProfileDataRef ref,
  User user,
) async {
  await ref.watch(updateProfileDataUCProvider).call(user);
  return user;
}

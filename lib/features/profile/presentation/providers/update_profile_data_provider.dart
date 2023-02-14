import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../auth/domain/entities/user.dart';
import '../../../../auth/presentation/providers/user_provider.dart';
import '../../../../core/presentation/providers/provider_utils.dart';
import '../../../../core/presentation/utils/functional.dart';
import '../../domain/use_cases/update_profile_data_uc.dart';

part 'update_profile_data_provider.g.dart';

//Using [Option] to indicate idle(none)/success(some) states.
//This is a shorthand. You can use custom states using [freezed] instead.
@riverpod
AsyncValue<Option<User>> updateProfileDataState(UpdateProfileDataStateRef ref) {
  ref.listenSelf((previous, next) {
    next.whenOrNull(
      error: (_, __) => ref.invalidate(updateProfileDataEventProvider),
      data: (user) {
        if (user is Some<User>) {
          ref.read(userControllerProvider.notifier).setUser(user.value);
          ref.invalidate(updateProfileDataEventProvider);
        }
      },
    );
  });

  final event = ref.watch(updateProfileDataEventProvider);
  return event.match(
    () => const AsyncData(None()),
    (params) {
      return ref
          .watch(updateProfileDataProvider(params))
          .whenData((user) => Some(user));
    },
  );
}

@riverpod
class UpdateProfileDataEvent extends _$UpdateProfileDataEvent
    with NotifierUpdate {
  @override
  Option<User> build() => const None();
}

@riverpod
Future<User> updateProfileData(
  UpdateProfileDataRef ref,
  User user,
) async {
  await ref.watch(updateProfileDataUCProvider).call(user);
  return user;
}

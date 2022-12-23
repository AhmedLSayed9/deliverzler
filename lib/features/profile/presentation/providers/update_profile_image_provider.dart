import 'dart:io';

import '../../../../auth/presentation/providers/auth_state_provider.dart';
import '../../../../core/presentation/providers/provider_utils.dart';
import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../infrastructure/repos/profile_repo.dart';

part 'update_profile_image_provider.g.dart';

//Using [Option] to indicate idle(none)/success(some) states.
//This is a shorthand. You can use custom states using [freezed] instead.
@riverpod
AsyncValue<Option<String>> updateProfileImageState(
    UpdateProfileImageStateRef ref) {
  final sub = ref.listen(authStateProvider.notifier, (prev, next) {});
  ref.listenSelf((previous, next) {
    next.whenData(
      (imageUrl) {
        if (imageUrl is Some<String>) {
          sub.read().updateUserImage(imageUrl.value);
        }
      },
    );
  });

  final event = ref.watch(updateProfileImageEventProvider);
  return event.match(
    () => const AsyncData(None()),
    (event) {
      return ref
          .watch(updateProfileImageProvider(event))
          .whenData((imageUrl) => Some(imageUrl));
    },
  );
}

@riverpod
class UpdateProfileImageEvent extends _$UpdateProfileImageEvent
    with NotifierUpdate {
  @override
  Option<Event<File>> build() => const None();
}

@riverpod
Future<String> updateProfileImage(
  UpdateProfileImageRef ref,
  Event<File> event,
) async {
  final profileRepo = ref.watch(profileRepoProvider);
  final imageUrl = await profileRepo.uploadProfileImage(event.arg);
  await profileRepo.updateProfileImage(imageUrl);
  return imageUrl;
}

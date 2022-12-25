import 'dart:io';

import 'package:deliverzler/auth/presentation/providers/user_provider.dart';
import 'package:deliverzler/features/profile/domain/use_cases/update_profile_image_uc.dart';
import 'package:deliverzler/core/presentation/utils/functional.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_profile_image_provider.g.dart';

//Using [Option] to indicate initial(none)/success(some) states.
//This is a shorthand. You can use custom states using [freezed] instead.
@riverpod
AsyncValue<Option<String>> updateProfileImageState(
    UpdateProfileImageStateRef ref) {
  ref.listenSelf((previous, next) {
    next.whenOrNull(
      error: (_, __) => ref.invalidate(selectedProfileImageProvider),
      data: (imageUrl) {
        if (imageUrl is Some<String>) {
          ref
              .read(userControllerProvider.notifier)
              .updateUserImage(imageUrl.value);
          ref.invalidate(selectedProfileImageProvider);
        }
      },
    );
  });

  final selectedImage = ref.watch(selectedProfileImageProvider);
  return selectedImage.match(
    () => const AsyncData(None()),
    (image) {
      return ref
          .watch(updateProfileImageProvider(image))
          .whenData((imageUrl) => Some(imageUrl));
    },
  );
}

final selectedProfileImageProvider =
    StateProvider.autoDispose<Option<File>>((ref) {
  return const None();
});

@riverpod
Future<String> updateProfileImage(
  UpdateProfileImageRef ref,
  File imageFile,
) async {
  return ref.watch(updateProfileImageUCProvider).call(imageFile);
}

import 'dart:io';

import 'package:deliverzler/auth/presentation/providers/user_provider.dart';
import 'package:deliverzler/features/profile/domain/use_cases/update_profile_image_uc.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//Using [Option] to indicate initial(none)/success(some) states.
//This is a shorthand. You can use custom states using [freezed] instead.
final updateProfileImageStateProvider =
    Provider.autoDispose<AsyncValue<Option<String>>>((ref) {
  ref.listenSelf((previous, next) {
    next.whenOrNull(
      error: (_, __) => ref.invalidate(selectedProfileImageProvider),
      data: (imageUrl) {
        if (imageUrl is Some<String>) {
          ref.read(userProvider.notifier).updateUserImage(imageUrl.value);
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
});

final selectedProfileImageProvider =
    StateProvider.autoDispose<Option<File>>((ref) {
  return const None();
});

final updateProfileImageProvider =
    FutureProvider.autoDispose.family<String, File>((ref, imageFile) async {
  return ref.watch(updateProfileImageUCProvider).call(imageFile);
});

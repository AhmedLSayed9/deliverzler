import 'dart:io';

import '../../../../auth/presentation/providers/auth_state_provider.dart';
import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../infrastructure/repos/profile_repo.dart';

part 'update_profile_image_provider.g.dart';

//Using [Option] to indicate idle(none)/success(some) states.
//This is a shorthand. You can use custom states using [freezed] instead.
@riverpod
class UpdateProfileImageState extends _$UpdateProfileImageState {
  @override
  FutureOr<Option<String>> build() => const None();

  Future<void> updateProfileImage(File params) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final profileRepo = ref.read(profileRepoProvider);
      final imageUrl = await profileRepo.uploadProfileImage(params);
      await profileRepo.updateProfileImage(imageUrl);

      ref.read(authStateProvider.notifier).updateUserImage(imageUrl);

      return Some(imageUrl);
    });
  }
}

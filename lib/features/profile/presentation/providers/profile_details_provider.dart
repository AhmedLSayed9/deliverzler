import '../../../../auth/presentation/providers/auth_state_provider.dart';
import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/profile_details.dart';
import '../../infrastructure/repos/profile_repo.dart';

part 'profile_details_provider.g.dart';

//Using [Option] to indicate idle(none)/success(some) states.
//This is a shorthand. You can use custom states using [freezed] instead.
@riverpod
class ProfileDetailsState extends _$ProfileDetailsState {
  @override
  FutureOr<Option<ProfileDetails>> build() => const None();

  Future<void> updateProfile(ProfileDetails params) async {
    state = const AsyncLoading();

    state = await AsyncValue.guard(() async {
      await ref.read(profileRepoProvider).updateProfileData(params);

      ref.read(authStateProvider.notifier).updateUser(params);

      return Some(params);
    });
  }
}

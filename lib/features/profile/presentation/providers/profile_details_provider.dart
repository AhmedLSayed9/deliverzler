import '../../../../auth/presentation/providers/auth_state_provider.dart';
import '../../../../core/presentation/providers/provider_utils.dart';
import '../../../../core/presentation/utils/fp_framework.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/profile_details.dart';
import '../../infrastructure/repos/profile_repo.dart';

part 'profile_details_provider.g.dart';

//Using [Option] to indicate idle(none)/success(some) states.
//This is a shorthand. You can use custom states using [freezed] instead.
@riverpod
FutureOr<Option<ProfileDetails>> profileDetailsState(
  ProfileDetailsStateRef ref,
) {
  final sub = ref.listen(authStateProvider.notifier, (prev, next) {});
  ref.listenSelf((previous, next) {
    next.whenData(
      (profileDetails) {
        if (profileDetails is Some<ProfileDetails>) {
          sub.read().updateUser(profileDetails.value);
        }
      },
    );
  });

  final event = ref.watch(profileDetailsEventProvider);
  return event.match(
    () => const None(),
    (event) {
      final profileDetails = event.arg;
      return ref
          .watch(profileRepoProvider)
          .updateProfileData(profileDetails)
          .then((_) => Some(profileDetails));
    },
  );
}

@riverpod
class ProfileDetailsEvent extends _$ProfileDetailsEvent with NotifierUpdate {
  @override
  Option<Event<ProfileDetails>> build() => const None();
}

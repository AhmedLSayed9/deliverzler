import '../../../core/presentation/utils/fp_framework.dart';
import '../../../core/presentation/utils/riverpod_framework.dart';
import '../../../features/profile/domain/value_objects.dart';
import '../../domain/user.dart';

part 'auth_state_provider.g.dart';

@Riverpod(keepAlive: true)
class AuthState extends _$AuthState {
  @override
  Option<User> build() => const None();

  void authenticateUser(User user) {
    state = Some(user);
  }

  void unAuthenticateUser() {
    state = const None();
  }

  void updateUser(ProfileDetails profileDetails) {
    state.fold(
      () {},
      (user) => state = Some(user.copyWithProfileDetails(profileDetails)),
    );
  }

  void updateUserImage(String imageUrl) {
    final currentUser = state;
    if (currentUser is Some<User>) {
      state = Some(currentUser.value.copyWith(image: imageUrl));
    }
  }
}

@riverpod
FutureOr<User> currentUserState(CurrentUserStateRef ref) {
  final user = ref.watch(authStateProvider);
  return user.match(() => ref.future, (user) => user);
}

@riverpod
User currentUser(CurrentUserRef ref) {
  return ref.watch(currentUserStateProvider).requireValue;
}

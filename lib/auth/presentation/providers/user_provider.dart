import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@riverpod
User currentUser(CurrentUserRef ref) {
  return ref.watch(userControllerProvider).match(
        () => throw Exception('userControllerProvider has not initialized'),
        (user) => user,
      );
}

@Riverpod(keepAlive: true)
class UserController extends _$UserController {
  @override
  Option<User> build() {
    return const None();
  }

  void setUser(User user) {
    state = Some(user);
  }

  void updateUserImage(String imageUrl) {
    final currentUser = state;
    if (currentUser is Some<User>) {
      state = Some(currentUser.value.copyWith(image: imageUrl));
    }
  }
}

import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentUserProvider = Provider.autoDispose<User>((ref) {
  return ref.watch(userProvider).match(
        () => throw Exception('userProvider has not initialized'),
        (user) => user,
      );
});

final userProvider =
    NotifierProvider<UserNotifier, Option<User>>(UserNotifier.new);

class UserNotifier extends Notifier<Option<User>> {
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

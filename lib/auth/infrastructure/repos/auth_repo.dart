import '../../../core/infrastructure/network/network_info.dart';
import '../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/sign_in_with_email.dart';
import '../../domain/user.dart';
import '../data_sources/auth_local_data_source.dart';
import '../data_sources/auth_remote_data_source.dart';
import '../dtos/user_dto.dart';

part 'auth_repo.g.dart';

@Riverpod(keepAlive: true)
AuthRepo authRepo(AuthRepoRef ref) {
  return AuthRepo(
    networkInfo: ref.watch(networkInfoProvider),
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
    localDataSource: ref.watch(authLocalDataSourceProvider),
  );
}

class AuthRepo {
  AuthRepo({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final NetworkInfo networkInfo;
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  Future<User> signInWithEmail(SignInWithEmail params) async {
    final userFromCredential = await remoteDataSource.signInWithEmail(params);
    return userFromCredential.toDomain();
  }

  Future<String> getUserAuthUid() async {
    final uid = await remoteDataSource.getUserAuthUid();
    return uid;
  }

  Future<User> getUserData(String uid) async {
    if (await networkInfo.hasInternetConnection) {
      final user = await remoteDataSource.getUserData(uid);
      try {
        await localDataSource.cacheUserData(user);
      } catch (_) {}
      return user.toDomain();
    } else {
      final user = await localDataSource.getUserData();
      return user.toDomain();
    }
  }

  /// This is no longer needed.
  /// as user doc should be created at Firestore when registering the user.
  Future<void> setUserData(User user) async {
    final userDto = UserDto.fromDomain(user);
    await remoteDataSource.setUserData(userDto);
    try {
      await localDataSource.cacheUserData(userDto);
    } catch (_) {}
  }

  Future<void> signOut() async {
    await remoteDataSource.signOut();
    try {
      await localDataSource.clearUserData();
    } catch (_) {}
  }
}

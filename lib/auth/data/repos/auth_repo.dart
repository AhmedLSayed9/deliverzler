import 'package:deliverzler/auth/data/data_sources/auth_local_data_source.dart';
import 'package:deliverzler/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:deliverzler/auth/data/models/user_model.dart';
import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/auth/domain/repos/i_auth_repo.dart';
import 'package:deliverzler/auth/domain/use_cases/sign_in_with_email_uc.dart';
import 'package:deliverzler/core/data/network/network_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repo.g.dart';

@Riverpod(keepAlive: true)
IAuthRepo authRepo(AuthRepoRef ref) {
  return AuthRepo(
    networkInfo: ref.watch(networkInfoProvider),
    remoteDataSource: ref.watch(authRemoteDataSourceProvider),
    localDataSource: ref.watch(authLocalDataSourceProvider),
  );
}

class AuthRepo implements IAuthRepo {
  AuthRepo({
    required this.networkInfo,
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final INetworkInfo networkInfo;
  final IAuthRemoteDataSource remoteDataSource;
  final IAuthLocalDataSource localDataSource;

  @override
  Future<User> signInWithEmail(SignInWithEmailParams params) async {
    final userFromCredential = await remoteDataSource.signInWithEmail(params);
    return userFromCredential;
  }

  @override
  Future<String> getUserAuthUid() async {
    final uid = await remoteDataSource.getUserAuthUid();
    return uid;
  }

  @override
  Future<User> getUserData(String uid) async {
    if (await networkInfo.hasInternetConnection) {
      final user = await remoteDataSource.getUserData(uid);
      try {
        await localDataSource.cacheUserData(user);
      } catch (_) {}
      return user;
    } else {
      final user = await localDataSource.getUserData();
      return user;
    }
  }

  @override
  Future<void> setUserData(User user) async {
    final userModel = UserModel.fromUser(user);
    await remoteDataSource.setUserData(userModel);
    try {
      await localDataSource.cacheUserData(userModel);
    } catch (_) {}
  }

  @override
  Future<void> signOut() async {
    await remoteDataSource.signOut();
    try {
      await localDataSource.clearUserData();
    } catch (_) {}
  }
}

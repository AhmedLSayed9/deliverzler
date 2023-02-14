import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/data/error/app_exception.dart';
import '../../../core/data/network/i_firebase_auth_caller.dart';
import '../../../core/data/network/i_firebase_firestore_caller.dart';
import '../../../core/data/network/main_api/api_callers/main_api_auth_caller.dart';
import '../../../core/data/network/main_api/api_callers/main_api_firestore_caller.dart';
import '../../domain/use_cases/sign_in_with_email_uc.dart';
import '../models/user_model.dart';

part 'auth_remote_data_source.g.dart';

abstract class IAuthRemoteDataSource {
  /// Calls the api endpoint.
  ///
  /// Throws a [ServerException] for all error codes.
  Future<UserModel> signInWithEmail(SignInWithEmailParams params);

  Future<String> getUserAuthUid();

  Future<UserModel> getUserData(String uid);

  Future<void> setUserData(UserModel userModel);

  Future<void> signOut();
}

@Riverpod(keepAlive: true)
IAuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  return AuthRemoteDataSource(
    ref,
    firebaseAuthCaller: ref.watch(mainApiAuthCallerProvider),
    firebaseFirestoreCaller: ref.watch(mainApiFirestoreCallerProvider),
  );
}

class AuthRemoteDataSource implements IAuthRemoteDataSource {
  AuthRemoteDataSource(
    this.ref, {
    required this.firebaseAuthCaller,
    required this.firebaseFirestoreCaller,
  });

  final AuthRemoteDataSourceRef ref;
  final IFirebaseAuthCaller firebaseAuthCaller;
  final IFirebaseFirestoreCaller firebaseFirestoreCaller;

  static const String usersCollectionPath = 'users';

  static String userDocPath(String uid) => '$usersCollectionPath/$uid';

  @override
  Future<UserModel> signInWithEmail(SignInWithEmailParams params) async {
    final userCredential = await firebaseAuthCaller.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
    return UserModel.fromUserCredential(userCredential.user!);
  }

  @override
  Future<String> getUserAuthUid() async {
    final currentUser = await firebaseAuthCaller.getCurrentUser();
    return currentUser.uid;
  }

  @override
  Future<UserModel> getUserData(String uid) async {
    final response =
        await firebaseFirestoreCaller.getData(path: userDocPath(uid));
    if (response.data() != null) {
      return UserModel.fromJson(response.data() as Map<String, dynamic>);
    } else {
      throw const ServerException(
        type: ServerExceptionType.notFound,
        message: 'User data not found.',
      );
    }
  }

  @override
  Future<void> setUserData(UserModel userModel) async {
    return await firebaseFirestoreCaller.setData(
      path: userDocPath(userModel.id),
      data: userModel.toJson(),
    );
  }

  @override
  Future<void> signOut() async {
    return await firebaseAuthCaller.signOut();
  }
}

import '../../../core/infrastructure/error/app_exception.dart';
import '../../../core/infrastructure/network/main_api/api_callers/firebase_auth_facade.dart';
import '../../../core/infrastructure/network/main_api/api_callers/firebase_firestore_facade.dart';
import '../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/sign_in_with_email.dart';
import '../dtos/user_dto.dart';

part 'auth_remote_data_source.g.dart';

@Riverpod(keepAlive: true)
AuthRemoteDataSource authRemoteDataSource(AuthRemoteDataSourceRef ref) {
  return AuthRemoteDataSource(
    ref,
    firebaseAuth: ref.watch(firebaseAuthFacadeProvider),
    firebaseFirestore: ref.watch(firebaseFirestoreFacadeProvider),
  );
}

class AuthRemoteDataSource {
  AuthRemoteDataSource(
    this.ref, {
    required this.firebaseAuth,
    required this.firebaseFirestore,
  });

  final AuthRemoteDataSourceRef ref;
  final FirebaseAuthFacade firebaseAuth;
  final FirebaseFirestoreFacade firebaseFirestore;

  static const String usersCollectionPath = 'users';

  static String userDocPath(String uid) => '$usersCollectionPath/$uid';

  Future<UserDto> signInWithEmail(SignInWithEmail params) async {
    final userCredential = await firebaseAuth.signInWithEmailAndPassword(
      email: params.email,
      password: params.password,
    );
    return UserDto.fromUserCredential(userCredential.user!);
  }

  Future<String> getUserAuthUid() async {
    final currentUser = await firebaseAuth.getCurrentUser();
    return currentUser.uid;
  }

  Future<UserDto> getUserData(String uid) async {
    final response = await firebaseFirestore.getData(path: userDocPath(uid));
    if (response.data() != null) {
      return UserDto.fromJson(response.data() as Map<String, dynamic>);
    } else {
      throw const ServerException(
        type: ServerExceptionType.notFound,
        message: 'User data not found.',
      );
    }
  }

  Future<void> setUserData(UserDto userDto) async {
    return await firebaseFirestore.setData(
      path: userDocPath(userDto.id),
      data: userDto.toJson(),
    );
  }

  Future<void> signOut() async {
    return await firebaseAuth.signOut();
  }
}

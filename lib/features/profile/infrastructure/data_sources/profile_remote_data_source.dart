import 'dart:io';

import '../../../../auth/presentation/providers/auth_state_provider.dart';
import '../../../../core/infrastructure/network/main_api/api_callers/firebase_firestorage_facade.dart';
import '../../../../core/infrastructure/network/main_api/api_callers/firebase_firestore_facade.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../dtos/profile_details_dto.dart';

part 'profile_remote_data_source.g.dart';

@Riverpod(keepAlive: true)
ProfileRemoteDataSource profileRemoteDataSource(
    ProfileRemoteDataSourceRef ref) {
  return ProfileRemoteDataSource(
    ref,
    firebaseFirestore: ref.watch(firebaseFirestoreFacadeProvider),
    firebaseStorage: ref.watch(firebaseStorageFacadeProvider),
  );
}

class ProfileRemoteDataSource {
  ProfileRemoteDataSource(
    this.ref, {
    required this.firebaseFirestore,
    required this.firebaseStorage,
  });

  final ProfileRemoteDataSourceRef ref;
  final FirebaseFirestoreFacade firebaseFirestore;
  final FirebaseStorageFacade firebaseStorage;

  static const String usersCollectionPath = 'users';

  static String userDocPath(String uid) => '$usersCollectionPath/$uid';

  static const String usersStorageFolderPath = 'users';

  static String userStorageFolderPath(String uid) =>
      '$usersStorageFolderPath/$uid';

  Future<String> uploadProfileImage(File imageFile) async {
    final uid = ref.read(currentUserProvider).id;
    final imageUrl = await firebaseStorage.uploadImage(
      //File name is always user's uid, to replace the file when updating it.
      path: '${userStorageFolderPath(uid)}/$uid',
      file: imageFile,
    );
    return imageUrl;
  }

  Future<void> updateProfileImage(String imageUrl) async {
    final uid = ref.read(currentUserProvider).id;
    return await firebaseFirestore.setData(
      path: userDocPath(uid),
      data: {'image': imageUrl},
      merge: true,
    );
  }

  Future<void> updateProfileData(ProfileDetailsDto params) async {
    final uid = ref.read(currentUserProvider).id;
    return await firebaseFirestore.setData(
      path: userDocPath(uid),
      data: params.toJson(),
      merge: true,
    );
  }
}

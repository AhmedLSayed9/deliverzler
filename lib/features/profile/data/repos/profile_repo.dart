import 'dart:io';

import 'package:deliverzler/auth/data/models/user_model.dart';
import 'package:deliverzler/auth/domain/entities/user.dart';
import 'package:deliverzler/core/data/local/image_picker_caller/i_image_picker_caller.dart';
import 'package:deliverzler/features/profile/data/data_sources/profile_local_data_source.dart';
import 'package:deliverzler/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:deliverzler/features/profile/domain/repos/i_profile_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileRepoProvider = Provider<IProfileRepo>(
  (ref) => ProfileRepo(
    remoteDataSource: ref.watch(profileRemoteDataSourceProvider),
    localDataSource: ref.watch(profileLocalDataSourceProvider),
  ),
);

class ProfileRepo implements IProfileRepo {
  ProfileRepo({required this.remoteDataSource, required this.localDataSource});

  final IProfileRemoteDataSource remoteDataSource;
  final IProfileLocalDataSource localDataSource;

  @override
  Future<File> pickProfileImage(PickSource pickSource) async {
    final pickedFile = await localDataSource.pickProfileImage(pickSource);
    return pickedFile;
  }

  @override
  Future<String> uploadProfileImage(File imageFile) async {
    final imageUrl = await remoteDataSource.uploadProfileImage(imageFile);
    return imageUrl;
  }

  //TODO: updated cached image
  @override
  Future<void> updateProfileImage(String imageUrl) async {
    await remoteDataSource.updateProfileImage(imageUrl);
  }

  //TODO: updated cached user data
  @override
  Future<void> updateProfileData(User user) async {
    final userModel = UserModel.fromUser(user);
    await remoteDataSource.updateProfileData(userModel);
  }
}

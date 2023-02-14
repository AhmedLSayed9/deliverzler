import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../auth/data/models/user_model.dart';
import '../../../../auth/domain/entities/user.dart';
import '../../../../core/data/local/image_picker_caller/i_image_picker_caller.dart';
import '../../domain/repos/i_profile_repo.dart';
import '../data_sources/profile_local_data_source.dart';
import '../data_sources/profile_remote_data_source.dart';

part 'profile_repo.g.dart';

@Riverpod(keepAlive: true)
IProfileRepo profileRepo(ProfileRepoRef ref) {
  return ProfileRepo(
    remoteDataSource: ref.watch(profileRemoteDataSourceProvider),
    localDataSource: ref.watch(profileLocalDataSourceProvider),
  );
}

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
    final userModel = UserModel.fromEntity(user);
    await remoteDataSource.updateProfileData(userModel);
  }
}

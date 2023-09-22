import 'dart:io';

import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/profile_details.dart';
import '../data_sources/profile_remote_data_source.dart';
import '../dtos/profile_details_dto.dart';

part 'profile_repo.g.dart';

@Riverpod(keepAlive: true)
ProfileRepo profileRepo(ProfileRepoRef ref) {
  return ProfileRepo(
    remoteDataSource: ref.watch(profileRemoteDataSourceProvider),
  );
}

class ProfileRepo {
  ProfileRepo({required this.remoteDataSource});

  final ProfileRemoteDataSource remoteDataSource;

  Future<String> uploadProfileImage(File imageFile) async {
    final imageUrl = await remoteDataSource.uploadProfileImage(imageFile);
    return imageUrl;
  }

  // TODO(Ahmed): updated cached image
  Future<void> updateProfileImage(String imageUrl) async {
    await remoteDataSource.updateProfileImage(imageUrl);
  }

  Future<void> updateProfileData(ProfileDetails params) async {
    final profileDto = ProfileDetailsDto.fromDomain(params);
    await remoteDataSource.updateProfileData(profileDto);
  }
}

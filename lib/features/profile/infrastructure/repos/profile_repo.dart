import 'dart:io';

import '../../../../core/infrastructure/local/image_picker_facade.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../domain/value_objects.dart';
import '../data_sources/profile_local_data_source.dart';
import '../data_sources/profile_remote_data_source.dart';
import '../dtos/profile_details_dto.dart';

part 'profile_repo.g.dart';

@Riverpod(keepAlive: true)
ProfileRepo profileRepo(ProfileRepoRef ref) {
  return ProfileRepo(
    remoteDataSource: ref.watch(profileRemoteDataSourceProvider),
    localDataSource: ref.watch(profileLocalDataSourceProvider),
  );
}

class ProfileRepo {
  ProfileRepo({required this.remoteDataSource, required this.localDataSource});

  final ProfileRemoteDataSource remoteDataSource;
  final ProfileLocalDataSource localDataSource;

  Future<File> pickProfileImage(PickSource pickSource) async {
    final pickedFile = await localDataSource.pickProfileImage(pickSource);
    return pickedFile;
  }

  Future<String> uploadProfileImage(File imageFile) async {
    final imageUrl = await remoteDataSource.uploadProfileImage(imageFile);
    return imageUrl;
  }

  //TODO: updated cached image
  Future<void> updateProfileImage(String imageUrl) async {
    await remoteDataSource.updateProfileImage(imageUrl);
  }

  Future<void> updateProfileData(ProfileDetails params) async {
    final profileDto = ProfileDetailsDto.fromDomain(params);
    await remoteDataSource.updateProfileData(profileDto);
  }
}

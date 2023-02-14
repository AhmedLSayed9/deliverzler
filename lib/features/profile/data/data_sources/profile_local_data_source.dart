import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/data/local/image_picker_caller/i_image_picker_caller.dart';
import '../../../../core/data/local/image_picker_caller/image_picker_caller.dart';

part 'profile_local_data_source.g.dart';

abstract class IProfileLocalDataSource {
  Future<File> pickProfileImage(PickSource pickSource);
}

@Riverpod(keepAlive: true)
IProfileLocalDataSource profileLocalDataSource(ProfileLocalDataSourceRef ref) {
  return ProfileLocalDataSource(
    imagePickerCaller: ref.watch(imagePickerCallerProvider),
  );
}

class ProfileLocalDataSource implements IProfileLocalDataSource {
  ProfileLocalDataSource({required this.imagePickerCaller});

  final IImagePickerCaller imagePickerCaller;

  @override
  Future<File> pickProfileImage(PickSource pickSource) async {
    return await imagePickerCaller.pickImage(
      pickSource: pickSource,
      maxHeight: 400,
      maxWidth: 400,
    );
  }
}

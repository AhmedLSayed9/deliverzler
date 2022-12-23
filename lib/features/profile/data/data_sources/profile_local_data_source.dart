import 'dart:io';

import 'package:deliverzler/core/data/local/image_picker_caller/i_image_picker_caller.dart';
import 'package:deliverzler/core/data/local/image_picker_caller/image_picker_caller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

abstract class IProfileLocalDataSource {
  Future<File> pickProfileImage(PickSource pickSource);
}

final profileLocalDataSourceProvider = Provider<IProfileLocalDataSource>(
  (ref) => ProfileLocalDataSource(
    imagePickerCaller: ref.watch(imagePickerCallerProvider),
  ),
);

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

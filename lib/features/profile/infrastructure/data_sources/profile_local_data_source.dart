import 'dart:io';

import '../../../../core/infrastructure/local/image_picker_facade.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';

part 'profile_local_data_source.g.dart';

@Riverpod(keepAlive: true)
ProfileLocalDataSource profileLocalDataSource(ProfileLocalDataSourceRef ref) {
  return ProfileLocalDataSource(
    imagePicker: ref.watch(imagePickerFacadeProvider),
  );
}

class ProfileLocalDataSource {
  ProfileLocalDataSource({required this.imagePicker});

  final ImagePickerFacade imagePicker;

  Future<File> pickProfileImage(PickSource pickSource) async {
    return await imagePicker.pickImage(
      pickSource: pickSource,
      maxHeight: 400,
      maxWidth: 400,
    );
  }
}

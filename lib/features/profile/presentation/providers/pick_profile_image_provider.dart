import 'dart:io';

import '../../../../core/infrastructure/local/image_picker_facade.dart';
import '../../../../core/presentation/utils/riverpod_framework.dart';
import '../../infrastructure/repos/profile_repo.dart';

part 'pick_profile_image_provider.g.dart';

@riverpod
Future<File> pickProfileImage(
  PickProfileImageRef ref,
  PickSource pickSource,
) async {
  return ref.watch(profileRepoProvider).pickProfileImage(pickSource);
}

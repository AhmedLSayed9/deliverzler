import 'dart:io';

import 'package:deliverzler/core/data/local/image_picker_caller/i_image_picker_caller.dart';
import 'package:deliverzler/features/profile/domain/use_cases/pick_profile_image_uc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pick_profile_image_provider.g.dart';

@riverpod
Future<File> pickProfileImage(
  PickProfileImageRef ref,
  PickSource pickSource,
) async {
  return ref.watch(pickProfileImageUCProvider)(pickSource);
}

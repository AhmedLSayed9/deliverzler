import 'dart:io';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/data/local/image_picker_caller/i_image_picker_caller.dart';
import '../../domain/use_cases/pick_profile_image_uc.dart';

part 'pick_profile_image_provider.g.dart';

@riverpod
Future<File> pickProfileImage(
  PickProfileImageRef ref,
  PickSource pickSource,
) async {
  return ref.watch(pickProfileImageUCProvider)(pickSource);
}

import 'dart:io';

import 'package:deliverzler/core/data/local/image_picker_caller/i_image_picker_caller.dart';
import 'package:deliverzler/features/profile/domain/use_cases/pick_profile_image_uc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final pickProfileImageProvider = FutureProvider.autoDispose
    .family<File, PickSource>((ref, pickSource) async {
  final imageFile = await ref.watch(pickProfileImageUCProvider)(pickSource);
  return imageFile;
});

import 'dart:io';

enum PickSource {
  camera,
  gallery,
}

abstract class IImagePickerCaller {
  Future<File> pickImage({
    required PickSource pickSource,
    double? maxHeight,
    double? maxWidth,
  });
}

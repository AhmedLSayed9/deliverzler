import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../error/app_exception.dart';
import '../extensions/local_error_extension.dart';
import 'i_image_picker_caller.dart';

part 'image_picker_caller.g.dart';

@Riverpod(keepAlive: true)
IImagePickerCaller imagePickerCaller(ImagePickerCallerRef ref) {
  return ImagePickerCaller(
    imagePicker: ImagePicker(),
  );
}

class ImagePickerCaller implements IImagePickerCaller {
  ImagePickerCaller({required this.imagePicker});

  final ImagePicker imagePicker;

  @override
  Future<File> pickImage({
    required PickSource pickSource,
    double? maxHeight,
    double? maxWidth,
  }) async {
    return await _tryCatchWrapper(
      () async {
        final pickedFile = await imagePicker.pickImage(
          source: pickSource == PickSource.camera
              ? ImageSource.camera
              : ImageSource.gallery,
          maxHeight: maxHeight,
          maxWidth: maxWidth,
        );
        if (pickedFile != null) {
          return File(pickedFile.path);
        } else {
          throw const CacheException(
            type: CacheExceptionType.general,
            message: "Couldn't Pick Image",
          );
        }
      },
    );
  }

  Future<T> _tryCatchWrapper<T>(Function body) async {
    try {
      return await body.call();
    } on Exception catch (e) {
      throw e.localErrorToCacheException();
    }
  }
}

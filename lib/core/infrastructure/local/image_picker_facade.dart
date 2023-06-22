import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../presentation/utils/riverpod_framework.dart';
import '../error/app_exception.dart';
import 'extensions/local_error_extension.dart';

part 'image_picker_facade.g.dart';

enum PickSource {
  camera,
  gallery,
}

@Riverpod(keepAlive: true)
ImagePickerFacade imagePickerFacade(ImagePickerFacadeRef ref) {
  return ImagePickerFacade(
    imagePicker: ImagePicker(),
  );
}

class ImagePickerFacade {
  ImagePickerFacade({required this.imagePicker});

  final ImagePicker imagePicker;

  Future<File> pickImage({
    required PickSource pickSource,
    double? maxHeight,
    double? maxWidth,
  }) async {
    return _errorHandler(
      () async {
        final pickedFile = await imagePicker.pickImage(
          source: pickSource == PickSource.camera ? ImageSource.camera : ImageSource.gallery,
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

  Future<T> _errorHandler<T>(Future<T> Function() body) async {
    try {
      return await body.call();
    } catch (e, st) {
      final error = e.localErrorToCacheException();
      throw Error.throwWithStackTrace(error, st);
    }
  }
}

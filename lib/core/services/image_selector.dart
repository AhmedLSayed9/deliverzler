import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:deliverzler/core/errors/exceptions.dart';
import 'package:deliverzler/core/errors/failures.dart';
import 'package:deliverzler/core/routing/navigation_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:deliverzler/core/styles/sizes.dart';

class ImageSelector {
  ImageSelector._();

  static final instance = ImageSelector._();

  static String? _appDocDirPath;

  Future<String> get appDocDir async {
    if (_appDocDirPath != null) return _appDocDirPath!;
    _appDocDirPath = await getAppDocDir();
    return _appDocDirPath!;
  }

  getAppDocDir() async {
    final _appDocDir = await getApplicationDocumentsDirectory();
    return _appDocDir.path;
  }

  Future<Either<Failure, File?>> pickImage(
    BuildContext context, {
    required bool fromCamera,
  }) async {
    try {
      final _pickedFile = await ImagePicker().pickImage(
        source: fromCamera ? ImageSource.camera : ImageSource.gallery,
        maxHeight: Sizes.pickedImageMaxSize(NavigationService.context),
        maxWidth: Sizes.pickedImageMaxSize(NavigationService.context),
      );
      return _pickedFile != null
          ? Right(File(_pickedFile.path))
          : const Right(null);
    } catch (e) {
      log(e.toString());
      final _failure = DefaultFailure(message: Exceptions.errorMessage(e));
      return Left(_failure);
    }
  }
}

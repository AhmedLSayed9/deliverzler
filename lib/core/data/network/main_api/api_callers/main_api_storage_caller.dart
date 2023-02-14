import 'dart:async';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../i_firebase_storage_caller.dart';
import '../extensions/firebase_error_extension.dart';

part 'main_api_storage_caller.g.dart';

//Our main API is Firebase
@Riverpod(keepAlive: true)
IFirebaseStorageCaller mainApiStorageCaller(MainApiStorageCallerRef ref) {
  return MainApiStorageCaller(
    firebaseStorage: FirebaseStorage.instance,
  );
}

class MainApiStorageCaller implements IFirebaseStorageCaller {
  MainApiStorageCaller({
    required this.firebaseStorage,
  });

  final FirebaseStorage firebaseStorage;

  @override
  Future<String> uploadImage({
    required String path,
    required File file,
  }) async {
    return await _tryCatchWrapper(
      () async {
        final uploadTask = firebaseStorage.ref().child(path).putFile(file);
        final downloadURL = await (await uploadTask).ref.getDownloadURL();
        return downloadURL;
      },
    );
  }

  @override
  Future<void> deleteImage({required String path}) async {
    return await _tryCatchWrapper(
      () async {
        return await firebaseStorage.ref().child(path).delete();
      },
    );
  }

  @override
  Future<void> deleteAllFolderImages({required String path}) async {
    return await _tryCatchWrapper(
      () async {
        return await firebaseStorage.ref().child(path).listAll().then(
          (result) {
            for (final file in result.items) {
              file.delete();
            }
          },
        );
      },
    );
  }

  FutureOr<T> _tryCatchWrapper<T>(FutureOr<T> Function() body) async {
    try {
      return await body();
    } on Exception catch (e) {
      throw e.firebaseErrorToServerException();
    }
  }
}

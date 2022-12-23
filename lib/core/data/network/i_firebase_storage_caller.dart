import 'dart:async';
import 'dart:io';

abstract class IFirebaseStorageCaller {
  Future<String> uploadImage({
    required String path,
    required File file,
  });

  Future<void> deleteImage({required String path});

  Future<void> deleteAllFolderImages({required String path});
}

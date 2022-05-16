import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class IFirebaseCaller {
  Future<T> setData<T>({
    required String path,
    required Map<String, dynamic> data,
    required T Function(dynamic data) builder,
    bool merge = false,
  });

  Future<T> updateData<T>({
    required String path,
    required Map<String, dynamic> data,
    required T Function(dynamic data) builder,
  });

  Future<void> deleteData({required String path});

  Future<String> addDataToCollection({
    required String path,
    required Map<String, dynamic> data,
  });

  Future<T> getData<T>({
    required String path,
    required T Function(dynamic data, String? documentId) builder,
  });

  Future<T> getCollectionData<T>({
    required String path,
    required Future<T> Function(
            List<QueryDocumentSnapshot<Map<String, dynamic>>>? data)
        builder,
    Query<Map<String, dynamic>>? Function(Query<Map<String, dynamic>> query)?
        queryBuilder,
  });

  Future deleteAllCollectionData<T>({
    required String path,
  });

  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
    Query<Map<String, dynamic>>? Function(Query<Map<String, dynamic>> query)?
        queryBuilder,
    int Function(T lhs, T rhs)? sort,
  });

  Stream<T> documentStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
  });

  /// FireBaseStorage
  Future<T> uploadImage<T>({
    required String path,
    required File file,
    required T Function(dynamic data) builder,
  });

  Future deleteImage({required String path});

  Future deleteAllFolderImages({required String path});
}

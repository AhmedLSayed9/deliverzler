import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class FirebaseCaller {
  FirebaseCaller._();

  static final instance = FirebaseCaller._();

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    final reference = _firebaseFirestore.doc(path);
    debugPrint('$path: $data');

    // set without merge will overwrite a document or create it if it doesn't exist yet
    // set with merge will update fields in the document or create it if it doesn't exists//
    // update will update fields but will fail if the document doesn't exist
    // create will create the document but fail if the document already exists

    await reference.set(data, SetOptions(merge: merge));
  }

  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = _firebaseFirestore.doc(path);
    debugPrint('$path: $data');
    await reference.update(data);
  }

  Future<void> deleteData({required String path}) async {
    final reference = _firebaseFirestore.doc(path);
    debugPrint('delete: $path');
    await reference.delete();
  }

  Future<String> addDataToCollection({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = _firebaseFirestore.collection(path);
    debugPrint('$path: $data');
    return await reference.add(data).then((value) => value.id);
  }

  Future<T> getData<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String? documentId) builder,
  }) async {
    final reference = _firebaseFirestore.doc(path);
    final value = await reference.get();
    if (value.exists) {
      return builder(value.data(), value.id);
    }
    return builder(null, null);
  }

  Future<T> getCollectionData<T>({
    required String path,
    required Future<T> Function(
            List<QueryDocumentSnapshot<Map<String, dynamic>>>? data)
        builder,
    Query<Map<String, dynamic>>? Function(Query<Map<String, dynamic>> query)?
        queryBuilder,
  }) async {
    Query<Map<String, dynamic>> query = _firebaseFirestore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }
    final value = await query.get();
    if (value.size > 0) {
      return builder(value.docs);
    }
    return builder(null);
  }

  Future deleteAllCollectionData<T>({
    required String path,
  }) async {
    final WriteBatch batch = FirebaseFirestore.instance.batch();
    const int batchSize = 100;
    bool lastBatch = false;

    Query<Map<String, dynamic>> query =
        _firebaseFirestore.collection(path).limit(batchSize);
    await query.get().then((snapshot) {
      if (snapshot.size < batchSize) {
        lastBatch = true;
      }
      for (DocumentSnapshot document in snapshot.docs) {
        batch.delete(document.reference);
      }
    });

    await batch.commit();
    if (!lastBatch) {
      await deleteAllCollectionData(path: path);
    }
    return batch.commit();
  }

  Stream<List<T>> collectionStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
    Query<Map<String, dynamic>>? Function(Query<Map<String, dynamic>> query)?
        queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query<Map<String, dynamic>> query = _firebaseFirestore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query)!;
    }

    final Stream<QuerySnapshot<Map<String, dynamic>>> snapshots =
        query.snapshots();

    return snapshots.map((snapshot) {
      final result = snapshot.docs
          .map((snapshot) => builder(snapshot.data(), snapshot.id))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }

  Stream<T> documentStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId) builder,
  }) {
    final DocumentReference<Map<String, dynamic>> reference =
        _firebaseFirestore.doc(path);
    final Stream<DocumentSnapshot<Map<String, dynamic>>> snapshots =
        reference.snapshots();
    return snapshots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }

  /// FireBaseStorage
  Future<String?> uploadImage(
      {required String path, required File file}) async {
    UploadTask _uploadTask = _firebaseStorage.ref().child(path).putFile(file);
    return await (await _uploadTask).ref.getDownloadURL();
  }

  Future deleteImage({required String path}) async {
    return await _firebaseStorage.ref().child(path).delete();
  }

  Future deleteAllFolderImages({required String path}) async {
    return await _firebaseStorage.ref().child(path).listAll().then((result) {
      for (var file in result.items) {
        file.delete();
      }
    });
  }
}

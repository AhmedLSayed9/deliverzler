import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverzler/core/errors/exceptions.dart';
import 'package:deliverzler/core/errors/failures.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseCaller {
  FirebaseCaller._();

  static final instance = FirebaseCaller._();

  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  // set without merge will overwrite a document or create it if it doesn't exist yet
  // set with merge will update fields in the document or create it if it doesn't exists//
  // update will update fields but will fail if the document doesn't exist
  // create will create the document but fail if the document already exists
  Future<T> setData<T>({
    required String path,
    required Map<String, dynamic> data,
    required T Function(dynamic data) builder,
    bool merge = false,
  }) async {
    try {
      final reference = _firebaseFirestore.doc(path);
      await reference.set(data, SetOptions(merge: merge));
      return builder(true);
    } catch (e) {
      log(e.toString());
      final _failure = ServerFailure(
        message: Exceptions.errorMessage(e),
        statusCode: Exceptions.statusCode(e),
      );
      return builder(_failure);
    }
  }

  Future<T> updateData<T>({
    required String path,
    required Map<String, dynamic> data,
    required T Function(dynamic data) builder,
  }) async {
    try {
      final reference = _firebaseFirestore.doc(path);
      await reference.update(data);
      return builder(true);
    } catch (e) {
      log(e.toString());
      final _failure = ServerFailure(
        message: Exceptions.errorMessage(e),
        statusCode: Exceptions.statusCode(e),
      );
      return builder(_failure);
    }
  }

  Future<void> deleteData({required String path}) async {
    final reference = _firebaseFirestore.doc(path);
    log('delete: $path');
    await reference.delete();
  }

  Future<String> addDataToCollection({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = _firebaseFirestore.collection(path);
    log('$path: $data');
    return await reference.add(data).then((value) => value.id);
  }

  Future<T> getData<T>({
    required String path,
    required T Function(dynamic data, String? documentId) builder,
  }) async {
    try {
      final reference = _firebaseFirestore.doc(path);
      final value = await reference.get();
      return builder(value.data(), value.id);
    } catch (e) {
      log(e.toString());
      final _failure = ServerFailure(
        message: Exceptions.errorMessage(e),
        statusCode: Exceptions.statusCode(e),
      );
      return builder(_failure, null);
    }
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
  Future<T> uploadImage<T>({
    required String path,
    required File file,
    required T Function(dynamic data) builder,
  }) async {
    try {
      UploadTask _uploadTask = _firebaseStorage.ref().child(path).putFile(file);
      final _downloadURL = await (await _uploadTask).ref.getDownloadURL();
      return builder(_downloadURL);
    } catch (e) {
      log(e.toString());
      final _failure = ServerFailure(
        message: Exceptions.errorMessage(e),
        statusCode: Exceptions.statusCode(e),
      );
      return builder(_failure);
    }
  }

  Future deleteImage({required String path}) async {
    return await _firebaseStorage.ref().child(path).delete();
  }

  Future deleteAllFolderImages({required String path}) async {
    return await _firebaseStorage.ref().child(path).listAll().then((result) {
      for (final file in result.items) {
        file.delete();
      }
    });
  }
}

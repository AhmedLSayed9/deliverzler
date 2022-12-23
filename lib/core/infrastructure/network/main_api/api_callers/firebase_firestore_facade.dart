import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../presentation/utils/riverpod_framework.dart';
import '../extensions/firebase_error_extension.dart';

part 'firebase_firestore_facade.g.dart';

typedef QueryBuilder = Query<Map<String, dynamic>> Function(
    Query<Map<String, dynamic>> reference);

//Our main API is Firebase
@Riverpod(keepAlive: true)
FirebaseFirestoreFacade firebaseFirestoreFacade(
    FirebaseFirestoreFacadeRef ref) {
  return FirebaseFirestoreFacade(
    firebaseFirestore: FirebaseFirestore.instance,
  );
}

class FirebaseFirestoreFacade {
  FirebaseFirestoreFacade({
    required this.firebaseFirestore,
  });

  final FirebaseFirestore firebaseFirestore;

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    bool merge = false,
  }) async {
    return await _tryCatchWrapper(
      () async {
        final reference = firebaseFirestore.doc(path);
        return await reference.set(data, SetOptions(merge: merge));
      },
    );
  }

  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    return await _tryCatchWrapper(
      () async {
        final reference = firebaseFirestore.doc(path);
        return await reference.update(data);
      },
    );
  }

  Future<void> deleteData({required String path}) async {
    return await _tryCatchWrapper(
      () async {
        final reference = firebaseFirestore.doc(path);
        return await reference.delete();
      },
    );
  }

  Future<String> addDataToCollection({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    return await _tryCatchWrapper(
      () async {
        final reference = firebaseFirestore.collection(path);
        return await reference.add(data).then((value) => value.id);
      },
    );
  }

  Future<DocumentSnapshot> getData({
    required String path,
  }) async {
    return await _tryCatchWrapper(
      () async {
        final reference = firebaseFirestore.doc(path);
        return await reference.get();
      },
    );
  }

  Future<QuerySnapshot> getCollectionData({
    required String path,
    QueryBuilder? queryBuilder,
  }) async {
    return await _tryCatchWrapper(
      () async {
        Query<Map<String, dynamic>> reference =
            firebaseFirestore.collection(path);
        if (queryBuilder != null) {
          reference = queryBuilder(reference);
        }
        return await reference.get();
      },
    );
  }

  Future<void> deleteAllCollectionData({
    required String path,
  }) async {
    return await _tryCatchWrapper(
      () async {
        final WriteBatch batch = FirebaseFirestore.instance.batch();
        const int batchSize = 100;
        bool lastBatch = false;

        final query = firebaseFirestore.collection(path).limit(batchSize);
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
        return await batch.commit();
      },
    );
  }

  Stream<QuerySnapshot> collectionStream({
    required String path,
    QueryBuilder? queryBuilder,
  }) {
    return _streamTryCatchWrapper(
      () {
        Query<Map<String, dynamic>> reference =
            firebaseFirestore.collection(path);
        if (queryBuilder != null) {
          reference = queryBuilder(reference);
        }
        return reference.snapshots();
      },
    );
  }

  Stream documentStream({
    required String path,
  }) {
    return _streamTryCatchWrapper(
      () {
        final reference = firebaseFirestore.doc(path);
        return reference.snapshots();
      },
    );
  }

  Future<T> _tryCatchWrapper<T>(Future<T> Function() body) async {
    try {
      return await body();
    } on Exception catch (e) {
      throw e.firebaseErrorToServerException();
    }
  }

  Stream<T> _streamTryCatchWrapper<T>(Stream<T> Function() body) {
    try {
      return body();
    } on Exception catch (e) {
      throw e.firebaseErrorToServerException();
    }
  }
}

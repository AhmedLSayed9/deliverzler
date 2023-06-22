import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../presentation/utils/riverpod_framework.dart';
import '../extensions/firebase_error_extension.dart';

part 'firebase_firestore_facade.g.dart';

typedef QueryBuilder = Query<Map<String, dynamic>> Function(
  Query<Map<String, dynamic>> reference,
);

//Our main API is Firebase
@Riverpod(keepAlive: true)
FirebaseFirestoreFacade firebaseFirestoreFacade(
  FirebaseFirestoreFacadeRef ref,
) {
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
    return _futureErrorHandler(
      () async {
        final reference = firebaseFirestore.doc(path);
        return reference.set(data, SetOptions(merge: merge));
      },
    );
  }

  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    return _futureErrorHandler(
      () async {
        final reference = firebaseFirestore.doc(path);
        return reference.update(data);
      },
    );
  }

  Future<void> deleteData({required String path}) async {
    return _futureErrorHandler(
      () async {
        final reference = firebaseFirestore.doc(path);
        return reference.delete();
      },
    );
  }

  Future<String> addDataToCollection({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    return _futureErrorHandler(
      () async {
        final reference = firebaseFirestore.collection(path);
        return reference.add(data).then((value) => value.id);
      },
    );
  }

  Future<DocumentSnapshot> getData({
    required String path,
  }) async {
    return _futureErrorHandler(
      () async {
        final reference = firebaseFirestore.doc(path);
        return reference.get();
      },
    );
  }

  Future<QuerySnapshot> getCollectionData({
    required String path,
    QueryBuilder? queryBuilder,
  }) async {
    return _futureErrorHandler(
      () async {
        Query<Map<String, dynamic>> reference = firebaseFirestore.collection(path);
        if (queryBuilder != null) {
          reference = queryBuilder(reference);
        }
        return reference.get();
      },
    );
  }

  Future<void> deleteAllCollectionData({
    required String path,
  }) async {
    return _futureErrorHandler(
      () async {
        final batch = FirebaseFirestore.instance.batch();
        const batchSize = 100;
        var lastBatch = false;

        final query = firebaseFirestore.collection(path).limit(batchSize);
        await query.get().then((snapshot) {
          if (snapshot.size < batchSize) {
            lastBatch = true;
          }
          for (final DocumentSnapshot document in snapshot.docs) {
            batch.delete(document.reference);
          }
        });

        await batch.commit();
        if (!lastBatch) {
          await deleteAllCollectionData(path: path);
        }
        return batch.commit();
      },
    );
  }

  Stream<QuerySnapshot> collectionStream({
    required String path,
    QueryBuilder? queryBuilder,
  }) {
    return _streamErrorHandler(
      () {
        Query<Map<String, dynamic>> reference = firebaseFirestore.collection(path);
        if (queryBuilder != null) {
          reference = queryBuilder(reference);
        }
        return reference.snapshots();
      },
    );
  }

  Stream<DocumentSnapshot<Map<String, dynamic>>> documentStream({
    required String path,
  }) {
    return _streamErrorHandler(
      () {
        final reference = firebaseFirestore.doc(path);
        return reference.snapshots();
      },
    );
  }

  Future<T> _futureErrorHandler<T>(Future<T> Function() body) async {
    try {
      return await body();
    } catch (e, st) {
      final error = e.firebaseErrorToServerException();
      throw Error.throwWithStackTrace(error, st);
    }
  }

  Stream<T> _streamErrorHandler<T>(Stream<T> Function() body) {
    return body().handleError((Object e, StackTrace st) {
      final error = e.firebaseErrorToServerException();
      throw Error.throwWithStackTrace(error, st);
    });
  }
}

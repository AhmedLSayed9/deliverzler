import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

typedef QueryBuilder = Query<Map<String, dynamic>> Function(
    Query<Map<String, dynamic>> reference);

abstract class IFirebaseFirestoreCaller {
  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
    bool merge = false,
  });

  Future<void> updateData({
    required String path,
    required Map<String, dynamic> data,
  });

  Future<void> deleteData({
    required String path,
  });

  Future<String> addDataToCollection({
    required String path,
    required Map<String, dynamic> data,
  });

  Future<DocumentSnapshot> getData({
    required String path,
  });

  Future<QuerySnapshot> getCollectionData({
    required String path,
    QueryBuilder? queryBuilder,
  });

  Future<void> deleteAllCollectionData({
    required String path,
  });

  Stream<QuerySnapshot> collectionStream({
    required String path,
    QueryBuilder? queryBuilder,
  });

  Stream documentStream({
    required String path,
  });
}

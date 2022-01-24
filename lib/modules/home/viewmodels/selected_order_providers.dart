import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:deliverzler/modules/home/models/order_model.dart';

final selectedOrderProvider = StateProvider<OrderModel?>((ref) => null);
final selectedOrderGeoPointProvider = StateProvider<GeoPoint?>((ref) => null);

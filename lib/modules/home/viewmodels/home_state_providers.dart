import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverzler/modules/home/models/order_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectedOrderProvider = StateProvider<OrderModel?>((ref) => null);
final selectedPlaceGeoPointProvider = StateProvider<GeoPoint?>((ref) => null);

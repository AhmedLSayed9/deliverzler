import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deliverzler/modules/home/models/order_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final currentLocationProvider = StateProvider<Position?>((ref) => null);
final selectedOrderProvider = StateProvider<OrderModel?>((ref) => null);
final selectedOrderGeoPointProvider = StateProvider<GeoPoint?>((ref) => null);
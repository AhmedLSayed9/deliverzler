import 'package:google_maps_flutter/google_maps_flutter.dart';

///change defaultLatLng to default country [LAT_LNG] if the user didn't provide any location
const LatLng defaultLatLng = LatLng(30.033333, 31.233334);
const googleMapAPIKey = 'EnterYourGoogleMapAPIKey';
const double defaultMapZoom = 17.0;
const double mediumMapZoom = 14.0;
const int locationChangeInterval = 10000; //in milliseconds
const double locationChangeDistance = 5.0; //in meters
const double locationArriveDistance = 200.0; //in meters

import 'package:google_maps_flutter/google_maps_flutter.dart';

///change defaultLatLng to default country [LAT_LNG] if the user didn't provide any location
const LatLng defaultLatLng = LatLng(30.033333, 31.233334);
const googleMapAPIKey = 'enterYouGoogleMapKey';
const double defaultMapZoom = 17.0;
const double mediumMapZoom = 14.0;

const int getLocationTimeLimit = 20; //in seconds
const int locationChangeInterval = 5; //in seconds
const int locationChangeDistance = 20; //in meters
const double locationArriveDistance = 200.0; //in meters

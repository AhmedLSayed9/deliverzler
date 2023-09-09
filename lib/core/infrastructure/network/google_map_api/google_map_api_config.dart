import 'package:flutter/foundation.dart';

class GoogleMapApiConfig {
  static const String googleMapBaseUrl = 'https://maps.googleapis.com/maps/api';

  // You should also restrict your API key by limiting which app can use it (Application restrictions)
  // & by limiting their usage to those only APIs needed for your application (API restrictions)
  // These restrictions is set in your Google Cloud console and is not exposed anywhere in your source code.
  // You can set one application restriction per key, so you need to create a separate API key for each app, and for each platform on which that app is available.
  // For more details: https://developers.google.com/maps/documentation/android-sdk/get-api-key#restrict_key
  static String get googleMapAPIKey =>
      defaultTargetPlatform == TargetPlatform.iOS ? _iosAPIKey : _androidAPIKey;

  static String get _androidAPIKey {
    const key = String.fromEnvironment('ANDROID_GOOGLE_MAPS_API_KEY');
    return key.isNotEmpty ? key : throw AssertionError('ANDROID_GOOGLE_MAPS_API_KEY is not set');
  }

  static String get _iosAPIKey {
    const key = String.fromEnvironment('IOS_GOOGLE_MAPS_API_KEY');
    return key.isNotEmpty ? key : throw AssertionError('IOS_GOOGLE_MAPS_API_KEY is not set');
  }

  static const googleMapAPIParamKey = 'key';

  static const withSessionTokenExtraKey = 'withSessionToken';
  static const sessionTokenHeaderKey = 'sessiontoken';
}
